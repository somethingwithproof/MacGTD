import os
from pathlib import Path
import plistlib
import shutil
import unittest
import uuid
import zipfile

from support.common import ROOT, command, dedicated, osa, wait_for


class Alfred(unittest.TestCase):
    def setUp(self):
        dedicated()
        self.token = "MacGTD-E2E-" + uuid.uuid4().hex
        # Preserve user configuration. A dedicated profile with no Inbox is required.
        self.list_id = osa('''tell application "Reminders"
            if exists list "Inbox" then error "Dedicated test account must start without Inbox"
            return id of (make new list with properties {name:"Inbox"})
        end tell''')
        self.addCleanup(osa, '''on run argv
            tell application "Reminders" to delete list id (item 1 of argv)
        end run''', self.list_id)
        command("bash", "scripts/package-alfred.sh")
        prefs = os.environ.get("MACGTD_ALFRED_PREFERENCES")
        if not prefs:
            prefs = str(Path.home() / "Library/Application Support/Alfred/Alfred.alfredpreferences")
        parent = Path(prefs) / "workflows"
        self.assertTrue(parent.is_dir(), "Configure Alfred Powerpack and the correct preferences path")
        self.destination = parent / ("user.workflow.macgtd-e2e-" + uuid.uuid4().hex)
        self.destination.mkdir()
        self.addCleanup(shutil.rmtree, self.destination)
        with zipfile.ZipFile(ROOT / "dist/MacGTD.alfredworkflow") as archive:
            archive.extractall(self.destination)
        # Give only the test copy a unique bundle ID and keywords; avoid triggering another installed version.
        info_file = self.destination / "info.plist"
        self.info = plistlib.loads(info_file.read_bytes())
        self.info["bundleid"] = "com.macgtd.e2e." + uuid.uuid4().hex
        self.keyword = "macgtd-e2e-" + uuid.uuid4().hex
        for obj in self.info["objects"]:
            if obj["type"] == "alfred.workflow.input.keyword":
                keyword = obj["config"]["keyword"]
                obj["config"]["keyword"] = self.keyword if keyword == "task" else self.keyword + "-" + keyword
        info_file.write_bytes(plistlib.dumps(self.info))
        command("open", "-a", "Alfred 5")

    def test_real_alfred_task_capture(self):
        # This deliberately exercises the packaged keyword/action connection, not a copied parser.
        osa('''on run argv
            tell application "Alfred 5" to search (item 1 of argv)
            delay 2
            tell application "System Events" to tell process "Alfred"
                set frontmost to true
                key code 36
            end tell
        end run''', self.keyword + " " + self.token)
        def created():
            return osa('''on run argv
                tell application "Reminders" to return count of (reminders in list id (item 1 of argv) whose name is (item 2 of argv))
            end run''', self.list_id, self.token, timeout=5) == "1"
        wait_for(created, timeout=20)
