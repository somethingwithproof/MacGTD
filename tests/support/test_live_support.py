"""Live-suite reporting and credential preflight do not require a provider account."""
import os
import unittest
import sys
from unittest.mock import patch

from support.common import ROOT, command
from support.live_support import REQUIRED, identifier_from_output, write_credential


class LiveSupport(unittest.TestCase):
    def test_keychain_secret_is_stdin_only_and_verified(self):
        secret = 'synthetic "quoted" \\ token'
        with patch("support.live_support.command", side_effect=[("", 0), (secret + "\n", 0)]) as call:
            write_credential("MacGTD-Test", "api-token", secret)
        first, second = call.call_args_list
        self.assertEqual(first.args, ("security", "-i"))
        self.assertIn('\\"quoted\\"', first.kwargs["input"])
        self.assertNotIn(secret, " ".join(second.args))
        self.assertFalse(first.kwargs["log_output"])
        with self.assertRaisesRegex(AssertionError, "control characters"):
            write_credential("MacGTD-Test", "api-token", "synthetic\ncommand")

    def test_live_prerequisites_require_explicit_suite_selection(self):
        import runpy
        modules = runpy.run_path(str(ROOT / "tests/run.py"))["suite_modules"]
        self.assertNotIn("support.test_live_providers", modules("all"))
        self.assertNotIn("support.test_desktop_integrations", modules("all"))
        self.assertIn("support.test_live_providers", modules("all", True))
        self.assertIn("support.test_desktop_integrations", modules("all", True))
        with self.assertRaises(ValueError):
            modules("automator", True)

    def test_automator_record_output_is_strict(self):
        for output in ('{"fixture-record"}\n', '{\n "fixture-record"\n}\n', 'notes/fixture-record\n'):
            self.assertEqual(identifier_from_output(output), "notes/fixture-record" if "notes/" in output else "fixture-record")
        for output in ('{}', 'error: provider failed', 'record-one\nrecord-two\n'):
            with self.assertRaises(AssertionError):
                identifier_from_output(output)

    def test_live_preflight_missing_secrets_fails_with_names_only(self):
        env = dict(os.environ, MACGTD_LIVE_TEST_ACCOUNTS="1")
        for names in REQUIRED.values():
            for name in names:
                env.pop(name, None)
        _, status = command(sys.executable, ROOT / "scripts/check-live-config.py", env=env, check=False)
        self.assertNotEqual(status, 0)
        # Error detail is checked through command failure without exposing credentials.
        with self.assertRaisesRegex(AssertionError, "MACGTD_NOTION_DATA_SOURCE_ID"):
            command(sys.executable, ROOT / "scripts/check-live-config.py", env=env)

    def test_live_preflight_requires_explicit_confirmation(self):
        env = dict(os.environ, MACGTD_LIVE_TEST_ACCOUNTS="0")
        for names in REQUIRED.values():
            for name in names:
                env[name] = "synthetic-private-value"
        with self.assertRaises(AssertionError) as failure:
            command(sys.executable, ROOT / "scripts/check-live-config.py", env=env)
        self.assertIn("confirmation", str(failure.exception))
        self.assertNotIn("synthetic-private-value", str(failure.exception))
