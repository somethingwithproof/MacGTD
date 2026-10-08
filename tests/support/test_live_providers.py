"""Real vendor persistence via production Automator dialogs; no optional skips."""
import os
from urllib.parse import quote
import unittest
import uuid

from support.common import dedicated
from support.gui import workflow
from support.live_support import REQUIRED, credential_bundle, identifier_from_output, request
from support.provider_fixture import PROVIDERS


class LiveProviders(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        dedicated()
        if os.environ.get("MACGTD_LIVE_TEST_ACCOUNTS") != "1":
            raise AssertionError("Set MACGTD_LIVE_TEST_ACCOUNTS=1 only for dedicated test accounts")
        missing = [name for names in REQUIRED.values() for name in names if not os.environ.get(name)]
        if missing:
            raise AssertionError("Missing dedicated live test configuration: " + ", ".join(missing))

    def capture(self, provider):
        text = "MacGTD-Live-" + uuid.uuid4().hex + ' café "quoted"'
        with credential_bundle(provider) as bundle:
            output = workflow(bundle, [{"text": text + " !1 due:2030-05-20",
                                        "expected": PROVIDERS[provider][2] + " GTD Quick Capture"}])
        identifier = identifier_from_output(output)
        quoted_id = quote(identifier, safe="")
        if provider == "todoist":
            url = "https://api.todoist.com/api/v1/tasks/" + quoted_id
        elif provider == "notion":
            url = "https://api.notion.com/v1/pages/" + quoted_id
        elif provider == "microsoft":
            target = quote(os.environ["MACGTD_MICROSOFT_LIST_ID"], safe="")
            url = f"https://graph.microsoft.com/v1.0/me/todo/lists/{target}/tasks/{quoted_id}"
        else:
            if not identifier.startswith("notes/"):
                raise AssertionError("Unexpected Google note ID")
            url = "https://keep.googleapis.com/v1/notes/" + quote(identifier[6:], safe="")
        record = request(provider, url)
        # Arm cleanup only after readback proves this uniquely named record is ours.
        title = record.get("content") if provider == "todoist" else record.get("title")
        if provider == "notion":
            title = "".join(item.get("plain_text", item.get("text", {}).get("content", ""))
                            for item in record["properties"]["Name"]["title"])
        self.assertEqual(title, text, "Live provider did not persist the captured title")
        if provider == "notion":
            self.addCleanup(request, provider, url, "PATCH", {"in_trash": True})
        else:
            self.addCleanup(request, provider, url, "DELETE")
        return record

    def test_todoist_persisted_task_fields(self):
        record = self.capture("todoist")
        self.assertEqual(record["priority"], 4)
        self.assertEqual(record["project_id"], os.environ["MACGTD_TODOIST_PROJECT_ID"])
        self.assertIsNotNone(record.get("due"))

    def test_notion_persisted_page_fields(self):
        record = self.capture("notion")
        self.assertEqual(record["parent"]["data_source_id"].lower(), os.environ["MACGTD_NOTION_DATA_SOURCE_ID"].lower())
        self.assertEqual(record["properties"]["Priority"]["select"]["name"], "High")
        self.assertEqual(record["properties"]["Status"]["select"]["name"], "Inbox")
        self.assertIsNotNone(record["properties"]["Due"]["date"])

    def test_microsoft_persisted_task_fields(self):
        record = self.capture("microsoft")
        self.assertEqual(record["importance"], "high")
        self.assertEqual(record["status"], "notStarted")
        self.assertIsNotNone(record.get("dueDateTime"))

    def test_google_persisted_note_fields(self):
        record = self.capture("google")
        self.assertIn("Priority: 1", record["body"]["text"]["text"])
        self.assertIn("Due:", record["body"]["text"]["text"])
