# SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
# SPDX-License-Identifier: MIT

"""Tests for 48-locale i18n support in MacGTD."""

from __future__ import annotations

import contextlib
import io
import os
import re
import runpy
import subprocess
import sys
import unittest
from unittest import mock

from support.common import ROOT

sys.path.insert(0, str(ROOT / "scripts"))
import i18n  # noqa: E402

PLACEHOLDER_RE = re.compile(r"\{[a-zA-Z0-9_]+\}")
CYRILLIC_RE = re.compile(r"[\u0400-\u04FF]")


class I18nTests(unittest.TestCase):
    def setUp(self) -> None:
        self._saved_env = {k: os.environ.get(k) for k in ("LC_ALL", "LC_MESSAGES", "LANG")}
        self._saved_override = i18n._active_locale
        for var in self._saved_env:
            os.environ.pop(var, None)
        i18n.set_locale(None)

    def tearDown(self) -> None:
        for var, val in self._saved_env.items():
            if val is None:
                os.environ.pop(var, None)
            else:
                os.environ[var] = val
        i18n.set_locale(self._saved_override)

    def test_all_48_locales_load_with_key_and_placeholder_parity(self) -> None:
        self.assertEqual(len(i18n.SUPPORTED_LOCALES), 48)
        en = i18n.load_catalog(i18n.DEFAULT_LOCALE)
        self.assertGreater(len(en), 0)
        for locale in i18n.SUPPORTED_LOCALES:
            with self.subTest(locale=locale):
                catalog = i18n.load_catalog(locale)
                self.assertEqual(set(catalog.keys()), set(en.keys()))
                for key, en_val in en.items():
                    self.assertTrue(catalog[key].strip(), f"{locale}:{key} is empty")
                    self.assertEqual(
                        sorted(PLACEHOLDER_RE.findall(catalog[key])),
                        sorted(PLACEHOLDER_RE.findall(en_val)),
                        f"placeholder mismatch in {locale}:{key}",
                    )

    def test_bcms_catalogs_script_distinction_and_parser_keywords(self) -> None:
        bs = i18n.load_catalog("bs")
        hr = i18n.load_catalog("hr")
        sr = i18n.load_catalog("sr")

        self.assertNotEqual(bs, hr)
        differing_keys = {k for k in bs if bs[k] != hr[k]}
        self.assertGreaterEqual(len(differing_keys), 15)
        self.assertEqual(bs["menubar.weekly_review"], "Sedmični pregled")
        self.assertEqual(hr["menubar.weekly_review"], "Tjedni pregled")
        self.assertEqual(sr["menubar.weekly_review"], "Недељни преглед")

        for key, value in sr.items():
            with self.subTest(sr_key=key):
                self.assertRegex(value, CYRILLIC_RE, f"sr:{key} must use Cyrillic script")
        for loc, catalog in (("bs", bs), ("hr", hr)):
            for key, value in catalog.items():
                with self.subTest(latin_locale=loc, key=key):
                    self.assertNotRegex(value, CYRILLIC_RE, f"{loc}:{key} must use Latin script")

        for loc, catalog in (("bs", bs), ("hr", hr), ("sr", sr)):
            with self.subTest(parser_keywords=loc):
                self.assertIn("tomorrow 2pm 1h", catalog["dialog.event_capture_prompt"])
                self.assertIn("!1/!2/!3", catalog["dialog.quick_capture_prompt"])
                self.assertIn("due:today/tomorrow/", catalog["dialog.quick_capture_prompt"])
        self.assertIn("@context", sr["dialog.quick_capture_prompt"])
        self.assertIn("+project", sr["dialog.quick_capture_prompt"])

    def test_normalize_locale(self) -> None:
        cases = (
            (None, "en"),
            ("", "en"),
            (".UTF-8", "en"),
            ("C", "en"),
            ("POSIX", "en"),
            ("de_DE.UTF-8", "de"),
            ("zh_TW", "zh-TW"),
            ("zh_HK.UTF-8", "zh-TW"),
            ("zh-TW-u-ca-gregory", "zh-TW"),
            ("zh-HK-x-private", "zh-TW"),
            ("zh-Hant-TW", "zh-TW"),
            ("zh-Hans-TW", "zh-CN"),
            ("zh_CN.UTF-8", "zh-CN"),
            ("zh", "zh-CN"),
            ("pt_BR.UTF-8", "pt-BR"),
            ("pt_PT", "pt-BR"),
            ("x-private", "en"),
            ("ar_EG.UTF-8", "ar-EG"),
            ("ar-MA-u-nu-latn", "ar-MA"),
            ("ar-Arab-EG", "ar-EG"),
            ("ar-Arab-SA", "ar"),
            ("fr_MA.UTF-8", "fr-MA"),
            ("fr-SN-x-test", "fr-SN"),
            ("fr_CA.UTF-8", "fr"),
            ("af", "af-ZA"),
            ("am_ET.UTF-8", "am-ET"),
            ("ha", "ha-NG"),
            ("ig", "ig-NG"),
            ("mg", "mg-MG"),
            ("rw", "rw-RW"),
            ("so", "so-SO"),
            ("sw_KE.UTF-8", "sw-KE"),
            ("xh", "xh-ZA"),
            ("yo", "yo-NG"),
            ("zu", "zu-ZA"),
            ("bn_BD.UTF-8", "bn"),
            ("fa_IR", "fa"),
            ("iw", "he"),
            ("mr_IN", "mr"),
            ("ta_IN", "ta"),
            ("te_IN", "te"),
            ("th_TH", "th"),
            ("ur_PK", "ur"),
            ("ms_MY.UTF-8", "ms"),
            ("tl_PH.UTF-8", "fil"),
            ("bs", "bs"),
            ("bs-BA", "bs"),
            ("bs_BA.UTF-8", "bs"),
            ("hr", "hr"),
            ("hr-HR", "hr"),
            ("hr_HR.UTF-8", "hr"),
            ("sr", "sr"),
            ("sr-RS", "sr"),
            ("sr_RS.UTF-8", "sr"),
            ("sr-Cyrl", "sr"),
            ("sr-Cyrl-RS", "sr"),
            ("sr-Latn", "sr"),
            ("sr-Latn-RS", "sr"),
            ("sr_RS@latin", "sr"),
            ("xx_YY", "en"),
        )
        for raw, expected in cases:
            with self.subTest(raw=raw):
                self.assertEqual(i18n.normalize_locale(raw), expected)

    def test_env_precedence_override_and_fallback(self) -> None:
        self.assertEqual(i18n.detect_locale(), "en")
        os.environ["LANG"] = "fr_FR.UTF-8"
        self.assertEqual(i18n.detect_locale(), "fr")
        os.environ["LC_MESSAGES"] = "ja_JP.UTF-8"
        self.assertEqual(i18n.detect_locale(), "ja")
        os.environ["LC_ALL"] = "de_DE.UTF-8"
        self.assertEqual(i18n.detect_locale(), "de")
        self.assertEqual(i18n.detect_locale("es"), "es")

        self.assertEqual(i18n.set_locale("sr-Cyrl"), "sr")
        self.assertEqual(i18n.get_locale(), "sr")
        self.assertEqual(i18n.t("menubar.weekly_review"), "Недељни преглед")
        self.assertEqual(i18n.set_locale(None), "de")
        self.assertEqual(i18n.get_locale(), "de")

        self.assertEqual(i18n.t("menubar.quick_capture", locale="en"), "GTD Quick Capture")
        self.assertEqual(i18n.t("menubar.inbox_tasks", locale="bs", count=3), "Pristiglo: 3 zadataka")
        self.assertEqual(i18n.t("missing.key"), "missing.key")

    def test_extract_lang_and_main_in_process(self) -> None:
        self.assertIsNone(i18n.extract_lang(["menubar.refresh"]))
        self.assertEqual(i18n.extract_lang(["--lang", "bs-BA", "--lang=hr-HR"]), "hr-HR")
        self.assertEqual(i18n.extract_lang(["--lang", "sr-RS", "--", "--lang", "de"]), "sr-RS")
        self.assertIsNone(i18n.extract_lang(["--lang"]))
        with mock.patch.object(sys, "argv", ["i18n.py", "--lang=sr-Latn"]):
            self.assertEqual(i18n.extract_lang(None), "sr-Latn")

        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            self.assertEqual(i18n.main(["--list-locales"]), 0)
        self.assertEqual(out.getvalue().strip().splitlines(), list(i18n.SUPPORTED_LOCALES))

        err = io.StringIO()
        with contextlib.redirect_stderr(err):
            self.assertEqual(i18n.main([]), 2)
        self.assertIn("usage:", err.getvalue())

        out = io.StringIO()
        with contextlib.redirect_stdout(out):
            rc = i18n.main(["--lang", "hr-HR", "menubar.inbox_tasks", "count=7", "ignored_token"])
        self.assertEqual(rc, 0)
        self.assertEqual(out.getvalue().strip(), "Ulazna pošta: 7 zadataka")

        out = io.StringIO()
        with (
            mock.patch.object(sys, "argv", ["i18n.py", "--list-locales"]),
            contextlib.redirect_stdout(out),
            self.assertRaises(SystemExit) as cm,
        ):
            runpy.run_path(str(ROOT / "scripts/i18n.py"), run_name="__main__")
        self.assertEqual(cm.exception.code, 0)
        self.assertEqual(out.getvalue().strip().splitlines(), list(i18n.SUPPORTED_LOCALES))

    def test_cli_helper_translation_and_list(self) -> None:
        result = subprocess.run(
            [sys.executable, str(ROOT / "scripts/i18n.py"), "--list-locales"],
            capture_output=True,
            text=True,
            check=True,
            timeout=10,
        )
        self.assertEqual(result.stdout.strip().splitlines(), list(i18n.SUPPORTED_LOCALES))

        de = subprocess.run(
            [
                sys.executable,
                str(ROOT / "scripts/i18n.py"),
                "--lang",
                "de",
                "menubar.inbox_tasks",
                "count=5",
            ],
            capture_output=True,
            text=True,
            check=True,
            timeout=10,
        )
        self.assertEqual(de.stdout.strip(), i18n.t("menubar.inbox_tasks", locale="de", count=5))

        env = {k: v for k, v in os.environ.items() if k not in {"LC_ALL", "LC_MESSAGES", "LANG"}}
        env["LC_ALL"] = "C"
        env["COLUMNS"] = "200"
        de_help = subprocess.run(
            [sys.executable, str(ROOT / "scripts/i18n.py"), "--lang", "de", "--help"],
            env=env,
            capture_output=True,
            text=True,
            check=True,
            timeout=10,
        )
        self.assertIn(
            " ".join(i18n.t("i18n.cli_description", locale="de").split()),
            " ".join(de_help.stdout.split()),
        )

        runner_help = subprocess.run(
            [sys.executable, str(ROOT / "tests/run.py"), "--lang", "de", "--help"],
            env=env,
            capture_output=True,
            text=True,
            check=True,
            timeout=10,
        )
        self.assertIn(
            " ".join(i18n.t("runner.description", locale="de").split()),
            " ".join(runner_help.stdout.split()),
        )
