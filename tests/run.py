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


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("suite", choices=("validation", "all", "alfred", "automator", "providers", "live", "desktop-integrations"))
    parser.add_argument("--filter", help="Run tests whose IDs contain this text")
    args = parser.parse_args()
    os.chdir(ROOT)
    results = ROOT / "test-results"
    results.mkdir(exist_ok=True)
    modules = ["support.test_harness", "support.test_validation", "support.test_components", "support.test_api_contract", "support.test_live_support"] if args.suite == "validation" else []
    if args.suite in ("all", "automator"):
        modules += ["support.test_native"]
    if args.suite in ("all", "alfred", "desktop-integrations"):
        modules += ["support.test_alfred"]
    if args.suite in ("all", "automator", "providers"):
        modules += ["support.test_provider_e2e"]
    if args.suite in ("all", "live"):
        modules += ["support.test_live_providers"]
    if args.suite in ("all", "desktop-integrations"):
        modules += ["support.test_desktop_integrations"]
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
    summary = (f"{args.suite}: {result.testsRun} tests, {len(result.failures)} failures, "
               f"{len(result.errors)} errors, {len(result.skipped)} skipped\n")
    (results / f"{args.suite}-summary.txt").write_text(summary)
    if os.environ.get("GITHUB_STEP_SUMMARY"):
        with open(os.environ["GITHUB_STEP_SUMMARY"], "a") as stream:
            stream.write(summary)
    # No successful green run consisting only of skipped or missing tests.
    return 0 if result.wasSuccessful() and result.testsRun > len(result.skipped) and not result.skipped else 1


if __name__ == "__main__":
    sys.exit(main())
