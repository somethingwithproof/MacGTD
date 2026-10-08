from pathlib import Path
import plistlib
import re
import tempfile
import unittest
import zipfile

from support.common import ROOT, command


class Validation(unittest.TestCase):
    def test_repository(self):
        command("bash", "tests/validate_repo.sh")

    def test_applescript_syntax(self):
        command("bash", "tests/test_applescript_syntax.sh", timeout=180)

    def test_automator_bundles(self):
        command("bash", "tests/test_automator_loading.sh")

    def test_embedded_parser_is_synchronized(self):
        command("mise", "exec", "--", "python", "scripts/sync-native-parser.py", "--check")

    def test_production_parser(self):
        command("bash", "tests/test_natural_language_parser.sh", timeout=120)

    def test_package_round_trip(self):
        command("bash", "scripts/package-alfred.sh")
        with tempfile.TemporaryDirectory(prefix="macgtd-package-") as directory:
            with zipfile.ZipFile(ROOT / "dist/MacGTD.alfredworkflow") as archive:
                self.assertIsNone(archive.testzip())
                archive.extractall(directory)
            source = ROOT / "workflows/alfred/workflow"
            expected = {p.relative_to(source) for p in source.rglob("*") if p.is_file() and p.name != ".DS_Store"}
            actual = {p.relative_to(directory) for p in Path(directory).rglob("*") if p.is_file()}
            self.assertEqual(actual, expected, "Package contains missing or stale files")
            for path in expected:
                self.assertEqual((source / path).read_bytes(), (Path(directory) / path).read_bytes())

    def test_alfred_action_targets(self):
        source = ROOT / "workflows/alfred/workflow"
        info = plistlib.loads((source / "info.plist").read_bytes())
        objects = {obj["uid"]: obj for obj in info["objects"]}
        for origin, connections in info["connections"].items():
            self.assertIn(origin, objects)
            for connection in connections:
                self.assertIn(connection["destinationuid"], objects)
        for obj in objects.values():
            if obj["type"] == "alfred.workflow.action.script":
                script = obj["config"]["script"]
                self.assertEqual(obj["config"]["scriptargtype"], 1, "Action input must use argv")
                self.assertNotIn("{query}", script, "User text must not be interpolated into shell source")
                paths = re.findall(r"\./scripts/[\w.-]+\.scpt", script)
                self.assertTrue(paths, f"No packaged script target in {obj['uid']}")
                for path in paths:
                    with self.subTest(action=obj["uid"], script=path):
                        self.assertTrue((source / path).is_file(), f"Alfred references missing script: {path}")
