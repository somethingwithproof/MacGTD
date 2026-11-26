# SPDX-FileCopyrightText: 2026 Thomas Vincent <thomasvincent@gmail.com>
# SPDX-License-Identifier: MIT

"""Tests for 20-locale i18n support in MacGTD."""

from __future__ import annotations

import os
import re
import subprocess
import sys
import unittest

from support.common import ROOT

sys.path.insert(0, str(ROOT / "scripts"))
import i18n  # noqa: E402

PLACEHOLDER_RE = re.compile(r"\{[a-zA-Z0-9_]+\}")


class I18nTests(unittest.TestCase):
    def setUp(self) -> None:
        self._saved_env = {k: os.environ.get(k) for k in ("LC_ALL", "LC_MESSAGES", "LANG")}
        for var in self._saved_env:
            os.environ.pop(var, None)
        i18n.set_locale(None)

    def tearDown(self) -> None:
        for var, val in self._saved_env.items():
            if val is None:
                os.environ.pop(var, None)
            else:
                os.environ[var] = val
        i18n.set_locale(None)

    def test_all_20_locales_load_with_key_and_placeholder_parity(self) -> None:
        self.assertEqual(len(i18n.SUPPORTED_LOCALES), 20)
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

    def test_normalize_locale(self) -> None:
        cases = (
            (None, "en"),
            ("", "en"),
            ("C", "en"),
            ("POSIX", "en"),
            ("de_DE.UTF-8", "de"),
            ("zh_TW", "zh-TW"),
            ("zh_HK.UTF-8", "zh-TW"),
            ("zh-Hant-TW", "zh-TW"),
            ("zh_CN.UTF-8", "zh-CN"),
            ("zh", "zh-CN"),
            ("pt_BR.UTF-8", "pt-BR"),
            ("pt_PT", "pt-BR"),
            ("xx_YY", "en"),
        )
        for raw, expected in cases:
            with self.subTest(raw=raw):
                self.assertEqual(i18n.normalize_locale(raw), expected)

    def test_env_precedence_and_fallback(self) -> None:
        self.assertEqual(i18n.detect_locale(), "en")
        os.environ["LANG"] = "fr_FR.UTF-8"
        self.assertEqual(i18n.detect_locale(), "fr")
        os.environ["LC_MESSAGES"] = "ja_JP.UTF-8"
        self.assertEqual(i18n.detect_locale(), "ja")
        os.environ["LC_ALL"] = "de_DE.UTF-8"
        self.assertEqual(i18n.detect_locale(), "de")
        self.assertEqual(i18n.detect_locale("es"), "es")

        self.assertEqual(i18n.t("menubar.quick_capture", locale="en"), "GTD Quick Capture")
        self.assertEqual(i18n.t("missing.key"), "missing.key")

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
