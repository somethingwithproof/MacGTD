"""Full production Automator dialogs through verified HTTPS fixture persistence.

This is deterministic adapter E2E, not evidence of live vendor compatibility.
"""
from datetime import datetime, timezone
import os
from pathlib import Path
import plistlib
import unittest
from unittest.mock import patch
import zipfile

from support.common import ROOT, command, dedicated
from support.gui import workflow
from support.live_support import identifier_from_output
from support.provider_fixture import Fixture, PROVIDERS


class ProviderE2E(unittest.TestCase):
    def setUp(self):
        dedicated()
        self.fixture = Fixture().__enter__()
        self.addCleanup(self.fixture.__exit__, None, None, None)
        self.environ = patch.dict(os.environ, self.fixture.env)
        self.environ.start()
        self.addCleanup(self.environ.stop)

    def capture(self, provider, text, cancel=False):
        with self.fixture.bundle(provider) as bundle:
            output = workflow(bundle, [{"text": text, "button": "Cancel" if cancel else "OK",
                                       "expected": PROVIDERS[provider][2] + " GTD Quick Capture"}], cancel=cancel)
        if self.fixture.records and not cancel:
            record = next(reversed(self.fixture.records.values()))
            self.assertEqual(identifier_from_output(output), record.get("id", record.get("name")))

    def persisted(self):
        self.assertEqual(len(self.fixture.records), 1)
        path = next(iter(self.fixture.records))
        record = self.fixture.request(path)
        self.addCleanup(self.fixture.request, path, "DELETE")
        return record

    def test_todoist_dialog_https_and_task_readback(self):
        self.capture("todoist", 'O\'Brien "quoted" café !1 due:2030-05-20 @work +launch')
        record = self.persisted()
        self.assertEqual(record["content"], 'O\'Brien "quoted" café')
        self.assertEqual(record["priority"], 4)
        self.assertEqual(record["project_id"], "fixture-project")
        self.assertEqual(record["labels"], ["work", "launch"])
        self.assertEqual(datetime.fromisoformat(record["due_datetime"]).astimezone().date().isoformat(), "2030-05-20")

    def test_notion_dialog_current_version_and_data_source_readback(self):
        self.capture("notion", 'O\'Brien "quoted" café !2 due:2030-05-20')
        record = self.persisted()
        self.assertEqual(record["properties"]["Name"]["title"][0]["text"]["content"], 'O\'Brien "quoted" café')
        self.assertEqual(record["properties"]["Priority"]["select"]["name"], "Medium")
        self.assertEqual(record["properties"]["Status"]["select"]["name"], "Inbox")
        self.assertEqual(self.fixture.requests[0][2], "2026-03-11")

    def test_microsoft_dialog_graph_v1_task_readback(self):
        self.capture("microsoft", 'O\'Brien "quoted" café !3 due:2030-05-20 @work')
        record = self.persisted()
        self.assertEqual(record["title"], 'O\'Brien "quoted" café')
        self.assertEqual(record["importance"], "low")
        self.assertEqual(record["status"], "notStarted")
        self.assertEqual(record["dueDateTime"]["timeZone"], "UTC")
        self.assertEqual(record["body"]["content"], "Context: @work\n")

    def test_google_dialog_keep_v1_note_readback(self):
        self.capture("google", 'O\'Brien "quoted" café !1 due:2030-05-20 @work +launch')
        record = self.persisted()
        self.assertEqual(record["title"], 'O\'Brien "quoted" café')
        self.assertIn("Priority: 1\n", record["body"]["text"]["text"])
        self.assertIn("Context: @work\n", record["body"]["text"]["text"])
        self.assertIn("Project: launch\n", record["body"]["text"]["text"])
        self.assertTrue(record["name"].startswith("notes/"))

    def test_every_provider_blank_and_cancel_have_no_side_effects(self):
        for provider in PROVIDERS:
            with self.subTest(provider=provider):
                self.capture(provider, "  ")
                self.capture(provider, "Never capture me", cancel=True)
        self.assertEqual(self.fixture.requests, [])
        self.assertEqual(self.fixture.records, {})

    def test_every_provider_rejects_auth_rate_limit_and_unconfirmed_creation(self):
        for scenario in ("auth-failure", "rate-limit", "invalid-confirmation"):
            for provider in PROVIDERS:
                with self.subTest(provider=provider, scenario=scenario):
                    self.fixture.scenario = scenario
                    with self.assertRaisesRegex(AssertionError, "Automator failed"):
                        self.capture(provider, "Must fail")
        self.assertEqual(self.fixture.records, {})

    def test_notion_legacy_database_discovers_single_source(self):
        os.environ["MACGTD_NOTION_DATA_SOURCE_ID"] = ""
        # Empty env values deliberately override stale Keychain entries.
        self.capture("notion", "Legacy database capture")
        self.persisted()

    def test_notion_multiple_sources_require_explicit_selection(self):
        os.environ["MACGTD_NOTION_DATA_SOURCE_ID"] = ""
        self.fixture.scenario = "multiple-sources"
        with self.assertRaisesRegex(AssertionError, "Automator failed"):
            self.capture("notion", "Ambiguous capture")
        self.assertEqual(self.fixture.records, {})
        self.assertEqual(self.fixture.requests, [])

    def test_packaged_alfred_todoist_uses_current_api(self):
        command("bash", ROOT / "scripts/package-alfred.sh")
        package = self.fixture.path / "alfred"
        with zipfile.ZipFile(ROOT / "dist/MacGTD.alfredworkflow") as archive:
            archive.extractall(package)
        adapter = package / "scripts/api_todoist.scpt"
        source = adapter.read_text(encoding="utf-8")
        original = 'property curlExecutable : "/usr/bin/curl"'
        self.assertEqual(source.count(original), 1)
        adapter.write_text(source.replace(original, f'property curlExecutable : "{self.fixture.curl}"'), encoding="utf-8")
        preferences = self.fixture.path / "alfred-preferences.plist"
        preferences.write_bytes(plistlib.dumps({"taskApp": "todoist"}))
        env = dict(os.environ, MACGTD_PREFERENCES_PATH=str(preferences))
        output, _ = command("osascript", package / "scripts/add_task.scpt", "Packaged Todoist café !2",
                            cwd=package, env=env)
        record = self.persisted()
        self.assertEqual(output, record["id"])
        self.assertEqual(record["content"], "Packaged Todoist café")
        self.assertEqual(record["priority"], 3)
