"""Regression checks for CI failure propagation, timeouts, and JUnit output."""
import io
import sys
import unittest

from support.common import command
from run import Report


class Harness(unittest.TestCase):
    def test_command_failure_is_blocking(self):
        with self.assertRaisesRegex(AssertionError, "exited 7"):
            command(sys.executable, "-c", "raise SystemExit(7)")

    def test_hung_command_has_deadline(self):
        with self.assertRaisesRegex(AssertionError, "Timed out"):
            command(sys.executable, "-c", "import time; time.sleep(60)", timeout=0.1)

    def test_report_records_failures_and_setup_errors(self):
        class Failing(unittest.TestCase):
            def test_failure(self):
                self.fail("synthetic regression")

        class SetupError(unittest.TestCase):
            @classmethod
            def setUpClass(cls):
                raise RuntimeError("synthetic preflight failure")

            def test_unreachable(self):
                pass

        result = unittest.TextTestRunner(stream=io.StringIO(), resultclass=Report).run(
            unittest.TestSuite([unittest.defaultTestLoader.loadTestsFromTestCase(Failing),
                               unittest.defaultTestLoader.loadTestsFromTestCase(SetupError)]))
        self.assertFalse(result.wasSuccessful())
        self.assertEqual(len(result.failures), 1)
        self.assertEqual(len(result.errors), 1)
        self.assertEqual(len(result.xml.findall("testcase/failure")), 1)

    def test_native_test_helpers_compile(self):
        # Catch harness syntax errors on hosted macOS without executing GUI actions.
        import ast
        from pathlib import Path
        import tempfile
        from support.common import ROOT
        count = 0
        with tempfile.TemporaryDirectory(prefix="macgtd-test-syntax-") as directory:
            source = Path(directory) / "helper.applescript"
            compiled = Path(directory) / "helper.scpt"
            for name in ("common.py", "gui.py", "test_native.py", "test_alfred.py"):
                tree = ast.parse((ROOT / "tests/support" / name).read_text())
                for node in ast.walk(tree):
                    if isinstance(node, ast.Constant) and isinstance(node.value, str):
                        if ("tell application" in node.value or "load script" in node.value) and "\n" in node.value:
                            with self.subTest(file=name, line=node.lineno):
                                source.write_text(node.value)
                                command("osacompile", "-o", compiled, source)
                                count += 1
        self.assertGreater(count, 10)
