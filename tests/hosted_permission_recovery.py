"""Inject one controller denial, then verify real hosted UI/Keychain capture.

Only the first controller call is fault-injected. Permission refresh, the
second dialog interaction, API transport, persistence, and readback are real.
"""
import os
from pathlib import Path
import sys
import unittest
from unittest.mock import patch
import xml.etree.ElementTree as ET

sys.path.insert(0, str(Path(__file__).resolve().parent))
from run import Report
from support import gui
from support.test_provider_e2e import ProviderE2E


class HostedRecovery(ProviderE2E):
    def test_permission_refresh_keeps_one_workflow(self):
        original = gui.dialog
        calls = 0

        def controller(**response):
            nonlocal calls
            calls += 1
            if calls == 1:
                raise AssertionError("Injected controller failure: osascript is not allowed assistive access")
            return original(**response)

        with patch.object(gui, "dialog", side_effect=controller):
            self.test_transient_keychain_credentials_reach_real_automator()
        self.assertEqual(calls, 2)
        self.assertEqual(gui._hosted_accessibility_refreshes, 1)
        self.assertEqual(len(self.fixture.records), 1)


def main():
    if (os.environ.get("GITHUB_ACTIONS") != "true"
            or os.environ.get("RUNNER_ENVIRONMENT") != "github-hosted"
            or os.environ.get("MACGTD_E2E_DEDICATED") != "1"
            or sys.platform != "darwin" or Path.home() != Path("/Users/runner")):
        raise SystemExit("Permission recovery E2E is restricted to disposable GitHub-hosted Macs")
    suite = unittest.TestSuite([HostedRecovery("test_permission_refresh_keeps_one_workflow")])
    result = unittest.TextTestRunner(verbosity=2, resultclass=Report).run(suite)
    ET.ElementTree(result.xml).write(gui.RESULTS / "hosted-permission-recovery.xml", encoding="utf-8", xml_declaration=True)
    raise SystemExit(0 if result.wasSuccessful() else 1)


if __name__ == "__main__":
    main()
