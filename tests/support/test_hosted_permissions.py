"""Permission recovery must be hosted-only, bounded, and preserve execution."""
import os
import importlib.util
from pathlib import Path
import plistlib
import tempfile
from unittest.mock import Mock, patch
from types import SimpleNamespace
import unittest

from support import gui


class HostedPermissions(unittest.TestCase):
    def setUp(self):
        self.process = Mock()
        self.process.poll.return_value = None
        self.response = {"text": "Synthetic capture", "expected": "Quick Capture"}
        self.denied = AssertionError("osascript is not allowed assistive access")
        for replacement in (
            patch.dict(os.environ, {"GITHUB_ACTIONS": "true", "RUNNER_ENVIRONMENT": "github-hosted",
                                    "MACGTD_E2E_DEDICATED": "1"}),
            patch.object(gui.sys, "platform", "darwin"),
            patch.object(gui.Path, "home", return_value=Path("/Users/runner")),
            patch.object(gui, "_hosted_accessibility_refreshes", 0),
        ):
            replacement.start()
            self.addCleanup(replacement.stop)
        command_patch = patch.object(gui, "command")
        self.command = command_patch.start()
        self.addCleanup(command_patch.stop)

    def test_permission_denial_retries_same_dialog_once(self):
        with patch.object(gui, "dialog", side_effect=[self.denied, None]) as dialog:
            gui.respond(self.process, self.response)
        self.assertEqual(dialog.call_count, 2)
        self.command.assert_called_once()
        self.assertIn("--refresh-accessibility", self.command.call_args.args)
        self.assertEqual(gui._hosted_accessibility_refreshes, 1)

    def test_product_failure_is_not_retried(self):
        with patch.object(gui, "dialog", side_effect=AssertionError("Expected button not found")) as dialog:
            with self.assertRaisesRegex(AssertionError, "Expected button"):
                gui.respond(self.process, self.response)
        self.assertEqual(dialog.call_count, 1)
        self.command.assert_not_called()

    def test_local_and_self_hosted_accounts_are_never_modified(self):
        for environment in ("self-hosted", ""):
            with self.subTest(environment=environment), patch.dict(os.environ, {"RUNNER_ENVIRONMENT": environment}), \
                    patch.object(gui, "dialog", side_effect=self.denied):
                with self.assertRaises(AssertionError):
                    gui.respond(self.process, self.response)
        with patch.object(gui.Path, "home", return_value=Path("/Users/personal")), \
                patch.object(gui, "dialog", side_effect=self.denied):
            with self.assertRaises(AssertionError):
                gui.respond(self.process, self.response)
        self.command.assert_not_called()

    def test_finished_workflow_is_not_replayed(self):
        self.process.poll.return_value = 0
        with patch.object(gui, "dialog", side_effect=self.denied):
            with self.assertRaises(AssertionError):
                gui.respond(self.process, self.response)
        self.command.assert_not_called()

    def test_workflow_completion_during_refresh_is_not_replayed(self):
        self.process.poll.side_effect = [None, 0]
        with patch.object(gui, "dialog", side_effect=self.denied) as dialog:
            with self.assertRaises(AssertionError):
                gui.respond(self.process, self.response)
        self.assertEqual(dialog.call_count, 1)

    def test_repeated_denial_is_blocking(self):
        with patch.object(gui, "dialog", side_effect=self.denied) as dialog:
            with self.assertRaises(AssertionError):
                gui.respond(self.process, self.response)
        self.assertEqual(dialog.call_count, 2)
        self.command.assert_called_once()

    def test_suite_refresh_limit_is_enforced(self):
        gui._hosted_accessibility_refreshes = gui.MAX_HOSTED_ACCESSIBILITY_REFRESHES
        with patch.object(gui, "dialog", side_effect=self.denied) as dialog:
            with self.assertRaises(AssertionError):
                gui.respond(self.process, self.response)
        self.assertEqual(dialog.call_count, 1)
        self.command.assert_not_called()

    def test_refresh_does_not_reinitialize_application_fixtures(self):
        source = gui.ROOT / "scripts/prepare-hosted-macos.py"
        spec = importlib.util.spec_from_file_location("hosted_preparer_test", source)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            results = root / "test-results"
            results.mkdir()
            (results / "desktop-clients.plist").write_bytes(plistlib.dumps([["/usr/bin/osascript", 1]]))
            with patch.object(module, "ROOT", root), patch.object(module.os, "geteuid", return_value=501), \
                    patch.object(module.sys, "argv", [str(source), "--refresh-accessibility"]), \
                    patch.object(module, "run") as run, patch("builtins.print"):
                module.main()
            self.assertEqual(run.call_count, 3)
            self.assertTrue(all("--accessibility-only" in call.args for call in run.call_args_list[:2]))
            self.assertEqual(run.call_args_list[-1].args, ("sudo", "killall", "tccd"))
            self.assertTrue((results / "desktop-permission-refresh.log").is_file())

    def test_provisioning_grants_lexical_and_resolved_runtime_paths(self):
        source = gui.ROOT / "scripts/prepare-hosted-macos.py"
        spec = importlib.util.spec_from_file_location("hosted_preparer_paths_test", source)
        module = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(module)
        with tempfile.TemporaryDirectory() as directory:
            root = Path(directory)
            binary = root / "python3.12"
            binary.write_text("synthetic executable identity")
            alias = root / "python"
            alias.symlink_to(binary)
            with patch.object(module, "ROOT", root), patch.object(module.os, "geteuid", return_value=501), \
                    patch.object(module.sys, "argv", [str(source)]), \
                    patch.object(module.sys, "executable", str(alias)), \
                    patch.object(module, "run", return_value=SimpleNamespace(stdout="true")), \
                    patch.object(module.time, "sleep"), patch("builtins.print"):
                module.main()
            clients = plistlib.loads((root / "test-results/desktop-clients.plist").read_bytes())
            self.assertIn([str(alias), 1], clients)
            self.assertIn([str(binary.resolve()), 1], clients)
