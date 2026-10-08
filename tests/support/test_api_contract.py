"""Compile production adapters and verify real HTTPS contracts without GUI access."""
import json
import os
import plistlib
import time
import unittest
import unicodedata

from support.common import ROOT, command, osa
from support.provider_fixture import Fixture, PROVIDERS, SOURCE_ID


class APIContract(unittest.TestCase):
    def setUp(self):
        self.fixture = Fixture().__enter__()
        self.addCleanup(self.fixture.__exit__, None, None, None)
        self.env = dict(os.environ, **self.fixture.env)
        self.compiled = {}
        for provider in PROVIDERS:
            document = next((ROOT / "workflows" / provider).glob("*.workflow")) / "Contents/document.wflow"
            source = plistlib.loads(document.read_bytes())["actions"][0]["action"]["ActionParameters"]["source"]
            path = self.fixture.path / (provider + ".applescript")
            path.write_text(source, encoding="utf-8")
            compiled = self.fixture.path / (provider + ".scpt")
            command("osacompile", "-o", compiled, path)
            self.compiled[provider] = compiled

    def capture(self, provider, text="Fixture café !1 due:2030-05-20 @work"):
        return json.loads(osa('''on run argv
            set adapter to load script POSIX file (item 1 of argv)
            set curlExecutable of adapter to item 2 of argv
            return adapter's serializeJSON(adapter's captureTask(item 3 of argv))
        end run''', self.compiled[provider], self.fixture.curl, text, env=self.env))

    def test_all_current_api_contracts_persist_and_read_back(self):
        for provider in PROVIDERS:
            with self.subTest(provider=provider):
                record = self.capture(provider)
                path = next(path for path, stored in self.fixture.records.items() if stored == record)
                self.assertEqual(self.fixture.request(path), record)
                self.fixture.request(path, "DELETE")
                if provider == "notion":
                    self.assertEqual(record["parent"]["data_source_id"], SOURCE_ID)
                    self.assertEqual(self.fixture.requests[-1][2], "2026-03-11")
                    self.assertEqual(unicodedata.normalize("NFC", record["properties"]["Name"]["title"][0]["text"]["content"]), "Fixture café")
                    self.assertEqual(record["properties"]["Priority"]["select"]["name"], "High")
                    self.assertEqual(record["properties"]["Status"]["select"]["name"], "Inbox")
                    self.assertEqual(record["children"][0]["paragraph"]["rich_text"][0]["text"]["content"], "Context: @work\n")
                if provider == "todoist":
                    self.assertEqual(record["priority"], 4)
                    self.assertEqual(unicodedata.normalize("NFC", record["content"]), "Fixture café")
                if provider in ("microsoft", "google"):
                    self.assertEqual(unicodedata.normalize("NFC", record["title"]), "Fixture café")
        self.assertEqual(self.fixture.records, {})

    def test_api_failures_are_blocking_and_redact_credentials(self):
        for scenario, reason in (("auth-failure", "401"), ("rate-limit", "429"),
                                 ("invalid-confirmation", "did not confirm")):
            self.fixture.scenario = scenario
            for provider in PROVIDERS:
                with self.subTest(provider=provider, scenario=scenario):
                    with self.assertRaises(AssertionError) as failure:
                        self.capture(provider)
                    self.assertIn(reason, str(failure.exception))
                    self.assertNotIn("fixture-token", str(failure.exception))
        self.assertEqual(self.fixture.records, {})

    def test_notion_legacy_discovery_requires_unambiguous_source(self):
        self.env["MACGTD_NOTION_DATA_SOURCE_ID"] = ""
        self.env["MACGTD_NOTION_DATABASE_ID"] = self.env["MACGTD_NOTION_DATABASE_ID"].replace("-", "")
        record = self.capture("notion")
        self.assertEqual(record["parent"]["data_source_id"], SOURCE_ID)
        self.fixture.scenario = "multiple-sources"
        before = len(self.fixture.requests)
        with self.assertRaisesRegex(AssertionError, "exactly one source"):
            self.capture("notion")
        self.assertEqual(len(self.fixture.requests), before)

    def test_invalid_task_and_credentials_fail_before_mutation(self):
        for provider in PROVIDERS:
            with self.subTest(provider=provider):
                with self.assertRaisesRegex(AssertionError, "Task title cannot be empty"):
                    self.capture(provider, " !1 @work ")
                with self.assertRaisesRegex(AssertionError, "Invalid ISO date"):
                    self.capture(provider, "Invalid due:2030-99-99")
                self.env[f"MACGTD_{provider.upper()}_TOKEN"] = "invalid\nheader"
                with self.assertRaisesRegex(AssertionError, "Invalid credential characters"):
                    self.capture(provider)
        self.assertEqual(self.fixture.records, {})

    def test_notion_invalid_source_and_microsoft_opaque_id_encoding(self):
        self.env["MACGTD_NOTION_DATA_SOURCE_ID"] = "not-an-id"
        with self.assertRaisesRegex(AssertionError, "UUID"):
            self.capture("notion")
        value = osa('''on run argv
            set adapter to load script POSIX file (item 1 of argv)
            return adapter's captureURL("fixture-list/other?query#fragment")
        end run''', self.compiled["microsoft"])
        self.assertEqual(value, "https://graph.microsoft.com/v1.0/me/todo/lists/fixture-list%2Fother%3Fquery%23fragment/tasks")
        self.assertEqual(self.fixture.requests, [])

    def test_transport_timeout_is_bounded_and_does_not_confirm_creation(self):
        self.fixture.scenario = "timeout"
        started = time.monotonic()
        with self.assertRaisesRegex(AssertionError, "28|timed out"):
            self.capture("todoist")
        self.assertLess(time.monotonic() - started, 40)
        self.assertEqual(self.fixture.records, {})

    def test_date_only_due_fields_and_explicit_times_are_distinct(self):
        for provider in PROVIDERS:
            with self.subTest(provider=provider):
                record = self.capture(provider, "Calendar date due:2030-05-20")
                timed = self.capture(provider, "Explicit time due:2030-05-20 at 3pm")
                if provider == "todoist":
                    self.assertEqual(record["due_date"], "2030-05-20")
                    self.assertNotIn("due_datetime", record)
                    self.assertNotIn("due_date", timed)
                    self.assertTrue(timed["due_datetime"].endswith("Z"))
                elif provider == "notion":
                    self.assertEqual(record["properties"]["Due"]["date"]["start"], "2030-05-20")
                    self.assertIn("T", timed["properties"]["Due"]["date"]["start"])
                elif provider == "google":
                    self.assertEqual(record["body"]["text"]["text"], "Due: 2030-05-20\n")
                    self.assertIn("T", timed["body"]["text"]["text"])
                else:
                    self.assertEqual(record["dueDateTime"]["dateTime"], "2030-05-20T00:00:00")
