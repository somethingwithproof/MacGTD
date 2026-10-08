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
        ratio = osa('''on run argv
            set manager to load script POSIX file (item 1 of argv)
            manager's writeNestedPreference("custom.ratio", 1.25)
            return manager's readNestedPreference("custom.ratio")
        end run''', self.compiled("preferences_manager.scpt"), env=self.env)
        self.assertEqual(ratio, "1.25")
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
        library = self.path / "GTDLib.scpt"
        command("osacompile", "-o", library, ROOT / "workflows/alfred/GTDLib.scptd/Contents/Resources/Scripts/main.applescript")
        self.assertEqual(osa('''on run argv
            set controller to load script POSIX file (item 1 of argv)
            set libraryObject to load script POSIX file (item 2 of argv)
            set info to libraryObject's sessionInfo(controller's readState(), "@test", 1)
            if class of (startTime of info) is not date then error "Session start must be a date"
            if class of (endTime of info) is not date then error "Session end must be a date"
            return (endTime of info) - (startTime of info)
        end run''', focus, library, env=self.env), "60")
        # A persisted session stopped after a day must not count a day as focused time.
        values["startTime"] -= 86400
        values["endTime"] -= 86400
        state.write_text(json.dumps(values), encoding="utf-8")
        self.assertEqual(command("osascript", focus, "stop", env=self.env)[0], "Focus session stopped")
        self.assertFalse(state.exists())
        self.assertEqual(command("osascript", focus, "status", env=self.env)[0], "No active focus session")
        entries = [json.loads(line) for line in (self.path / "state/focus_log.jsonl").read_text().splitlines()]
        self.assertEqual([e["event"] for e in entries], ["start", "complete"])
        self.assertEqual(entries[0]["task"], text)
        self.assertEqual(entries[-1]["actualSeconds"], 60)
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
        parent, user_setup = source.split("/bin/bash -s <<'USER_SETUP'", 1)
        user_setup, after = user_setup.split("\nUSER_SETUP", 1)
        self.assertIn("sudo -H -u ec2-user --preserve-env=", parent)
        self.assertNotIn("./config.sh", parent + after)
        child = self.path / "bootstrap-user.sh"
        child.write_text(user_setup, encoding="utf-8")
        command("bash", "-n", child)
        command("shellcheck", "-s", "bash", child)

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
                    set failureText to workflowAction's failureMessage("HTTP 401 fixture-token", "fixture-token")
                    if failureText does not contain "HTTP 401" then error "Provider failure reason lost"
                    if failureText contains "fixture-token" then error "Credential was not redacted"
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
                ROOT / "workflows/alfred/GTDLib.scptd/Contents/Resources/Scripts/main.applescript")
        value = 'O\'Brien "quoted" café'
        result = osa('''on run argv
            set libraryObject to load script POSIX file (item 1 of argv)
            libraryObject's _initialize()
            if libraryObject's mappedPriority(2) is not 5 then error "Wrong priority mapping"
            if libraryObject's mappedPriority(3) is not 9 then error "Wrong priority mapping"
            try
                libraryObject's createTask_withContext_priority_dueDate_("", missing value, 2, missing value)
                error "Empty task title accepted"
            on error messageText
                if messageText is not "Task title cannot be empty" then error messageText
            end try
            return libraryObject's _sanitizeString(item 2 of argv)
        end run''', compiled, value)
        self.assertEqual(result, value)

    def test_shipped_library_bundle_loads(self):
        bundle = ROOT / "workflows/alfred/GTDLib.scptd"
        result = osa('''on run argv
            set libraryObject to load script POSIX file (item 1 of argv)
            libraryObject's _initialize()
            return libraryObject's _sanitizeString("O'Brien")
        end run''', bundle)
        self.assertEqual(result, "O'Brien")

    def test_foundation_component_loads_preferences_through_plain_loader(self):
        for name in ("add_task.scpt", "focus_timer.scpt", "preferences_editor.scpt"):
            with self.subTest(component=name):
                result = osa('''on run argv
                    set outerComponent to load script POSIX file (item 1 of argv)
                    set manager to outerComponent's loadComponent(item 2 of argv)
                    return manager's readPreference("taskApp")
                end run''', self.compiled(name), SCRIPTS / "preferences_manager.scpt", env=self.env)
                self.assertEqual(result, "reminders")

    def test_calendar_parser_metadata_without_gui(self):
        bundle = ROOT / "workflows/apple/GTD-EventCapture.workflow/Contents/document.wflow"
        source = plistlib.loads(bundle.read_bytes())["actions"][0]["action"]["ActionParameters"]["source"]
        path = self.path / "event.applescript"
        path.write_text(source)
        compiled = self.path / "event.scpt"
        command("osacompile", "-o", compiled, path)
        result = osa('''on run argv
            set parser to load script POSIX file (item 1 of argv)
            set metadata to parser's parseEventInput("O'Brien café due:2030-05-20 14:15 45m @Conference Room")
            set d to eventStart of metadata
            return (eventTitle of metadata) & "|" & (time of d) & "|" & ((eventEnd of metadata) - d) & "|" & (eventLocation of metadata)
        end run''', compiled)
        self.assertEqual(result, "O'Brien café|51300|2700|Conference Room")
        _, code = command("osascript", "-", compiled, input='''on run argv
            set parser to load script POSIX file (item 1 of argv)
            parser's parseEventInput("Meeting tomorrow 0m")
        end run''', check=False)
        self.assertNotEqual(code, 0)

    def test_parser_sync_rejects_missing_entry_point(self):
        import sys
        script = self.path / "scripts/sync-native-parser.py"
        script.parent.mkdir(parents=True)
        script.write_text((ROOT / "scripts/sync-native-parser.py").read_text(encoding="utf-8"), encoding="utf-8")
        parser = self.path / "workflows/alfred/workflow/scripts/natural_language_task.scpt"
        parser.parent.mkdir(parents=True)
        parser.write_text("on run arguments\nreturn arguments\nend run\n", encoding="utf-8")
        with self.assertRaisesRegex(AssertionError, "exactly one replaceable"):
            command(sys.executable, script, "--check")
        self.assertFalse((self.path / "workflows/apple").exists())
