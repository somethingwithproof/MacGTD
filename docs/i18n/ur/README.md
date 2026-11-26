# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · **اردو** · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD ان ایپس کے ساتھ جو آپ پہلے سے استعمال کرتے ہیں، ٹاسکس کیپچر کرنے، ریمائنڈرز منظم کرنے اور وقت کے پابند فوکس سیشنز چلانے کے لیے macOS ورک فلو کا ایک مجموعہ ہے۔**

[Getting Things Done](https://gettingthingsdone.com/) کے اصولوں پر مبنی، یہ Apple Reminders میں ڈائیلاگ، کلپ بورڈ اور بیچ کیپچر؛ Calendar میں ایونٹ کیپچر؛ اور Alfred میں ٹاسک، نوٹ، پروجیکٹ اور فوکس کمانڈز لاتا ہے۔ AppleScript اور Automator مقامی ورک فلو کو macOS کے قریب رکھتے ہیں۔ API اڈاپٹرز Todoist API v1، Notion API 2026-03-11، Microsoft Graph v1.0، اور Google Keep v1 استعمال کرتے ہیں۔ Things اور OmniFocus اڈاپٹرز بھی شامل ہیں۔ ہوسٹڈ ٹیسٹ مقامی HTTPS فکسچر کے مقابلے میں API اڈاپٹرز کی تصدیق کرتے ہیں؛ لائیو مطابقت کے لیے اب بھی مخصوص فراہم کنندہ اکاؤنٹس درکار ہیں۔

## آپ کیا کر سکتے ہیں

- **ایپس تبدیل کیے بغیر کیپچر کریں۔** ٹاسک شامل کرنے کے لیے Automator Service، Alfred کلیدی لفظ، یا کلپ بورڈ استعمال کریں۔ بیچ کیپچر ہر غیر خالی سطر کے لیے ایک ریمائنڈر بناتا ہے۔
- **متن کو منظم ٹاسکس میں تبدیل کریں۔** مقامی کوئیک کیپچر اور Calendar کیپچر کے ذریعے مشترکہ پروڈکشن AppleScript پارسر استعمال کرتے ہوئے اضافی اور ISO تاریخیں، اوقات، ترجیحات، سیاق و سباق اور پروجیکٹس پارس کریں۔
- **ایونٹس کیپچر کریں اور اپنے ان باکس کا جائزہ لیں۔** وقت، دورانیے اور مقام کے ساتھ Calendar ایونٹس بنائیں؛ Reminders میں برین ڈمپ کے ساتھ پانچ مراحل پر مشتمل ہفتہ وار جائزہ چلائیں۔
- **وقت کے پابند فوکس سیشنز میں کام کریں۔** مختلف پراسیسز کے درمیان سیشنز شروع کریں، معائنہ کریں اور بند کریں۔ سیشن کی ملکیت والے launchd ٹائمرز میعاد ختم ہونے اور منسوخی کو سنبھالتے ہیں؛ JSONL لاگز دورانیے کے تجزیات فراہم کرتے ہیں۔
- **صرف ٹاسکس سے بڑھ کر Alfred کا استعمال کریں۔** پروجیکٹس کے لیے Reminders فہرستیں بنائیں، حوالہ جاتی نوٹس محفوظ کریں، جائزے کے لیے ان باکس کھولیں، کلپ بورڈ متن کیپچر کریں، اور ٹائپ کردہ ترجیحات میں ترمیم کریں۔
- **مینو بار سے اپنا ان باکس دیکھیں۔** اختیاری SwiftBar/xbar پلگ ان نامکمل ان باکس کی گنتی دکھاتا ہے اور کیپچر ورک فلو سے لنک کرتا ہے۔

مقامی رویے کی جانچ حقیقی GitHub-ہوسٹڈ Macs پر کی جاتی ہے: ٹیسٹ Automator ڈائیلاگز کو چلاتے ہیں، پھر Reminders اور Calendar ریکارڈز کو واپس پڑھتے ہیں۔ اس ثبوت کے دائرہ کار کے لیے [جانچ اور مطابقت](#testing-and-compatibility) دیکھیں۔

## فوری آغاز: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

کیپچر آزمانے کے لیے Automator میں ورک فلو کھولیں اور اسے چلائیں۔ اسے Service کے طور پر دستیاب کرنے کے لیے بنڈل کو `~/Library/Services` کے تحت انسٹال کریں:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

**System Settings → Keyboard → Keyboard Shortcuts → Services** میں شارٹ کٹ تفویض کریں۔ جب macOS پوچھے تو Reminders کے لیے Automation رسائی کی اجازت دیں۔ درج کریں:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

مقامی ورک فلو کل کی مقررہ تاریخ کے ساتھ ایک اعلی ترجیحی ریمائنڈر بناتا ہے، اسے `shopping` فہرست میں بھیجتا ہے، اور سیاق و سباق ریکارڈ کرتا ہے۔ پروجیکٹ یا سیاق و سباق کے مارکر کے بغیر، کوئیک کیپچر `Inbox` استعمال کرتا ہے۔

## کیپچر سنٹیکس

مقامی ٹاسک پارسر اور Alfred ٹاسک کیپچر ان مارکرز کو پہچانتے ہیں۔ فراہم کنندہ اڈاپٹرز کی اپنی فیلڈ اور روٹنگ سپورٹ ہوتی ہے۔

| ان پٹ | مطلب | مثال |
| --- | --- | --- |
| `!1`, `!2`, `!3` | اعلی، درمیانی، یا کم ترجیح | `Fix login !1` |
| `today`, `tomorrow`, `next week` | اضافی مقررہ تاریخ | `Call dentist tomorrow` |
| ہفتے کا دن یا `next weekday` | ہفتے کے دن کی مقررہ تاریخ | `Send report next monday` |
| `due:YYYY-MM-DD` | واضح مقررہ تاریخ | `Renew membership due:2027-03-15` |
| تاریخ کے ساتھ وقت | مقررہ وقت | `Call Alex tomorrow at 3pm` |
| `@context` | سیاق و سباق کا مارکر | `Buy milk @errands` |
| `+project` | پروجیکٹ/فہرست روٹنگ | `Draft outline +website` |

`due:today` اور `due:tomorrow` بھی قبول کیے جاتے ہیں۔ سیاق و سباق اور پروجیکٹ مارکرز میں حروف، اعداد، انڈرسکور یا ہائفن استعمال کریں۔ مقامی کوئیک کیپچر سیاق و سباق کی روٹنگ پر پروجیکٹ روٹنگ کو ترجیح دیتا ہے۔

Calendar کیپچر ایونٹ کے مقام کے لیے `@` استعمال کرتا ہے اور منٹوں یا گھنٹوں میں دورانیہ قبول کرتا ہے:

```text
Planning tomorrow 2pm 45m @Conference Room
```

واضح وقت یا دورانیے کے بغیر، Calendar کیپچر پہلے قابلِ تحریر کیلنڈر میں صبح 9:00 بجے اور ایک گھنٹہ استعمال کرتا ہے۔

## ورک فلو منتخب کریں

### مقامی Apple ورک فلو

| ورک فلو | رویہ | بنڈل |
| --- | --- | --- |
| کوئیک کیپچر | ٹاسک کا متن پارس کریں اور ریمائنڈر بنائیں | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| کلپ بورڈ کیپچر | کلپ بورڈ کے متن سے ریمائنڈر بنائیں | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| بیچ کیپچر | متعدد سطور سے ریمائنڈرز بنائیں | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| ایونٹ کیپچر | Calendar ایونٹ بنائیں | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| ہفتہ وار جائزہ | رہنمائی یافتہ جائزہ اور ریمائنڈر برین ڈمپ | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

اسے آزمانے کے لیے Automator میں بنڈل کھولیں، یا کی بورڈ تک رسائی کے لیے اسے `~/Library/Services` کے تحت انسٹال کریں۔ Reminders اور Calendar کو مناسب macOS Automation اجازتوں کی ضرورت ہوتی ہے۔

### Alfred

Powerpack کے ساتھ Alfred درکار ہے۔ موجودہ سورس سے پیکیج بنائیں:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

آپ [releases](https://github.com/somethingwithproof/MacGTD/releases) سے بھی پیکیج ڈاؤن لوڈ کر سکتے ہیں۔ ریلیز پیکیجز اپنے ٹیگ شدہ سورس کی عکاسی کرتے ہیں؛ ریلیز کے بعد `main` میں شامل کی گئی خصوصیات کے لیے سورس بلڈ کی ضرورت ہوتی ہے۔

| کلیدی لفظ | عمل |
| --- | --- |
| `task` | تاریخ، سیاق و سباق، پروجیکٹ اور ترجیح کی پارسنگ کے ساتھ ٹاسک کیپچر کریں |
| `note` | Reminders میں حوالہ جاتی نوٹ محفوظ کریں |
| `project` | Reminders کی فہرست بنائیں |
| `gtd process` | انسانی جائزے کے لیے Inbox کھولیں |
| `clip` | کلپ بورڈ کا متن کیپچر کریں |
| `gtd focus` | فوکس سیشن شروع کریں، صورتحال کا معائنہ کریں، یا بند کریں |
| `gtd analytics` | ریکارڈ شدہ فوکس دورانیوں کا معائنہ کریں |
| `gtd preferences` | ورک فلو کی ترجیحات میں ترمیم کریں |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

ترجیحات `~/Library/Preferences/com.alfredgtd.plist` میں محفوظ ہوتی ہیں؛ فوکس کی صورتحال اور لاگز `~/.gtd` کے تحت رہتے ہیں۔ ترجیحات میں بلٹ ان ڈیفالٹس، ٹائپ چیکس، توثیق شدہ امپورٹس اور ایٹامک رائٹس شامل ہیں۔ فوکس سیشنز سسٹم نوٹیفکیشن کی ترتیبات کو تبدیل نہیں کرتے۔ ان باکس پروسیسنگ جائزے کے لیے فہرست کھولتی ہے؛ یہ خودکار طور پر ٹاسکس کو منتقل یا مکمل نہیں کرتی۔

[Alfred گائیڈ](../../../workflows/alfred/README.md) اور [GTDLib لائبریری دستاویزات](../../../workflows/alfred/GTDLib.scptd/README.md) دیکھیں۔

### بیرونی کیپچر اڈاپٹرز

چاروں API کیپچر ورک فلو کو ہوسٹڈ E2E میں حقیقی Automator ڈائیلاگز اور مقامی TLS فکسچر کے ذریعے آزمایا جاتا ہے۔ جب مخصوص اکاؤنٹس کنفیگر کیے جاتے ہیں تو ایک علیحدہ مینوئل سوٹ حقیقی وینڈر پرسسٹنس کی جانچ کرتا ہے۔ Things اور OmniFocus کے لیے لائسنس یافتہ ڈیسک ٹاپ انٹیگریشن سوٹ درکار ہے۔

| ہدف | طریقہ کار | سیٹ اپ / سورس |
| --- | --- | --- |
| Todoist | API کیپچر | [ورک فلو اور Keychain سیٹ اپ](../../../workflows/todoist/) |
| Notion | ڈیٹا سورس API کیپچر | [ورک فلو اور Keychain سیٹ اپ](../../../workflows/notion/) |
| Things 3 | URL اسکیم | [ورک فلو](../../../workflows/things/) |
| OmniFocus | AppleScript / URL اسکیم | [ورک فلو](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [ورک فلو](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [ورک فلو](../../../workflows/google/) |

API اڈاپٹرز کے لیے اسناد کا سیٹ اپ درکار ہوتا ہے؛ Microsoft کو ڈیلیگیٹڈ OAuth اجازت اور Google Keep کو اہل Workspace رسائی درکار ہے:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[API سیٹ اپ، مائیگریشن، اور اجازت کے تقاضے](../../../workflows/api/README.md) دیکھیں۔ موجودہ Notion ڈیٹا بیس IDs صرف اس وقت مائیگریٹ ہوتی ہیں جب بالکل ایک ڈیٹا سورس ملے۔ Microsoft اور Google کیپچر غیر دستاویزی براؤزر شارٹ کٹس کے بجائے APIs استعمال کرتے ہیں۔ OAuth رسائی ٹوکنز کو آپ کے OAuth کلائنٹ کے ذریعے تجدید کی ضرورت ہوتی ہے۔ پے لوڈز واضح JSON کلیدیں، محدود HTTPS درخواستیں اور جوابی تصدیق استعمال کرتے ہیں۔ خرابی کے پیغامات کنفیگر شدہ API ٹوکن کو چھپاتے ہوئے ناکامی کی تفصیلات برقرار رکھتے ہیں۔ سیکیورٹی کے مسائل کی اطلاع دینے کے لیے [SECURITY.md](../../../SECURITY.md) دیکھیں۔

### مینو بار اور Shortcuts

[مینو بار گائیڈ](../../../workflows/menubar/README.md) اختیاری SwiftBar/xbar پلگ ان کا احاطہ کرتی ہے۔ پہلے Apple Services انسٹال کریں، پھر اپنی مینو بار ایپ میں پلگ ان ڈائریکٹری کنفیگر کریں اور `workflows/menubar/gtd-menubar.sh` کو اس میں لنک کریں۔

[Shortcuts گائیڈ](../../../workflows/shortcuts/README.md) macOS 12+ پر متن، کلپ بورڈ اور Siri کیپچر کے لیے دستی سیٹ اپ فراہم کرتی ہے۔ Shortcuts اور Siri صوتی فعالیت ہوسٹڈ ٹیسٹ سوٹ سے باہر ہیں۔

## آرکیٹیکچر

Automator بنڈلز میں AppleScript شامل ہوتا ہے تاکہ وہ مقامی Services کے طور پر چل سکیں۔ Alfred ایکشن اسکرپٹس کو پیکیج کرتا ہے اور صارف کے ان پٹ کو آرگیومنٹس کے طور پر پاس کرتا ہے۔ GTDLib قابلِ تدوین AppleScript سورس اور مرتب کردہ اسکرپٹ بنڈل سے مشترکہ مقامی Reminders آپریشنز فراہم کرتا ہے۔

- **ایک پروڈکشن پارسر:** `scripts/sync-native-parser.py` مشترکہ پارسر کو Quick Capture اور Event Capture میں شامل کرتا ہے؛ توثیق سورس میں تبدیلی کا پتہ لگاتی ہے۔
- **مستقل فوکس اسٹیٹ:** الگ الگ کالز سیشن کی صورتحال شیئر کرتی ہیں، جس میں ملکیتی launchd جابز اور محدود گزرے ہوئے وقت کا حساب شامل ہے۔
- **قابلِ تکرار پیکیجز:** پیکیجنگ ایک نیا آرکائیو بناتی ہے، اور ٹیسٹ اس کے مندرجات کا سورس سے موازنہ کرتے ہیں۔ لائبریری کے لیے ایک علیحدہ کمپائلیشن اسکرپٹ ہے۔
- **قابلِ مشاہدہ ٹیسٹ:** JUnit رپورٹس، کمانڈ لاگز، اور ٹیسٹ شدہ بلڈ آرٹفیکٹس GitHub Actions میں 14 دنوں تک محفوظ رکھے جاتے ہیں۔

| ڈائریکٹری | ذمہ داری |
| --- | --- |
| [`workflows/`](../../../workflows/) | مقامی بنڈلز، فراہم کنندہ اڈاپٹرز، Alfred، Shortcuts اور مینو بار اسکرپٹس |
| [`scripts/`](../../../scripts/) | پیکیجنگ، لائبریری کمپائلیشن، پارسر ہم آہنگی، اور ہوسٹڈ ٹیسٹ فراہمی |
| [`tests/`](../../../tests/) | توثیق، اجزاء کی جانچ، اور مقامی ڈیسک ٹاپ E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI، رات کے/دستی E2E، اور ریپوزٹری کی دیکھ بھال |
| [`infra/`](../../../infra/) | اختیاری مقامی اور EC2 Mac رنر سیٹ اپ؛ ہوسٹڈ CI کو اس کی ضرورت نہیں ہے |

## جانچ اور مطابقت

| دائرہ کار | ماحول | کیا جانچا جاتا ہے |
| --- | --- | --- |
| توثیق | GitHub-ہوسٹڈ macOS 15 اور 26 | AppleScript کمپائلیشن، بنڈلز، پروڈکشن پارسر، ایکشن اہداف، ترجیحات، فوکس اسٹیٹ، فکسچر API ٹرانسپورٹ، اور پیکیج راؤنڈ ٹرپس |
| سیکیورٹی چیکس | GitHub-ہوسٹڈ Ubuntu اور macOS 15 | Python CodeQL، ShellCheck، اور مرتب کردہ پروڈکشن پارسر کی محدود Atheris فزنگ |
| فراہم کنندہ اڈاپٹر E2E | GitHub-ہوسٹڈ `macos-15-intel` | چاروں پروڈکشن API ڈائیلاگز، TLS ٹرانسپورٹ، فکسچر پرسسٹنس/ریڈ بیک، API ناکامیاں، منسوخی، اور Notion سورس کا انتخاب |
| لائیو فراہم کنندہ E2E | مخصوص سیکرٹس کے ساتھ دستی GitHub-ہوسٹڈ Mac رن | حقیقی Todoist، Notion، Microsoft اور Google کیپچر اور وینڈر ریڈ بیک؛ اکاؤنٹس غائب ہونے پر ناکام ہو جاتا ہے |
| لائسنس یافتہ ڈیسک ٹاپ انٹیگریشنز | مخصوص مقامی اکاؤنٹ | Things 3، OmniFocus 4، اور Alfred UI کا اجرا اور پرسسٹنس |
| مقامی ڈیسک ٹاپ E2E | GitHub-ہوسٹڈ `macos-15-intel` | حقیقی Automator ڈائیلاگز؛ محفوظ شدہ Reminders اور Calendar ڈیٹا؛ ہفتہ وار جائزہ؛ مینو گنتی؛ مرتب کردہ GTDLib؛ پیکیج شدہ Alfred مقامی ایکشنز؛ حقیقی launchd ٹائمر کی میعاد ختم ہونا اور منسوخی |
| اختیاری Alfred UI | مخصوص مقامی اکاؤنٹ، Alfred 5 + Powerpack | لائسنس یافتہ UI کے ذریعے ورک فلو امپورٹ، کلیدی لفظ کا اجرا، اور ریمائنڈر ریڈ بیک |

[توثیق شدہ API جدید کاری رن](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) نے **ہر توثیقی پلیٹ فارم پر 35 توثیقی ٹیسٹ اور 26 ڈیسک ٹاپ E2E ٹیسٹ** بغیر کسی ناکامی، خرابی یا اسکیپ کے پاس کیے۔ ڈیسک ٹاپ کوریج میں 15 مقامی ٹیسٹ اور 11 فراہم کنندہ اڈاپٹر ٹیسٹ شامل ہیں، جن میں حقیقی ٹرانسپورٹ ٹائم آؤٹ اور عارضی Keychain چیکس شامل ہیں۔ توثیق ریپوزٹری کی ساخت کے چیکس بھی چلاتی ہے۔ یہ نتائج مقامی رویے اور فراہم کنندہ فکسچرز کا احاطہ کرتے ہیں؛ یہ لائیو وینڈر یا لائسنس یافتہ ایپ کی مطابقت ثابت نہیں کرتے۔ موجودہ صورتحال اوپر موجود بیجز سے ظاہر ہوتی ہے۔

پل ریکوئسٹس اور `main` پر پشز توثیق اور اس کے بعد مقامی E2E چلاتے ہیں۔ E2E ورک فلو ہر رات اور دستی ڈسپیچ پر بھی چلتا ہے، جس میں متعین فراہم کنندہ اڈاپٹر ٹیسٹ شامل ہیں۔ لائیو وینڈر ٹیسٹ علیحدہ دستی `live-e2e.yml` ورک فلو استعمال کرتے ہیں۔ ڈیفالٹ CI ڈسپوزیبل GitHub-ہوسٹڈ Macs، علیحدہ فکسچرز، اور محدود سب پراسیسز استعمال کرتا ہے؛ ڈیفالٹ سوٹ کے لیے کسی سیلف ہوسٹڈ رنر یا بیرونی اکاؤنٹ کی اسناد کی ضرورت نہیں ہے۔ دستی لائیو سوٹ کے لیے مخصوص فراہم کنندہ سیکرٹس درکار ہیں۔

پرانے macOS ورژنز کی موجودہ CI کے ذریعے توثیق نہیں کی جاتی۔ لائیو فراہم کنندہ رنز کے لیے مخصوص سیکرٹس درکار ہیں اور ابھی تک ان کی تصدیق نہیں ہوئی ہے۔ Shortcuts/Siri اور لائسنس یافتہ ڈیسک ٹاپ ایپس ڈیفالٹ ہوسٹڈ سوٹ سے باہر ہیں۔ مقامی ایکشن ٹیسٹ پیکیج شدہ Alfred اسکرپٹس کو براہ راست آزماتے ہیں؛ وہ مکمل Alfred UI مطابقت ثابت نہیں کرتے۔ [ٹیسٹ سیٹ اپ، پیشگی شرائط، اور کوریج](../../../tests/e2e/README.md) دیکھیں۔

## لوکلائزیشن

صارف کے سامنے آنے والی CLI، ٹیسٹ رنر، اور مینو بار اسٹرنگز بغیر کسی تھرڈ پارٹی انحصار کے `scripts/i18n.py` کے ذریعے `locales/` کے تحت 45 لوکیلز (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) میں فراہم کی جاتی ہیں۔ لوکیل کا تعین پہلے `--lang`، پھر `LC_ALL`، `LC_MESSAGES`، اور `LANG` کی جانچ کرتا ہے، اور آخر میں `en` پر واپس آ جاتا ہے۔

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## ڈیولپمنٹ

[mise](https://mise.jdx.dev/) انسٹال کریں اور `.mise.toml` میں متعین Python ورژن استعمال کریں:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

توثیق `test-results/` کے تحت رپورٹس لکھتی ہے؛ بلڈ اسکرپٹس `dist/` میں لکھتے ہیں۔ `main` پر ہوسٹڈ ڈیسک ٹاپ سوٹ چلانے کے لیے:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

مقامی ڈیسک ٹاپ E2E کے لیے ایک مخصوص لاگ ان شدہ ٹیسٹ اکاؤنٹ اور [E2E گائیڈ](../../../tests/e2e/README.md) میں بیان کردہ اجازتیں درکار ہیں۔ ہوسٹڈ اجازت فراہمی کا اسکرپٹ ڈسپوزیبل GitHub-ہوسٹڈ جابز تک محدود ہے۔

[Conventional Commits](https://www.conventionalcommits.org/) استعمال کریں اور [CONTRIBUTING.md](../../../CONTRIBUTING.md) پر عمل کریں۔ حالیہ تبدیلیاں [CHANGELOG.md](../../../CHANGELOG.md) میں درج ہیں۔

سیکیورٹی کنٹرولز، ریلیز دستخط کی تصدیق، اور باقی ماندہ Scorecard حدود کو [سیکیورٹی جائزہ](../../../docs/security-assessment.md) میں دستاویزی شکل دی گئی ہے۔ ریلیز ورک فلو ڈرافٹ ریلیز بنانے سے پہلے پیکیجز بناتا اور ان کی توثیق کرتا ہے، جس میں سورس کمٹ اور ref کے مقابلے میں تصدیق شدہ دستخطی in-toto پرووینینس اور Sigstore بنڈلز شامل ہیں۔ نیا پرووینینس ان ورک فلو بلڈز پر لاگو ہوتا ہے، پرانے ڈاؤن لوڈز پر نہیں۔

## پروجیکٹ کی تاریخ اور لائسنس

MacGTD سابقہ MacGTD-Native، MacGTD-Microsoft، MacGTD-Google، اور AlfredGTD ریپوزٹریز کو یکجا کرتا ہے۔ یہ [MIT License](../../../LICENSE) کے تحت لائسنس یافتہ ہے۔
