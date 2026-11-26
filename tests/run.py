# SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
# SPDX-License-Identifier: MIT

"""Single entry point for local and CI tests; no third-party Python dependencies."""
import argparse
import os
from pathlib import Path
import sys
import time
import unittest
import xml.etree.ElementTree as ET

ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(ROOT / "tests"))
sys.path.insert(0, str(ROOT / "scripts"))
from i18n import set_locale, t


class Report(unittest.TextTestResult):
    def startTest(self, test):
        self.started = time.monotonic()
        self.outcome = ("passed", "")
        self.has_subtests = False
        super().startTest(test)

    def addFailure(self, test, err):
        self.outcome = ("failure", self._exc_info_to_string(err, test))
        super().addFailure(test, err)

    def addError(self, test, err):
        self.outcome = ("error", self._exc_info_to_string(err, test))
        super().addError(test, err)

    def addSkip(self, test, reason):
        self.outcome = ("skipped", reason)
        super().addSkip(test, reason)

    def stopTest(self, test):
        status, detail = self.outcome
        if not self.has_subtests or status != "passed":
            case = ET.SubElement(self.xml, "testcase", name=str(test),
                                 time=f"{time.monotonic() - self.started:.3f}")
            if status != "passed":
                ET.SubElement(case, status).text = detail
        super().stopTest(test)

    def addSubTest(self, test, subtest, err):
        self.has_subtests = True
        case = ET.SubElement(self.xml, "testcase", name=str(subtest))
        if err is not None:
            status = "failure" if issubclass(err[0], test.failureException) else "error"
            ET.SubElement(case, status).text = self._exc_info_to_string(err, test)
        super().addSubTest(test, subtest, err)

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.xml = ET.Element("testsuite")


def suite_modules(name, include_live=False):
    suites = {
        "validation": ["support.test_harness", "support.test_validation", "support.test_i18n", "support.test_components", "support.test_api_contract", "support.test_live_support", "support.test_security", "support.test_hosted_permissions"],
        "automator": ["support.test_native", "support.test_provider_e2e"],
        "providers": ["support.test_provider_e2e"],
        "alfred": ["support.test_alfred"],
        "desktop-integrations": ["support.test_alfred", "support.test_desktop_integrations"],
        "live": ["support.test_live_providers"],
        "all": ["support.test_native", "support.test_alfred", "support.test_provider_e2e"],
    }
    modules = list(suites[name])
    if include_live:
        if name != "all":
            raise ValueError(t("runner.live_all_only"))
        modules += ["support.test_live_providers", "support.test_desktop_integrations"]
    return modules


def main():
    from i18n import extract_lang

    pre_lang = extract_lang(sys.argv[1:])
    if pre_lang is not None:
        set_locale(pre_lang)
    parser = argparse.ArgumentParser(description=t("runner.description"))
    parser.add_argument("suite", choices=("validation", "all", "alfred", "automator", "providers", "live", "desktop-integrations"))
    parser.add_argument("--filter", help=t("runner.filter_help"))
    parser.add_argument("--live", action="store_true", help=t("runner.live_help"))
    parser.add_argument("--lang", default=None, help=t("runner.lang_help"))
    args = parser.parse_args()
    set_locale(args.lang)
    os.chdir(ROOT)
    results = ROOT / "test-results"
    results.mkdir(exist_ok=True)
    try:
        modules = suite_modules(args.suite, args.live)
    except ValueError as exc:
        parser.error(str(exc))
    suite = unittest.TestSuite(unittest.defaultTestLoader.loadTestsFromName(m) for m in modules)
    if args.filter:
        def flatten(items):
            for item in items:
                if isinstance(item, unittest.TestSuite):
                    yield from flatten(item)
                else:
                    yield item
        suite = unittest.TestSuite(test for test in flatten(suite) if args.filter in test.id())
    result = unittest.TextTestRunner(verbosity=2, resultclass=Report).run(suite)
    # Class setup/teardown errors aren't passed to startTest/stopTest by unittest.
    recorded = {c.get("name") for c in result.xml}
    for test, detail in result.errors:
        if str(test) not in recorded:
            ET.SubElement(ET.SubElement(result.xml, "testcase", name=str(test)), "error").text = detail
    result.xml.set("tests", str(len(result.xml)))
    for status in ("failure", "error", "skipped"):
        key = {"failure": "failures", "error": "errors", "skipped": "skipped"}[status]
        result.xml.set(key, str(len(result.xml.findall(f"testcase/{status}"))))
    ET.ElementTree(result.xml).write(results / f"{args.suite}.xml", encoding="utf-8", xml_declaration=True)
    summary = (
        t(
            "runner.summary",
            suite=args.suite,
            tests=result.testsRun,
            failures=len(result.failures),
            errors=len(result.errors),
            skipped=len(result.skipped),
        )
        + "\n"
    )
    (results / f"{args.suite}-summary.txt").write_text(summary)
    if os.environ.get("GITHUB_STEP_SUMMARY"):
        with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as stream:
            stream.write(summary)
    # No successful green run consisting only of skipped or missing tests.
    return 0 if result.wasSuccessful() and result.testsRun > len(result.skipped) and not result.skipped else 1


if __name__ == "__main__":
    sys.exit(main())
