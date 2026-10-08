"""Licensed app E2E for a dedicated logged-in Mac; missing apps fail, never skip."""
import unittest
import uuid

from support.common import ROOT, dedicated, osa, wait_for
from support.gui import workflow


class DesktopIntegrations(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        dedicated()
        for bundle_id in ("com.culturedcode.ThingsMac", "com.omnigroup.OmniFocus4"):
            available = osa('''use framework "AppKit"
                on run argv
                    return (current application's NSWorkspace's sharedWorkspace()'s URLForApplicationWithBundleIdentifier:(item 1 of argv)) is not missing value
                end run''', bundle_id)
            if available != "true":
                raise AssertionError("Install and license Things 3 and OmniFocus 4 in the dedicated test account")

    def test_things_workflow_persists_and_cleans_up_task(self):
        title = "MacGTD-Live-" + uuid.uuid4().hex
        readback = '''on run argv
            tell application "Things3"
                set matches to to dos whose name is item 1 of argv
                if count of matches is 0 then return "pending"
                if count of matches is not 1 then error "Expected one owned Things task"
                return id of item 1 of matches
            end tell
        end run'''
        workflow(next((ROOT / "workflows/things").glob("*.workflow")),
                 [{"text": title + " due:2030-05-20", "expected": "Things GTD Quick Capture"}])
        wait_for(lambda: osa(readback, title) != "pending", timeout=20)
        identifier = osa(readback, title)
        self.addCleanup(osa, '''on run argv
            tell application "Things3"
                set ownedTask to to do id (item 1 of argv)
                if name of ownedTask is not item 2 of argv then error "Cleanup ownership mismatch"
                delete ownedTask
            end tell
        end run''', identifier, title)
        self.assertEqual(osa('''on run argv
            tell application "Things3" to return name of to do id (item 1 of argv)
        end run''', identifier), title)

    def test_omnifocus_workflow_persists_and_cleans_up_task(self):
        title = "MacGTD-Live-" + uuid.uuid4().hex
        readback = '''on run argv
            tell application "OmniFocus" to tell default document
                set matches to flattened tasks whose name is item 1 of argv
                if count of matches is 0 then return "pending"
                if count of matches is not 1 then error "Expected one owned OmniFocus task"
                return id of item 1 of matches
            end tell
        end run'''
        workflow(next((ROOT / "workflows/omnifocus").glob("*.workflow")),
                 [{"text": title + " !1 due:2030-05-20", "expected": "OmniFocus GTD Quick Capture"}])
        wait_for(lambda: osa(readback, title) != "pending", timeout=20)
        identifier = osa(readback, title)
        self.addCleanup(osa, '''on run argv
            tell application "OmniFocus" to tell default document
                set ownedTask to task id (item 1 of argv)
                if name of ownedTask is not item 2 of argv then error "Cleanup ownership mismatch"
                delete ownedTask
            end tell
        end run''', identifier, title)
        self.assertEqual(osa('''on run argv
            tell application "OmniFocus" to tell default document
                set ownedTask to task id (item 1 of argv)
                if due date of ownedTask is missing value then error "Due date not persisted"
                return flagged of ownedTask
            end tell
        end run''', identifier), "true")
