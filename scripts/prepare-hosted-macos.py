#!/usr/bin/env python3
"""Provision only GitHub's disposable macOS VM for native desktop tests.

GitHub's own runner image provisions TCC records similarly:
https://github.com/actions/runner-images/blob/main/images/macos/scripts/build/configure-tccdb-macos.sh
This script refuses local and self-hosted environments.
"""
import argparse
import os
from pathlib import Path
import plistlib
import sqlite3
import subprocess
import sys
import time

ROOT = Path(__file__).resolve().parents[1]


def require_hosted():
    if os.environ.get("GITHUB_ACTIONS") != "true" or os.environ.get("RUNNER_ENVIRONMENT") != "github-hosted":
        raise SystemExit("Desktop provisioning is restricted to GitHub-hosted disposable runners")
    if sys.platform != "darwin":
        raise SystemExit("A macOS runner is required")


def run(*args, check=True):
    result = subprocess.run(args, check=False, capture_output=True, text=True, timeout=60)
    if check and result.returncode:
        raise RuntimeError(f"Hosted preflight {args[0]} exited {result.returncode}: {result.stderr}")
    return result


def grant(database, clients):
    if not database.is_file():
        raise RuntimeError(f"TCC database is missing: {database}")
    targets = ("com.apple.reminders", "com.apple.iCal", "com.apple.systemevents", "com.apple.Automator")
    with sqlite3.connect(f"file:{database}?mode=rw", uri=True, timeout=15) as connection:
        columns = {row[1] for row in connection.execute("PRAGMA table_info(access)")}
        if not {"service", "client", "client_type", "auth_value"}.issubset(columns):
            raise RuntimeError("Unsupported TCC schema")
        for client, kind in clients:
            for service, target in [("kTCCServiceAccessibility", "UNUSED"),
                                    ("kTCCServiceReminders", "UNUSED"),
                                    ("kTCCServiceCalendar", "UNUSED")]+[("kTCCServiceAppleEvents", t) for t in targets]:
                values = {"service": service, "client": client, "client_type": kind,
                          "auth_value": 2, "auth_reason": 4, "auth_version": 1,
                          "csreq": None, "policy_id": None, "flags": 0,
                          "indirect_object_identifier_type": 0,
                          "indirect_object_identifier": target,
                          "indirect_object_code_identity": None,
                          "last_modified": int(time.time()), "pid": 0, "pid_version": 0,
                          "boot_uuid": "UNUSED", "last_reminded": int(time.time())}
                keys = [key for key in values if key in columns]
                # Column names come solely from this fixed allowlist; values are bound.
                statement = "INSERT OR REPLACE INTO access ("+",".join(keys)+") VALUES ("+",".join("?" for _ in keys)+")"
                connection.execute(statement, [values[key] for key in keys])


def main():
    require_hosted()
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--database", type=Path)
    parser.add_argument("--clients", type=Path)
    args = parser.parse_args()
    if args.database:
        if not args.clients:
            raise SystemExit("Client manifest is required")
        grant(args.database, plistlib.loads(args.clients.read_bytes()))
        return
    if os.geteuid() == 0:
        raise SystemExit("Run the coordinator as the normal GitHub runner user")
    results = ROOT / "test-results"
    results.mkdir(exist_ok=True)
    binaries = {"/bin/bash", "/bin/zsh", "/usr/bin/osascript", "/usr/bin/automator", str(Path(sys.executable).resolve()),
                "/opt/hca/hosted-compute-agent", "/opt/hca/start_hca.sh",
                "/usr/local/opt/runner/provisioner/provisioner", "/usr/local/opt/runner/runprovisioner.sh"}
    for line in run("ps", "-axo", "comm").stdout.splitlines():
        if "Runner.Worker" in line or "Runner.Listener" in line:
            if Path(line.strip()).is_file():
                binaries.add(line.strip())
    clients = [[binary, 1] for binary in sorted(binaries) if Path(binary).is_file()]
    clients += [[bundle, 0] for bundle in ("com.apple.Automator", "com.apple.AutomatorRunner", "com.apple.reminders", "com.apple.iCal")]
    manifest = results / "desktop-clients.plist"
    manifest.write_bytes(plistlib.dumps(clients))
    databases = [Path("/Library/Application Support/com.apple.TCC/TCC.db"),
                 Path.home() / "Library/Application Support/com.apple.TCC/TCC.db"]
    for database in databases:
        run("sudo", "env", "GITHUB_ACTIONS=true", "RUNNER_ENVIRONMENT=github-hosted",
            sys.executable, str(Path(__file__).resolve()), "--database", str(database), "--clients", str(manifest))
    # Refresh only this disposable VM's permission daemon; preflight verifies grants.
    run("sudo", "killall", "tccd", check=False)
    run("open", "-a", "Reminders")
    run("open", "-a", "Calendar")
    time.sleep(2)
    preflight = run("osascript", "-e", 'tell application "System Events" to return UI elements enabled').stdout.strip()
    if preflight != "true":
        raise RuntimeError("Hosted runner Accessibility permission is unavailable")
    # A hosted image may ship an empty Inbox. Remove only that disposable empty fixture.
    run("osascript", "-e", '''tell application "Reminders"
        if exists list "Inbox" then
            if count of reminders of list "Inbox" is not 0 then error "Unexpected pre-existing runner reminders"
            delete list "Inbox"
        end if
        set probe to make new list with properties {name:"MacGTD-hosted-preflight"}
        delete probe
    end tell''')
    run("osascript", "-e", '''tell application "Calendar"
        if count of calendars is 0 then make new calendar with properties {name:"MacGTD-hosted-calendar"}
        return name of first calendar whose writable is true
    end tell''')
    (results / "desktop-preflight.txt").write_text("GitHub-hosted native desktop prerequisites passed\n")
    print("GitHub-hosted native desktop prerequisites passed")


if __name__ == "__main__":
    main()
