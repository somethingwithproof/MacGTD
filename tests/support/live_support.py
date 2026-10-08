"""Live tests use dedicated targets, never log tokens, and remove only owned records."""
from contextlib import contextmanager
import json
import os
from pathlib import Path
import plistlib
import re
import shutil
import tempfile
from urllib.error import HTTPError, URLError
from urllib.parse import quote
import urllib.request
import uuid

from support.common import ROOT, command

REQUIRED = {
    "todoist": ("MACGTD_TODOIST_TOKEN", "MACGTD_TODOIST_PROJECT_ID"),
    "notion": ("MACGTD_NOTION_TOKEN", "MACGTD_NOTION_DATA_SOURCE_ID"),
    "microsoft": ("MACGTD_MICROSOFT_TOKEN", "MACGTD_MICROSOFT_LIST_ID"),
    "google": ("MACGTD_GOOGLE_TOKEN",),
}


def identifier_from_output(output):
    matches = re.findall(r'(?m)^\s*\{?\s*"?([A-Za-z0-9_+/=-]{6,})"?\s*\}?\s*$', output)
    if len(matches) != 1:
        raise AssertionError("Automator must return exactly one created record ID")
    return matches[0]


def request(provider, url, method="GET", body=None):
    origins = {"todoist": "https://api.todoist.com/", "notion": "https://api.notion.com/",
               "microsoft": "https://graph.microsoft.com/", "google": "https://keep.googleapis.com/"}
    if not url.startswith(origins[provider]):
        raise AssertionError("Unexpected live API origin")
    headers = {"Authorization": "Bearer " + os.environ[REQUIRED[provider][0]], "Content-Type": "application/json"}
    if provider == "notion":
        headers["Notion-Version"] = "2026-03-11"
    data = json.dumps(body).encode() if body is not None else None
    req = urllib.request.Request(url, headers=headers, method=method, data=data)
    # Reject redirects rather than forwarding authentication to another origin.
    class NoRedirect(urllib.request.HTTPRedirectHandler):
        def redirect_request(self, *args):
            return None
    try:
        with urllib.request.build_opener(NoRedirect()).open(req, timeout=30) as response:
            content = response.read()
            return json.loads(content) if content else None
    except HTTPError as exc:
        raise AssertionError(f"{provider} live API returned HTTP {exc.code}") from None
    except URLError:
        raise AssertionError(f"{provider} live API transport failed") from None


@contextmanager
def credential_bundle(provider):
    """Transient Keychain entries reach launchd-launched Automator without env assumptions."""
    service = "MacGTD-Live-" + uuid.uuid4().hex
    names = REQUIRED[provider]
    accounts = {"todoist": ("api-token", "project-id"), "notion": ("api-token", "data-source-id"),
                "microsoft": ("api-token", "list-id"), "google": ("api-token",)}[provider]
    stored = []
    with tempfile.TemporaryDirectory(prefix="macgtd-live-bundle-") as directory:
        source = next((ROOT / "workflows" / provider).glob("*.workflow"))
        target = Path(shutil.copytree(source, os.path.join(directory, source.name)))
        try:
            for name, account in zip(names, accounts):
                command("security", "add-generic-password", "-s", service, "-a", account,
                        "-w", os.environ[name], "-T", "/usr/bin/security", log_output=False)
                stored.append(account)
            document = target / "Contents/document.wflow"
            data = plistlib.loads(document.read_bytes())
            parameters = data["actions"][0]["action"]["ActionParameters"]
            parameters["source"], count = re.subn(r'^property keychainService : ".*"$',
                                                  f'property keychainService : "{service}"',
                                                  parameters["source"], flags=re.MULTILINE)
            assert count == 1
            # Prevent ambient runner env taking precedence over isolated credentials.
            parameters["source"] = parameters["source"].replace('if environmentName is not "" then', 'if false then', 1)
            document.write_bytes(plistlib.dumps(data, sort_keys=False))
            yield target
        finally:
            for account in stored:
                command("security", "delete-generic-password", "-s", service, "-a", account, log_output=False)
