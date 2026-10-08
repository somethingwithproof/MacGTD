"""Production component regressions using isolated preferences/state, without GUI mutation."""
import json
import os
from pathlib import Path
import plistlib
import tempfile
import unittest

from support.common import ROOT, command, osa

SCRIPTS = ROOT / "workflows/alfred/workflow/scripts"


class Components(unittest.TestCase):
    def setUp(self):
        self.directory = tempfile.TemporaryDirectory(prefix="macgtd-components-")
        self.addCleanup(self.directory.cleanup)
        self.path = Path(self.directory.name)
        self.env = dict(os.environ, MACGTD_PREFERENCES_PATH=str(self.path / "preferences.plist"),
                        MACGTD_STATE_DIR=str(self.path / "state"), MACGTD_SCRIPT_DIR=str(SCRIPTS))

    def compiled(self, name):
        output = self.path / name
        command("osacompile", "-o", output, SCRIPTS / name)
        return output

    def prefs(self, *args, check=True):
        return command("osascript", self.compiled("preferences_manager.scpt"), *args,
                       env=self.env, check=check)[0]

    def test_preferences_defaults_round_trip_reset_and_invalid_import(self):
        self.prefs("init")
        self.assertEqual(self.prefs("read", "taskServices.defaultService"), "reminders")
        value = "O'Brien \"quoted\" café\nsecond line"
        self.prefs("write", "custom.note", value)
        self.assertEqual(self.prefs("read", "custom.note"), value)
        self.prefs("write", "focusMode.defaultDuration", "42")
        self.assertEqual(self.prefs("read", "focusMode.defaultDuration"), "42")
        self.prefs("write", "taskServices.defaultService", "things")
        self.assertEqual(self.prefs("read", "taskApp"), "things")
        self.prefs("write", "taskApp", "reminders")
        self.assertEqual(self.prefs("read", "taskServices.defaultService"), "reminders")
        before = (self.path / "preferences.plist").read_bytes()
        invalid = self.path / "invalid.plist"
        invalid.write_bytes(plistlib.dumps({"focusMode": {"defaultDuration": -4}}))
        _, code = command("osascript", self.compiled("preferences_manager.scpt"), "import", invalid,
                          env=self.env, check=False)
        self.assertNotEqual(code, 0)
        self.assertEqual((self.path / "preferences.plist").read_bytes(), before)
        exported = self.path / "export.plist"
        self.prefs("export", exported)
        self.prefs("reset")
        self.assertEqual(self.prefs("read", "focusMode.defaultDuration"), "25")
        self.prefs("import", exported)
        self.assertEqual(self.prefs("read", "focusMode.defaultDuration"), "42")

    def test_corrupt_preferences_fail_without_overwriting(self):
        path = self.path / "preferences.plist"
        path.write_text("broken preferences")
        _, code = command("osascript", self.compiled("preferences_manager.scpt"), "init",
                          env=self.env, check=False)
        self.assertNotEqual(code, 0)
        self.assertEqual(path.read_text(), "broken preferences")

    def test_focus_persistence_ownership_json_and_stop(self):
        focus = self.compiled("focus_mode.scpt")
        text = 'O\'Brien "quoted" café\nsecond line'
        osa('''on run argv
            set controller to load script POSIX file (item 1 of argv)
            set timerEnabled of controller to false
            controller's startFocusWithTask("@test", item 2 of argv, "fixture-task", "fixture-list", 1)
            return controller's getFocusStatus()
        end run''', focus, text, env=self.env)
        state = self.path / "state/focus-session.json"
        values = json.loads(state.read_text())
        self.assertEqual(values["task"], text)
        self.assertIn(text, command("osascript", focus, "status", env=self.env)[0])
        # Loading a fresh component cannot forget the existing session.
        _, code = command("osascript", "-", focus, input='''on run argv
            set controller to load script POSIX file (item 1 of argv)
            set timerEnabled of controller to false
            controller's startFocusWithTask("@test", "second task", "second", "fixture-list", 1)
        end run''', env=self.env, check=False)
        self.assertNotEqual(code, 0)
        self.assertEqual(json.loads(state.read_text())["sessionId"], values["sessionId"])
        response = osa('''on run argv
            set controller to load script POSIX file (item 1 of argv)
            return controller's finishTimer("stale-session")
        end run''', focus, env=self.env)
        self.assertEqual(response, "Stale timer ignored")
        self.assertTrue(state.exists())
        self.assertEqual(command("osascript", focus, "stop", env=self.env)[0], "Focus session stopped")
        self.assertFalse(state.exists())
        self.assertEqual(command("osascript", focus, "status", env=self.env)[0], "No active focus session")
        entries = [json.loads(line) for line in (self.path / "state/focus_log.jsonl").read_text().splitlines()]
        self.assertEqual([e["event"] for e in entries], ["start", "complete"])
        self.assertEqual(entries[0]["task"], text)
        report = command("osascript", self.compiled("focus_analytics.scpt"), "report", env=self.env)[0]
        self.assertIn("Focus sessions: 1", report)

    def test_clipboard_feedback_is_serialized_without_creating_tasks(self):
        response = osa('''on run argv
            set capture to load script POSIX file (item 1 of argv)
            return capture's feedback("Captured", item 2 of argv, true)
        end run''', self.compiled("clipboard_capture.scpt"), 'O\'Brien "quoted"\\\nHej världen')
        payload = json.loads(response)
        self.assertEqual(payload["items"][0]["subtitle"], 'O\'Brien "quoted"\\\nHej världen')
        self.assertIs(payload["items"][0]["valid"], True)

    def test_bootstrap_is_valid_shell_after_template_rendering(self):
        source = (ROOT / "infra/terraform/templates/bootstrap.sh.tpl").read_text()
        for name in ("github_token", "github_repo", "runner_name", "runner_labels", "alfred_license"):
            source = source.replace("${" + name + "}", "fixture")
        source = source.replace("$${", "${")
        rendered = self.path / "bootstrap.sh"
        rendered.write_text(source)
        command("bash", "-n", rendered)
        command("shellcheck", rendered)

    def test_api_transport_preserves_json_as_one_argument(self):
        import sys
        curl = self.path / "fixture-curl"
        captured = self.path / "argv.json"
        response = {"id": "fixture-id", "content": "fixture-task", "object": "page", "properties": {}}
        curl.write_text("#!"+sys.executable+"\nimport json,sys\nfrom pathlib import Path\n"
                        +"Path("+repr(str(captured))+").write_text(json.dumps(sys.argv[1:]))\n"
                        +"print("+repr(json.dumps(response))+")\n")
        curl.chmod(0o755)
        payload = json.dumps({"content": 'O\'Brien "quoted" café\nsecond line'})
        for platform in ("todoist", "notion"):
            with self.subTest(platform=platform):
                bundle = next((ROOT / "workflows" / platform).glob("*.workflow"))
                source = plistlib.loads((bundle / "Contents/document.wflow").read_bytes())["actions"][0]["action"]["ActionParameters"]["source"]
                path = self.path / (platform+".applescript")
                path.write_text(source)
                compiled = self.path / (platform+".scpt")
                command("osacompile", "-o", compiled, path)
                result = osa('''on run argv
                    set workflowAction to load script POSIX file (item 1 of argv)
                    set curlExecutable of workflowAction to item 2 of argv
                    set responseText to workflowAction's requestPayload("fixture-token", item 3 of argv)
                    if not workflowAction's confirmedResponse(responseText) then error "Valid fixture response rejected"
                    if workflowAction's confirmedResponse(item 4 of argv) then error "Error response accepted"
                    return responseText
                end run''', compiled, curl, payload, json.dumps({"id": "request-id", "object": "error"}))
                self.assertEqual(json.loads(result)["id"], "fixture-id")
                arguments = json.loads(captured.read_text())
                self.assertEqual(arguments[arguments.index("--data-binary")+1], payload)
                self.assertIn("Authorization: Bearer fixture-token", arguments)
                self.assertEqual(arguments.count(payload), 1)

    def test_library_initialization_and_title_preservation(self):
        compiled = self.path / "GTDLib.scpt"
        command("osacompile", "-o", compiled,
                ROOT / "workflows/alfred/GTDLib.scptd/Contents/Resources/Scripts/main.scpt")
        value = 'O\'Brien "quoted" café'
        result = osa('''on run argv
            set libraryObject to load script POSIX file (item 1 of argv)
            libraryObject's _initialize()
            if libraryObject's mappedPriority(2) is not 5 then error "Wrong priority mapping"
            if libraryObject's mappedPriority(3) is not 9 then error "Wrong priority mapping"
            return libraryObject's _sanitizeString(item 2 of argv)
        end run''', compiled, value)
        self.assertEqual(result, value)
