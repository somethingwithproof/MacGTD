"""Merge-policy regressions using the actual workflow's Python policy."""
import json
import textwrap
from types import SimpleNamespace
import unittest

from support.common import ROOT


class MergePolicy(unittest.TestCase):
    def setUp(self):
        workflow = (ROOT / ".github/workflows/dependabot-auto-merge.yml").read_text()
        source = workflow.split("python3 - <<'PY'\n", 1)[1].rsplit("          PY", 1)[0]
        self.policy = {"__name__": "merge_policy_test"}
        exec(compile(textwrap.dedent(source), "dependabot-auto-merge.yml", "exec"), self.policy)
        self.checks = [{"name": name, "state": "SUCCESS"} for name in self.policy["REQUIRED"]]

    def permitted(self, checks, returncode=0):
        self.policy["gh"] = lambda *args: SimpleNamespace(stdout=json.dumps(checks), returncode=returncode)
        return self.policy["checks_pass"](1)

    def test_all_required_checks_must_succeed(self):
        self.assertTrue(self.permitted(self.checks))
        for omitted in self.checks:
            with self.subTest(missing=omitted["name"]):
                self.assertFalse(self.permitted([check for check in self.checks if check != omitted]))

    def test_skipped_or_neutral_required_checks_are_blocking(self):
        for state in ("SKIPPED", "NEUTRAL", "PENDING", "FAILURE", "CANCELLED"):
            for check in self.checks:
                with self.subTest(state=state, name=check["name"]):
                    changed = [{**value, "state": state} if value == check else value for value in self.checks]
                    self.assertFalse(self.permitted(changed))

    def test_failing_optional_check_is_blocking(self):
        self.assertFalse(self.permitted(self.checks + [{"name": "Other scan", "state": "FAILURE"}], 1))
        self.assertTrue(self.permitted(self.checks + [{"name": "Optional job", "state": "SKIPPED"}]))

    def test_empty_malformed_or_unavailable_checks_fail_closed(self):
        for checks in ([], {}, [{"name": "missing state"}], [None]):
            with self.subTest(checks=checks):
                self.assertFalse(self.permitted(checks))
        self.assertFalse(self.permitted(self.checks, 4))
