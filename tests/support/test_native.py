from datetime import date, timedelta
import unittest
import uuid

from support.common import ROOT, command, dedicated, osa
from support.gui import workflow

REMINDERS = '''on run argv
    tell application "Reminders"
        set targetList to list id (item 1 of argv)
        set operation to item 2 of argv
        if operation is "count" then return count of reminders of targetList
        if operation is "clear" then
            delete every reminder of targetList
            return "cleared"
        end if
        set taskName to item 3 of argv
        set matches to reminders of targetList whose name is taskName
        if (count of matches) is not 1 then error "Expected exactly one reminder: " & taskName
        set r to item 1 of matches
        if operation is "priority" then return priority of r
        if operation is "completed" then return completed of r
        if operation is "complete" then
            set completed of r to true
            return completed of r
        end if
        if operation is "date" then
            set d to due date of r
            if d is missing value then return "none"
            return (year of d as text) & "-" & text -2 thru -1 of ("0" & (month of d as integer)) & "-" & text -2 thru -1 of ("0" & day of d)
        end if
    end tell
end run'''


class Native(unittest.TestCase):
    def setUp(self):
        dedicated()
        # Existing Inbox is never borrowed, renamed, or deleted.
        self.list_id = osa('''tell application "Reminders"
            if exists list "Inbox" then error "Dedicated test account must start without an Inbox list"
            return id of (make new list with properties {name:"Inbox"})
        end tell''')
        self.addCleanup(osa, '''on run argv
            tell application "Reminders" to delete list id (item 1 of argv)
        end run''', self.list_id)
        self.token = "MacGTD-E2E-" + uuid.uuid4().hex

    def query(self, operation, name=""):
        return osa(REMINDERS, self.list_id, operation, name)

    def run_capture(self, bundle, text=None, button="OK", cancel=False):
        titles = {"GTD-QuickCapture": "Quick Capture", "GTD-BatchCapture": "GTD Batch Capture"}
        responses = [] if text is None else [{"text": text, "button": button, "expected": titles[bundle]}]
        workflow(ROOT / "workflows/apple" / (bundle + ".workflow"), responses, cancel=cancel)

    def test_quick_capture_priorities_and_completion(self):
        for marker, priority in (("!1", 1), ("!2", 5), ("!3", 9), ("", 0)):
            with self.subTest(priority=priority):
                self.query("clear")
                self.run_capture("GTD-QuickCapture", f"{self.token} {marker}")
                self.assertEqual(self.query("count"), "1")
                self.assertEqual(self.query("priority", self.token), str(priority))
                self.assertEqual(self.query("completed", self.token), "false")
                self.assertEqual(self.query("complete", self.token), "true")

    def test_quick_capture_due_dates(self):
        for marker, expected in (("today", date.today()), ("tomorrow", date.today() + timedelta(days=1)),
                                 ("2030-05-20", date(2030, 5, 20))):
            with self.subTest(date=marker):
                self.query("clear")
                self.run_capture("GTD-QuickCapture", f"{self.token} due:{marker}")
                self.assertEqual(self.query("date", self.token), expected.isoformat())

    def test_quick_capture_blank_and_cancel(self):
        self.run_capture("GTD-QuickCapture", "")
        self.assertEqual(self.query("count"), "0")
        self.run_capture("GTD-QuickCapture", self.token, "Cancel", cancel=True)
        self.assertEqual(self.query("count"), "0")

    def test_project_routing(self):
        project = self.token + "Project"
        # Clean up only this generated project; capture may create it before failure.
        self.addCleanup(osa, '''on run argv
            tell application "Reminders"
                if exists list (item 1 of argv) then delete list (item 1 of argv)
            end tell
        end run''', project)
        self.run_capture("GTD-QuickCapture", f"{self.token} +{project}")
        target = osa('''on run argv
            tell application "Reminders" to return id of list (item 1 of argv)
        end run''', project)
        self.assertEqual(osa(REMINDERS, target, "count", ""), "1")
        self.assertEqual(osa(REMINDERS, target, "priority", self.token), "0")
        self.assertEqual(self.query("count"), "0")

    def test_clipboard_empty_unicode_and_truncation(self):
        # The account is dedicated; restore its clipboard nevertheless.
        previous = command("pbpaste", strip=False, log_output=False)[0]
        self.addCleanup(command, "pbcopy", input=previous)
        for text, expected, priority in (("", None, 0), (self.token + ' Hej världen "quoted" !2',
                                         self.token + ' Hej världen "quoted"', 5),
                                        ("x" * 600, "x" * 500 + "...", 0)):
            with self.subTest(length=len(text)):
                self.query("clear")
                command("pbcopy", input=text)
                self.run_capture("GTD-ClipboardCapture")
                self.assertEqual(self.query("count"), "0" if expected is None else "1")
                if expected is not None:
                    self.assertEqual(self.query("priority", expected), str(priority))

    def test_batch_capture_blank_lines_and_priorities(self):
        self.run_capture("GTD-BatchCapture", f"{self.token}A !1\r\r{self.token}B !2\r{self.token}C !3", "Add Tasks")
        self.assertEqual(self.query("count"), "3")
        for suffix, priority in (("A", 1), ("B", 5), ("C", 9)):
            self.assertEqual(self.query("priority", self.token + suffix), str(priority))

    def test_weekly_review_all_steps_and_brain_dump(self):
        responses = [{"button": "Next", "expected": "GTD Weekly Review", "step": f"STEP {n}:"}
                     for n in range(1, 5)]
        responses += [{"text": self.token + "A\r" + self.token + "B", "button": "Add to Inbox",
                       "expected": "GTD Weekly Review", "step": "STEP 5:"},
                      {"button": "Done", "expected": "GTD Weekly Review", "step": "Weekly Review Complete!"}]
        workflow(ROOT / "workflows/apple/GTD-WeeklyReview.workflow", responses)
        self.assertEqual(self.query("count"), "2")
        self.assertEqual(self.query("priority", self.token + "A"), "0")
        self.assertEqual(self.query("priority", self.token + "B"), "0")

    def test_menu_bar_counts(self):
        osa('''on run argv
            tell application "Reminders" to tell list id (item 1 of argv)
                make new reminder with properties {name:"MacGTD-E2E-active"}
                make new reminder with properties {name:"MacGTD-E2E-complete", completed:true}
            end tell
        end run''', self.list_id)
        output = command("bash", "workflows/menubar/gtd-menubar.sh")[0]
        self.assertIn("Inbox: 1 tasks", output)
        self.assertIn("Refresh | refresh=true", output)

    def test_every_bundle_install_round_trip(self):
        command("bash", "tests/e2e/test_automator_install.sh", timeout=180)

    def test_calendar_capture_duration_location_and_date(self):
        # Capture targets the first calendar. Inspect it without changing user calendars.
        calendar_id = osa('tell application "Calendar" to return calendarIdentifier of first calendar whose writable is true')
        self.addCleanup(osa, '''on run argv
            tell application "Calendar" to tell (first calendar whose calendarIdentifier is (item 1 of argv))
                delete (every event whose summary starts with (item 2 of argv))
            end tell
        end run''', calendar_id, self.token)
        for suffix, text, duration, location in (("A", "tomorrow 2pm 1h @Conference Room", 3600, "Conference Room"),
                                                ("B", "today 9am 30m", 1800, "")):
            with self.subTest(event=suffix):
                name = self.token + suffix
                workflow(ROOT / "workflows/apple/GTD-EventCapture.workflow",
                         [{"text": name + " " + text, "expected": "GTD Event Quick Capture", "button": "OK"}])
                properties = osa('''on run argv
                    tell application "Calendar" to tell (first calendar whose calendarIdentifier is (item 1 of argv))
                        set matches to events whose summary is (item 2 of argv)
                        if count of matches is not 1 then error "Expected one captured event"
                        set e to item 1 of matches
                        set d to start date of e
                        set eventDay to (year of d as text) & "-" & text -2 thru -1 of ("0" & (month of d as integer)) & "-" & text -2 thru -1 of ("0" & day of d)
                        return eventDay & "|" & (time of d as text) & "|" & ((end date of e) - d as text) & "|" & location of e
                    end tell
                end run''', calendar_id, name)
                expected_day = date.today() + timedelta(days=1 if suffix == "A" else 0)
                seconds = 14 * 3600 if suffix == "A" else 9 * 3600
                self.assertEqual(properties, f"{expected_day.isoformat()}|{seconds}|{duration}|{location}")

    def test_context_list_routing(self):
        context = self.token + "Context"
        context_id = osa('''on run argv
            tell application "Reminders" to return id of (make new list with properties {name:(item 1 of argv)})
        end run''', context)
        self.addCleanup(osa, '''on run argv
            tell application "Reminders" to delete list id (item 1 of argv)
        end run''', context_id)
        self.run_capture("GTD-QuickCapture", f"{self.token} @{context}")
        self.assertEqual(osa(REMINDERS, context_id, "count", ""), "1")
        self.assertEqual(osa(REMINDERS, context_id, "priority", self.token), "0")
        self.assertEqual(self.query("count"), "0")

    def test_focus_timer_start_status_stop_across_processes(self):
        import json
        import os
        import tempfile
        from pathlib import Path
        directory = tempfile.TemporaryDirectory(prefix="macgtd-native-focus-")
        self.addCleanup(directory.cleanup)
        scripts = ROOT / "workflows/alfred/workflow/scripts"
        env = dict(os.environ, MACGTD_STATE_DIR=directory.name, MACGTD_SCRIPT_DIR=str(scripts))
        focus = scripts / "focus_mode.scpt"
        context = "@"+self.token
        context_id = osa('''on run argv
            tell application "Reminders"
                set fixtureList to make new list with properties {name:(item 1 of argv)}
                make new reminder at end of reminders of fixtureList with properties {name:(item 2 of argv)}
                return id of fixtureList
            end tell
        end run''', context, self.token)
        self.addCleanup(osa, '''on run argv
            tell application "Reminders" to delete list id (item 1 of argv)
        end run''', context_id)
        self.addCleanup(command, "osascript", focus, "stop", env=env, check=False)
        command("osascript", focus, context, "1", env=env)
        self.assertIn(self.token, command("osascript", focus, "status", env=env)[0])
        session = json.loads((Path(directory.name) / "focus-session.json").read_text())
        service = f"gui/{os.getuid()}/{session['jobLabel']}"
        command("launchctl", "print", service)
        command("osascript", focus, "stop", env=env)
        self.assertEqual(command("osascript", focus, "status", env=env)[0], "No active focus session")
        self.assertNotEqual(command("launchctl", "print", service, check=False)[1], 0)
        # A second session reaches its real launchd expiry, including timer helper execution.
        import time
        command("osascript", focus, context, "1", env=env)
        expired = json.loads((Path(directory.name) / "focus-session.json").read_text())
        deadline = time.monotonic() + 85
        while (Path(directory.name) / "focus-session.json").exists() and time.monotonic() < deadline:
            time.sleep(1)
        self.assertFalse((Path(directory.name) / "focus-session.json").exists(), "Owned launchd timer did not finish")
        events = [json.loads(line) for line in (Path(directory.name) / "focus_log.jsonl").read_text().splitlines()]
        self.assertEqual([event["event"] for event in events], ["start", "complete", "start", "complete"])
        self.assertEqual(events[-1]["sessionId"], expired["sessionId"])

    def test_library_native_task_dashboard_and_note(self):
        import tempfile
        from pathlib import Path
        directory = tempfile.TemporaryDirectory(prefix="macgtd-native-library-")
        self.addCleanup(directory.cleanup)
        compiled = Path(directory.name) / "GTDLib.scpt"
        command("osacompile", "-o", compiled,
                ROOT / "workflows/alfred/GTDLib.scptd/Contents/Resources/Scripts/main.applescript")
        result = osa('''use framework "Foundation"
        use scripting additions
        on run argv
            set libraryObject to load script POSIX file (item 1 of argv)
            set taskTitle to item 2 of argv
            set resultInfo to libraryObject's createTask_withContext_priority_dueDate_(taskTitle, missing value, 2, missing value)
            set taskIdentifier to id of resultInfo
            libraryObject's addNote_toTask_toProject_("O'Brien quoted note", taskIdentifier, missing value)
            set dashboard to libraryObject's getDashboardData()
            if inboxCount of dashboard is not 1 then error "Wrong library inbox count"
            return taskIdentifier
        end run''', compiled, self.token)
        self.assertTrue(result)
        self.assertEqual(self.query("count"), "1")
        self.assertEqual(self.query("priority", self.token), "5")
        body = osa('''on run argv
            tell application "Reminders" to return body of first reminder of list id (item 1 of argv)
        end run''', self.list_id)
        self.assertEqual(body, "O'Brien quoted note")

    def test_packaged_alfred_native_actions(self):
        import json
        import os
        import tempfile
        import zipfile
        from pathlib import Path
        directory = tempfile.TemporaryDirectory(prefix="macgtd-native-alfred-actions-")
        self.addCleanup(directory.cleanup)
        package = Path(directory.name) / "workflow"
        command("bash", "scripts/package-alfred.sh")
        with zipfile.ZipFile(ROOT / "dist/MacGTD.alfredworkflow") as archive:
            archive.extractall(package)
        env = dict(os.environ, MACGTD_PREFERENCES_PATH=str(Path(directory.name) / "prefs.plist"))
        def action(name, *args):
            return command("osascript", package / "scripts" / (name + ".scpt"), *args, cwd=package, env=env)[0]
        action("add_task", self.token + " due:2030-05-20 !2")
        self.assertEqual(self.query("priority", self.token), "5")
        self.assertEqual(self.query("date", self.token), "2030-05-20")
        self.assertEqual(action("process_inbox"), "1")
        self.assertEqual(self.query("completed", self.token), "false")
        project = self.token + "Project"
        self.addCleanup(osa, '''on run argv
            tell application "Reminders"
                if exists list (item 1 of argv) then delete list (item 1 of argv)
            end tell
        end run''', project)
        project_id = action("add_project", project)
        self.assertEqual(action("add_project", project), project_id)
        reference = osa('''tell application "Reminders"
            if exists list "Reference" then error "Dedicated account must start without a Reference list"
            return id of (make new list with properties {name:"Reference"})
        end tell''')
        self.addCleanup(osa, '''on run argv
            tell application "Reminders" to delete list id (item 1 of argv)
        end run''', reference)
        note = self.token + " O'Brien café"
        action("add_note", note)
        self.assertEqual(osa(REMINDERS, reference, "count", ""), "1")
        self.assertEqual(osa('''on run argv
            tell application "Reminders" to return body of first reminder of list id (item 1 of argv)
        end run''', reference), note)
        previous = command("pbpaste", strip=False, log_output=False)[0]
        self.addCleanup(command, "pbcopy", input=previous)
        command("pbcopy", input=self.token + "Clipboard")
        response = json.loads(action("clipboard_capture"))
        self.assertTrue(response["items"])
        self.assertEqual(self.query("count"), "2")
