"""Merge-policy regressions using the actual workflow's Python policy."""
import base64
import copy
import json
import subprocess
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


class ReleaseProvenance(unittest.TestCase):
    """Exercise the workflow's export against valid and malformed signed envelopes."""

    def setUp(self):
        workflow = (ROOT / ".github/workflows/release.yml").read_text()
        self.export_filter = workflow.split("jq -ce '\n", 1)[1].split("' \"$BUNDLE_PATH\"", 1)[0]
        statement = {"_type": "https://in-toto.io/Statement/v1",
                     "predicateType": "https://slsa.dev/provenance/v1",
                     "subject": [{"name": "MacGTD.zip", "digest": {"sha256": "a" * 64}}]}
        self.envelope = {"payloadType": "application/vnd.in-toto+json",
                         "payload": base64.b64encode(json.dumps(statement).encode()).decode(),
                         "signatures": [{"sig": "c2lnbmF0dXJl", "keyid": ""}]}

    def export(self, bundle):
        return subprocess.run(["jq", "-ce", self.export_filter], input=json.dumps(bundle),
                              text=True, capture_output=True, timeout=10, check=False)

    def test_export_preserves_signed_payload_and_every_signature(self):
        self.envelope["signatures"].append({"sig": "b3RoZXI=", "keyid": "second"})
        result = self.export({"dsseEnvelope": self.envelope})
        self.assertEqual(result.returncode, 0, result.stderr)
        self.assertEqual(len(result.stdout.splitlines()), 1)
        self.assertEqual(json.loads(result.stdout), self.envelope)

    def test_missing_empty_or_malformed_envelopes_fail_closed(self):
        for bundle in ({}, {"dsseEnvelope": None}, {"dsseEnvelope": []},
                       {"dsseEnvelope": {}}, {"dsseEnvelope": "invalid"}):
            with self.subTest(bundle=bundle):
                self.assertNotEqual(self.export(bundle).returncode, 0)
        for field, values in {"payloadType": [None, "text/plain"],
                              "payload": [None, "", "not base64", "e30="],
                              "signatures": [None, [], [{}], [{"sig": ""}], [{"sig": 1}]]}.items():
            for value in values:
                with self.subTest(field=field, value=value):
                    envelope = {**self.envelope, field: value}
                    self.assertNotEqual(self.export({"dsseEnvelope": envelope}).returncode, 0)

    def test_non_build_attestations_are_rejected(self):
        for field, value in (("_type", "unknown"), ("predicateType", "https://spdx.dev/Document")):
            with self.subTest(field=field):
                envelope = copy.deepcopy(self.envelope)
                statement = json.loads(base64.b64decode(envelope["payload"]))
                statement[field] = value
                envelope["payload"] = base64.b64encode(json.dumps(statement).encode()).decode()
                self.assertNotEqual(self.export({"dsseEnvelope": envelope}).returncode, 0)
