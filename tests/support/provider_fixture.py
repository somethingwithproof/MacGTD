"""TLS contract fixture. Requests never reach vendor hosts and use synthetic tokens."""
from contextlib import contextmanager
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
import json
import os
from pathlib import Path
import plistlib
import shutil
import ssl
import sys
import tempfile
import threading
import time
import urllib.request
import uuid

from support.common import ROOT, command

PROVIDERS = {
    "todoist": ("https://api.todoist.com", "/api/v1/tasks", "Todoist"),
    "notion": ("https://api.notion.com", "/v1/pages", "Notion"),
    "microsoft": ("https://graph.microsoft.com", "/v1.0/me/todo/lists/fixture-list/tasks", "Microsoft To Do"),
    "google": ("https://keep.googleapis.com", "/v1/notes", "Google Keep"),
}
SOURCE_ID = "11111111-1111-4111-8111-111111111111"
DATABASE_ID = "22222222-2222-4222-8222-222222222222"


class Fixture:
    def __enter__(self):
        self.directory = tempfile.TemporaryDirectory(prefix="macgtd-api-fixture-")
        self.path = Path(self.directory.name)
        config = self.path / "tls.cnf"
        config.write_text("[req]\ndistinguished_name=dn\nx509_extensions=ext\nprompt=no\n"
                          "[dn]\nCN=localhost\n[ext]\nsubjectAltName=DNS:localhost,IP:127.0.0.1\n", encoding="utf-8")
        self.cert, key = self.path / "cert.pem", self.path / "key.pem"
        command("openssl", "req", "-x509", "-newkey", "rsa:2048", "-nodes", "-days", "1",
                "-config", config, "-keyout", key, "-out", self.cert, log_output=False)
        self.records = {}
        self.requests = []
        self.scenario = "success"
        fixture = self

        class Handler(BaseHTTPRequestHandler):
            def log_message(self, *args):
                pass

            def respond(self, code, body):
                content = json.dumps(body).encode()
                self.send_response(code)
                self.send_header("Content-Type", "application/json")
                self.send_header("Content-Length", str(len(content)))
                self.end_headers()
                self.wfile.write(content)

            def do_GET(self):
                if self.path.startswith("/v1/databases/"):
                    sources = [{"id": SOURCE_ID}]
                    if fixture.scenario == "multiple-sources":
                        sources.append({"id": DATABASE_ID})
                    return self.respond(200, {"object": "database", "id": DATABASE_ID, "data_sources": sources})
                if self.path in fixture.records:
                    return self.respond(200, fixture.records[self.path])
                self.respond(404, {"error": "not_found"})

            def do_DELETE(self):
                if self.path not in fixture.records:
                    return self.respond(404, {"error": "not_found"})
                del fixture.records[self.path]
                self.respond(200, {})

            def do_POST(self):
                payload = json.loads(self.rfile.read(int(self.headers.get("Content-Length", "0"))))
                fixture.requests.append((self.path, payload, self.headers.get("Notion-Version")))
                if fixture.scenario == "timeout":
                    time.sleep(35)
                    try:
                        self.respond(408, {"error": "fixture_timeout"})
                    except (BrokenPipeError, ConnectionResetError, ssl.SSLError):
                        pass
                    return
                if self.headers.get("Authorization") != "Bearer fixture-token":
                    return self.respond(401, {"error": "invalid synthetic token"})
                if fixture.scenario == "auth-failure":
                    return self.respond(401, {"error": "unauthorized", "message": "rejected fixture-token"})
                if fixture.scenario == "rate-limit":
                    return self.respond(429, {"error": "rate_limited"})
                if fixture.scenario == "invalid-confirmation":
                    return self.respond(200, {"id": None, "name": None})
                provider = next((name for name, (_, path, _) in PROVIDERS.items() if self.path == path), None)
                if provider is None:
                    return self.respond(404, {"error": "Unexpected production endpoint"})
                if provider == "notion":
                    if self.headers.get("Notion-Version") != "2026-03-11":
                        return self.respond(400, {"error": "Old Notion version"})
                    if payload.get("parent") != {"type": "data_source_id", "data_source_id": SOURCE_ID}:
                        return self.respond(400, {"error": "Legacy Notion parent"})
                record = dict(payload, id=uuid.uuid4().hex)
                if provider == "notion":
                    record["object"] = "page"
                if provider == "google":
                    record["name"] = "notes/" + record.pop("id")
                    record_path = "/v1/" + record["name"]
                else:
                    record_path = self.path + "/" + record["id"]
                fixture.records[record_path] = record
                self.respond(200, record)

        self.server = ThreadingHTTPServer(("127.0.0.1", 0), Handler)
        tls = ssl.SSLContext(ssl.PROTOCOL_TLS_SERVER)
        tls.minimum_version = ssl.TLSVersion.TLSv1_2
        tls.load_cert_chain(self.cert, key)
        self.server.socket = tls.wrap_socket(self.server.socket, server_side=True)
        self.thread = threading.Thread(target=self.server.serve_forever, daemon=True)
        self.thread.start()
        self.base = f"https://localhost:{self.server.server_port}"
        self.context = ssl.create_default_context(cafile=str(self.cert))
        self.curl = self.path / "fixture-curl"
        # Only rewrite known production origins; real curl verifies the fixture certificate.
        wrapper = '''import os, subprocess, sys
from urllib.parse import urlsplit
args = sys.argv[1:]
allowed = {"api.todoist.com", "api.notion.com", "graph.microsoft.com", "keep.googleapis.com"}
urls = [i for i, arg in enumerate(args) if arg.startswith("https://")]
if len(urls) != 1:
    raise SystemExit("Expected one production HTTPS URL")
i = urls[0]
url = urlsplit(args[i])
if url.hostname not in allowed or url.port is not None or url.username is not None or url.fragment:
    raise SystemExit("Unexpected production origin")
args[i] = os.environ["MACGTD_FIXTURE_BASE"] + url.path + ("?" + url.query if url.query else "")
raise SystemExit(subprocess.call(["/usr/bin/curl", "--cacert", os.environ["MACGTD_FIXTURE_CERT"], *args]))
'''
        wrapper = wrapper.replace('os.environ["MACGTD_FIXTURE_BASE"]', repr(self.base))
        wrapper = wrapper.replace('os.environ["MACGTD_FIXTURE_CERT"]', repr(str(self.cert)))
        self.curl.write_text("#!" + sys.executable + "\n" + wrapper, encoding="utf-8")
        self.curl.chmod(0o700)
        self.env = {"MACGTD_FIXTURE_BASE": self.base, "MACGTD_FIXTURE_CERT": str(self.cert),
                    "MACGTD_NOTION_DATA_SOURCE_ID": SOURCE_ID,
                    "MACGTD_NOTION_DATABASE_ID": DATABASE_ID,
                    "MACGTD_MICROSOFT_LIST_ID": "fixture-list",
                    "MACGTD_TODOIST_PROJECT_ID": "fixture-project"}
        for provider in PROVIDERS:
            self.env[f"MACGTD_{provider.upper()}_TOKEN"] = "fixture-token"
        return self

    def __exit__(self, *args):
        self.server.shutdown()
        self.server.server_close()
        self.thread.join(timeout=5)
        self.directory.cleanup()

    def request(self, path, method="GET"):
        request = urllib.request.Request(self.base + path, method=method)
        with urllib.request.urlopen(request, context=self.context, timeout=10) as response:
            return json.load(response)

    @contextmanager
    def bundle(self, provider):
        source = next((ROOT / "workflows" / provider).glob("*.workflow"))
        target = self.path / (provider + ".workflow")
        shutil.copytree(source, target)
        try:
            document = target / "Contents/document.wflow"
            data = plistlib.loads(document.read_bytes())
            parameters = data["actions"][0]["action"]["ActionParameters"]
            original = 'property curlExecutable : "/usr/bin/curl"'
            assert parameters["source"].count(original) == 1
            parameters["source"] = parameters["source"].replace(original, f'property curlExecutable : "{self.curl}"')
            # Automator Runner can be launched by launchd and does not inherit CLI env.
            # Inject synthetic configuration only in this isolated test copy.
            fixture_config = []
            for name, default in self.env.items():
                if name.startswith("MACGTD_FIXTURE"):
                    continue
                value = os.environ.get(name, default).replace('\\', '\\\\').replace('"', '\\"')
                fixture_config.append(f'    if environmentName is "{name}" then return "{value}"')
            marker = "on configuration(environmentName, accountName)\n"
            assert parameters["source"].count(marker) == 1
            parameters["source"] = parameters["source"].replace(marker, marker + "\n".join(fixture_config) + "\n")
            document.write_bytes(plistlib.dumps(data, sort_keys=False))
            yield target
        finally:
            shutil.rmtree(target)
