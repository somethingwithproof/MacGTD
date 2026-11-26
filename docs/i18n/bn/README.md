# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · **বাংলা** · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD হলো macOS ওয়ার্কফ্লোর একটি সংকলন, যা আপনার ব্যবহৃত অ্যাপগুলোর মাধ্যমেই কাজ নথিভুক্ত করা, রিমাইন্ডার গুছিয়ে রাখা এবং সময়নির্ধারিত ফোকাস সেশন চালানোর সুবিধা দেয়।**

[Getting Things Done](https://gettingthingsdone.com/) পদ্ধতির ওপর ভিত্তি করে তৈরি এই প্রকল্পটি Apple Reminders-এ ডায়ালগ, ক্লিপবোর্ড ও ব্যাচ ক্যাপচার; Calendar-এ ইভেন্ট ক্যাপচার; এবং Alfred-এ টাস্ক, নোট, প্রজেক্ট ও ফোকাস কমান্ড যুক্ত করে। AppleScript এবং Automator নেটিভ ওয়ার্কফ্লোগুলোকে macOS-এর সাথে ঘনিষ্ঠভাবে যুক্ত রাখে। API অ্যাডাপ্টারগুলো Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 এবং Google Keep v1 ব্যবহার করে। Things ও OmniFocus অ্যাডাপ্টারও এতে অন্তর্ভুক্ত রয়েছে। হোস্টেড টেস্টগুলো স্থানীয় HTTPS ফিক্সচারের বিপরীতে API অ্যাডাপ্টারগুলো যাচাই করে; লাইভ সামঞ্জস্যের জন্য এখনো পৃথক প্রোভাইডার অ্যাকাউন্ট প্রয়োজন।

## আপনি যা যা করতে পারবেন

- **অ্যাপ পরিবর্তন না করেই কাজ নথিভুক্ত করুন।** নতুন কাজ যোগ করতে Automator Service, Alfred কিওয়ার্ড বা ক্লিপবোর্ড ব্যবহার করুন। ব্যাচ ক্যাপচার প্রতিটি অখালি লাইনের জন্য একটি করে রিমাইন্ডার তৈরি করে।
- **টেক্সটকে সুগঠিত কাজে রূপান্তর করুন।** নেটিভ কুইক ক্যাপচার ও Calendar ক্যাপচারের যৌথ প্রোডাকশন AppleScript পার্সার ব্যবহার করে আপেক্ষিক ও ISO তারিখ, সময়, অগ্রাধিকার, কনটেক্সট এবং প্রজেক্ট পার্স করুন।
- **ইভেন্ট যোগ করুন এবং ইনবক্স পর্যালোচনা করুন।** সময়, স্থায়িত্বকাল ও অবস্থানসহ Calendar ইভেন্ট তৈরি করুন; Reminders-এ ব্রেইন ডাম্পসহ পাঁচ ধাপের সাপ্তাহিক পর্যালোচনা চালান।
- **সময়নির্ধারিত ফোকাস সেশনে কাজ করুন।** বিভিন্ন প্রসেস জুড়ে সেশন শুরু, পরীক্ষা ও বন্ধ করুন। সেশনের নিজস্ব launchd টাইমার মেয়াদ শেষ হওয়া ও বাতিলকরণ পরিচালনা করে; JSONL লগ স্থায়িত্বকালের বিশ্লেষণ দেয়।
- **কাজের পাশাপাশি আরও নানা কাজে Alfred ব্যবহার করুন।** প্রজেক্টের জন্য Reminders তালিকা তৈরি করুন, রেফারেন্স নোট সংরক্ষণ করুন, পর্যালোচনার জন্য ইনবক্স খুলুন, ক্লিপবোর্ড টেক্সট ক্যাপচার করুন এবং টাইপ-যাচাইকৃত পছন্দসমূহ সম্পাদনা করুন।
- **মেনু বার থেকেই ইনবক্স দেখুন।** ঐচ্ছিক SwiftBar/xbar প্লাগইনটি ইনবক্সের অসম্পূর্ণ কাজের সংখ্যা এবং ক্যাপচার ওয়ার্কফ্লোর লিংক প্রদর্শন করে।

প্রকৃত GitHub-হোস্টেড Mac-এ নেটিভ আচরণ পরীক্ষা করা হয়: টেস্টগুলো Automator ডায়ালগ পরিচালনা করে এবং এরপর Reminders ও Calendar-এর রেকর্ড পড়ে যাচাই করে। এই প্রমাণের পরিধি জানতে [পরীক্ষা ও সামঞ্জস্য](#testing-and-compatibility) দেখুন।

## দ্রুত শুরু: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

ক্যাপচার পরীক্ষা করতে Automator-এ ওয়ার্কফ্লোটি খুলুন এবং চালান। এটিকে Service হিসেবে ব্যবহারের উপযোগী করতে বান্ডিলটি `~/Library/Services`-এর অধীনে ইনস্টল করুন:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

**System Settings → Keyboard → Keyboard Shortcuts → Services**-এ গিয়ে একটি শর্টকাট নির্ধারণ করুন। macOS অনুমতি চাইলে Reminders-এর জন্য Automation অ্যাক্সেসের অনুমতি দিন। লিখুন:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

নেটিভ ওয়ার্কফ্লোটি আগামীকালের নির্ধারিত সময়সহ একটি উচ্চ-অগ্রাধিকারের রিমাইন্ডার তৈরি করে, সেটিকে `shopping` তালিকায় পাঠায় এবং কনটেক্সট সংরক্ষণ করে। প্রজেক্ট বা কনটেক্সট মার্কার না থাকলে কুইক ক্যাপচার `Inbox` ব্যবহার করে।

## ক্যাপচার সিনট্যাক্স

নেটিভ টাস্ক পার্সার এবং Alfred টাস্ক ক্যাপচার নিচের মার্কারগুলো শনাক্ত করে। প্রোভাইডার অ্যাডাপ্টারগুলোর নিজস্ব ফিল্ড ও রাউটিং সমর্থন রয়েছে।

| ইনপুট | অর্থ | উদাহরণ |
| --- | --- | --- |
| `!1`, `!2`, `!3` | উচ্চ, মাঝারি বা নিম্ন অগ্রাধিকার | `Fix login !1` |
| `today`, `tomorrow`, `next week` | আপেক্ষিক নির্ধারিত তারিখ | `Call dentist tomorrow` |
| সপ্তাহের দিন বা `next weekday` | সপ্তাহের নির্দিষ্ট দিনের তারিখ | `Send report next monday` |
| `due:YYYY-MM-DD` | সুনির্দিষ্ট নির্ধারিত তারিখ | `Renew membership due:2027-03-15` |
| তারিখের সাথে সময় | নির্ধারিত সময় | `Call Alex tomorrow at 3pm` |
| `@context` | কনটেক্সট মার্কার | `Buy milk @errands` |
| `+project` | প্রজেক্ট/তালিকা রাউটিং | `Draft outline +website` |

`due:today` এবং `due:tomorrow`-ও গ্রহণ করা হয়। কনটেক্সট ও প্রজেক্ট মার্কারে অক্ষর, সংখ্যা, আন্ডারস্কোর বা হাইফেন ব্যবহার করুন। নেটিভ কুইক ক্যাপচার কনটেক্সট রাউটিংয়ের চেয়ে প্রজেক্ট রাউটিংকে অগ্রাধিকার দেয়।

Calendar ক্যাপচার ইভেন্টের অবস্থানের জন্য `@` ব্যবহার করে এবং মিনিট বা ঘণ্টায় স্থায়িত্বকাল গ্রহণ করে:

```text
Planning tomorrow 2pm 45m @Conference Room
```

সুনির্দিষ্ট সময় বা স্থায়িত্বকাল না থাকলে Calendar ক্যাপচার প্রথম রাইটেবল ক্যালেন্ডারে সকাল ৯:০০টা এবং এক ঘণ্টা সময়সীমা ব্যবহার করে।

## একটি ওয়ার্কফ্লো বেছে নিন

### নেটিভ Apple ওয়ার্কফ্লো

| ওয়ার্কফ্লো | আচরণ | বান্ডিল |
| --- | --- | --- |
| কুইক ক্যাপচার | কাজের টেক্সট পার্স করে এবং রিমাইন্ডার তৈরি করে | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| ক্লিপবোর্ড ক্যাপচার | ক্লিপবোর্ডের টেক্সট থেকে রিমাইন্ডার তৈরি করে | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| ব্যাচ ক্যাপচার | একাধিক লাইন থেকে একাধিক রিমাইন্ডার তৈরি করে | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| ইভেন্ট ক্যাপচার | একটি Calendar ইভেন্ট তৈরি করে | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| সাপ্তাহিক পর্যালোচনা | নির্দেশিত পর্যালোচনা এবং রিমাইন্ডারে ব্রেইন ডাম্প | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

পরীক্ষা করার জন্য Automator-এ একটি বান্ডিল খুলুন, অথবা কিবোর্ড অ্যাক্সেসের জন্য `~/Library/Services`-এর অধীনে ইনস্টল করুন। Reminders এবং Calendar-এর জন্য উপযুক্ত macOS Automation অনুমতি প্রয়োজন।

### Alfred

Powerpack-সহ Alfred প্রয়োজন। বর্তমান সোর্স থেকে প্যাকেজটি তৈরি করুন:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

আপনি [রিলিজ](https://github.com/somethingwithproof/MacGTD/releases) থেকেও প্যাকেজটি ডাউনলোড করতে পারেন। রিলিজ প্যাকেজগুলোতে ট্যাগ করা সোর্সের প্রতিফলন থাকে; কোনো রিলিজের পরে `main`-এ যোগ হওয়া ফিচারগুলোর জন্য সোর্স থেকে বিল্ড করা প্রয়োজন।

| কিওয়ার্ড | কাজ |
| --- | --- |
| `task` | তারিখ, কনটেক্সট, প্রজেক্ট ও অগ্রাধিকার পার্সিংসহ একটি কাজ নথিভুক্ত করা |
| `note` | Reminders-এ একটি রেফারেন্স নোট সংরক্ষণ করা |
| `project` | একটি Reminders তালিকা তৈরি করা |
| `gtd process` | ব্যবহারকারীর পর্যালোচনার জন্য ইনবক্স খোলা |
| `clip` | ক্লিপবোর্ড টেক্সট ক্যাপচার করা |
| `gtd focus` | ফোকাস সেশন শুরু করা, অবস্থা দেখা বা বন্ধ করা |
| `gtd analytics` | সংরক্ষিত ফোকাস সময়কাল বিশ্লেষণ করে দেখা |
| `gtd preferences` | ওয়ার্কফ্লোর পছন্দসমূহ সম্পাদনা করা |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

পছন্দসমূহ `~/Library/Preferences/com.alfredgtd.plist`-এ এবং ফোকাসের অবস্থা ও লগ `~/.gtd`-এর অধীনে সংরক্ষিত থাকে। পছন্দসমূহের ক্ষেত্রে বিল্ট-ইন ডিফল্ট মান, টাইপ যাচাই, যাচাইকৃত ইম্পোর্ট এবং অ্যাটমিক রাইট ব্যবস্থা রয়েছে। ফোকাস সেশন সিস্টেমের নোটিফিকেশন সেটিংস পরিবর্তন করে না। ইনবক্স প্রসেসিং পর্যালোচনার জন্য তালিকাটি খোলে; এটি স্বয়ংক্রিয়ভাবে কাজগুলো সরায় বা সম্পন্ন করে না।

[Alfred নির্দেশিকা](../../../workflows/alfred/README.md) এবং [GTDLib লাইব্রেরি ডকুমেন্টেশন](../../../workflows/alfred/GTDLib.scptd/README.md) দেখুন।

### বাহ্যিক ক্যাপচার অ্যাডাপ্টার

চারটি API ক্যাপচার ওয়ার্কফ্লোর সবকটিই হোস্টেড E2E-তে প্রকৃত Automator ডায়ালগ এবং একটি স্থানীয় TLS ফিক্সচারের মাধ্যমে পরীক্ষা করা হয়। পৃথক অ্যাকাউন্ট কনফিগার করা থাকলে একটি আলাদা ম্যানুয়াল স্যুট প্রকৃত ভেন্ডর পারসিস্টেন্স পরীক্ষা করে। Things ও OmniFocus-এর জন্য লাইসেন্সপ্রাপ্ত ডেস্কটপ ইন্টিগ্রেশন স্যুট প্রয়োজন।

| লক্ষ্য | পদ্ধতি | সেটআপ / সোর্স |
| --- | --- | --- |
| Todoist | API ক্যাপচার | [ওয়ার্কফ্লো ও Keychain সেটআপ](../../../workflows/todoist/) |
| Notion | ডেটা সোর্স API ক্যাপচার | [ওয়ার্কফ্লো ও Keychain সেটআপ](../../../workflows/notion/) |
| Things 3 | URL স্কিম | [ওয়ার্কফ্লো](../../../workflows/things/) |
| OmniFocus | AppleScript / URL স্কিম | [ওয়ার্কফ্লো](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [ওয়ার্কফ্লো](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [ওয়ার্কফ্লো](../../../workflows/google/) |

API অ্যাডাপ্টারগুলোর জন্য ক্রেডেনশিয়াল সেটআপ প্রয়োজন; Microsoft-এর জন্য ডেলিগেটেড OAuth অনুমোদন এবং Google Keep-এর জন্য উপযুক্ত Workspace অ্যাক্সেস দরকার:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[API সেটআপ, মাইগ্রেশন ও অনুমোদনের শর্তাবলি](../../../workflows/api/README.md) দেখুন। বিদ্যমান Notion ডেটাবেস ID-গুলো কেবল তখনই মাইগ্রেট হয় যখন ঠিক একটি ডেটা সোর্স পাওয়া যায়। Microsoft ও Google ক্যাপচার অনথিভুক্ত ব্রাউজার শর্টকাটের বদলে API ব্যবহার করে। OAuth অ্যাক্সেস টোকেন আপনার OAuth ক্লায়েন্টের মাধ্যমে নবায়ন করতে হয়। পেলোডগুলো সুনির্দিষ্ট JSON কী, সীমাবদ্ধ HTTPS রিকোয়েস্ট এবং রেসপন্স নিশ্চিতকরণ ব্যবহার করে। এরর বার্তায় ব্যর্থতার বিবরণ রাখা হয়, তবে কনফিগার করা API টোকেনটি গোপন রাখা হয়। নিরাপত্তা সংক্রান্ত সমস্যা জানাতে [SECURITY.md](../../../SECURITY.md) দেখুন।

### মেনু বার ও Shortcuts

[মেনু বার নির্দেশিকা](../../../workflows/menubar/README.md)-তে ঐচ্ছিক SwiftBar/xbar প্লাগইন সম্পর্কে বিস্তারিত রয়েছে। প্রথমে Apple Services ইনস্টল করুন, তারপর আপনার মেনু বার অ্যাপে প্লাগইন ডিরেক্টরি কনফিগার করে `workflows/menubar/gtd-menubar.sh` সেখানে লিংক করুন।

[Shortcuts নির্দেশিকা](../../../workflows/shortcuts/README.md)-তে macOS 12+ সংস্করণে টেক্সট, ক্লিপবোর্ড ও Siri ক্যাপচারের ম্যানুয়াল সেটআপ পদ্ধতি দেওয়া আছে। Shortcuts এবং Siri ভয়েস অ্যাক্টিভেশন হোস্টেড টেস্ট স্যুটের আওতার বাইরে।

## আর্কিটেকচার

Automator বান্ডিলগুলোতে AppleScript এমবেড করা থাকে, যাতে সেগুলো নেটিভ Service হিসেবে চলতে পারে। Alfred অ্যাকশন স্ক্রিপ্টগুলো প্যাকেজ করে এবং ব্যবহারকারীর ইনপুট আর্গুমেন্ট হিসেবে পাঠায়। GTDLib সম্পাদনাযোগ্য AppleScript সোর্স ও একটি কম্পাইল করা স্ক্রিপ্ট বান্ডিল থেকে যৌথ নেটিভ Reminders অপারেশনসমূহ সরবরাহ করে।

- **একটিই প্রোডাকশন পার্সার:** `scripts/sync-native-parser.py` কুইক ক্যাপচার ও ইভেন্ট ক্যাপচারে যৌথ পার্সারটি এমবেড করে; ভ্যালিডেশন সোর্সের বিচ্যুতি শনাক্ত করে।
- **স্থায়ী ফোকাস স্টেট:** পৃথক ইনভোকেশনগুলো নিজস্ব launchd জব এবং সীমাবদ্ধ অতিক্রান্ত-সময় হিসাবসহ সেশনের অবস্থা ভাগাভাগি করে নেয়।
- **পুনরুৎপাদনযোগ্য প্যাকেজ:** প্যাকেজিং একটি নতুন আর্কাইভ তৈরি করে এবং টেস্টগুলো সোর্সের সাথে এর বিষয়বস্তু মিলিয়ে দেখে। লাইব্রেরিটির জন্য একটি পৃথক কম্পাইলেশন স্ক্রিপ্ট রয়েছে।
- **পর্যবেক্ষণযোগ্য টেস্ট:** GitHub Actions-এ JUnit রিপোর্ট, কমান্ড লগ এবং পরীক্ষিত বিল্ড আর্টিফ্যাক্ট ১৪ দিন পর্যন্ত সংরক্ষিত থাকে।

| ডিরেক্টরি | দায়িত্ব |
| --- | --- |
| [`workflows/`](../../../workflows/) | নেটিভ বান্ডিল, প্রোভাইডার অ্যাডাপ্টার, Alfred, Shortcuts এবং মেনু বার স্ক্রিপ্ট |
| [`scripts/`](../../../scripts/) | প্যাকেজিং, লাইব্রেরি কম্পাইলেশন, পার্সার সিনক্রোনাইজেশন এবং হোস্টেড টেস্ট প্রভিশনিং |
| [`tests/`](../../../tests/) | ভ্যালিডেশন, কম্পোনেন্ট যাচাই এবং নেটিভ ডেস্কটপ E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, রাত্রিকালীন/ম্যানুয়াল E2E এবং রিপোজিটরি রক্ষণাবেক্ষণ |
| [`infra/`](../../../infra/) | ঐচ্ছিক স্থানীয় ও EC2 Mac রানার সেটআপ; হোস্টেড CI-এর জন্য এটি প্রয়োজন নেই |

## পরীক্ষা ও সামঞ্জস্য

| পরিধি | পরিবেশ | যা যা পরীক্ষা করা হয় |
| --- | --- | --- |
| ভ্যালিডেশন | GitHub-হোস্টেড macOS 15 ও 26 | AppleScript কম্পাইলেশন, বান্ডিল, প্রোডাকশন পার্সার, অ্যাকশন টার্গেট, পছন্দসমূহ, ফোকাস স্টেট, ফিক্সচার API ট্রান্সপোর্ট এবং প্যাকেজ রাউন্ড ট্রিপ |
| নিরাপত্তা যাচাই | GitHub-হোস্টেড Ubuntu ও macOS 15 | Python CodeQL, ShellCheck এবং কম্পাইল করা প্রোডাকশন পার্সারের সীমাবদ্ধ Atheris ফাজিং |
| প্রোভাইডার অ্যাডাপ্টার E2E | GitHub-হোস্টেড `macos-15-intel` | চারটি প্রোডাকশন API ডায়ালগ, TLS ট্রান্সপোর্ট, ফিক্সচার পারসিস্টেন্স/রিডব্যাক, API ব্যর্থতা, বাতিলকরণ এবং Notion সোর্স নির্বাচন |
| লাইভ প্রোভাইডার E2E | নির্দিষ্ট সিক্রেটসহ ম্যানুয়াল GitHub-হোস্টেড Mac রান | প্রকৃত Todoist, Notion, Microsoft ও Google ক্যাপচার এবং ভেন্ডর রিডব্যাক; অ্যাকাউন্ট অনুপস্থিত থাকলে ব্যর্থ হয় |
| লাইসেন্সপ্রাপ্ত ডেস্কটপ ইন্টিগ্রেশন | নির্দিষ্ট স্থানীয় অ্যাকাউন্ট | Things 3, OmniFocus 4 এবং Alfred UI ইনভোকেশন ও পারসিস্টেন্স |
| নেটিভ ডেস্কটপ E2E | GitHub-হোস্টেড `macos-15-intel` | প্রকৃত Automator ডায়ালগ; সংরক্ষিত Reminders ও Calendar ডেটা; সাপ্তাহিক পর্যালোচনা; মেনু গণনা; কম্পাইল করা GTDLib; প্যাকেজকৃত Alfred নেটিভ অ্যাকশন; প্রকৃত launchd টাইমারের মেয়াদ শেষ হওয়া ও বাতিলকরণ |
| ঐচ্ছিক Alfred UI | নির্দিষ্ট স্থানীয় অ্যাকাউন্ট, Alfred 5 + Powerpack | লাইসেন্সপ্রাপ্ত UI-এর মাধ্যমে ওয়ার্কফ্লো ইম্পোর্ট, কিওয়ার্ড ইনভোকেশন এবং রিমাইন্ডার রিডব্যাক |

[যাচাইকৃত API আধুনিকায়ন রানটি](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) কোনো ব্যর্থতা, এরর বা স্কিপ ছাড়াই **প্রতিটি ভ্যালিডেশন প্ল্যাটফর্মে ৩৫টি ভ্যালিডেশন টেস্ট এবং ২৬টি ডেস্কটপ E2E টেস্ট** উত্তীর্ণ হয়েছে। ডেস্কটপ কভারেজের মধ্যে ১৫টি নেটিভ টেস্ট এবং ১১টি প্রোভাইডার অ্যাডাপ্টার টেস্ট রয়েছে, যার মধ্যে প্রকৃত ট্রান্সপোর্ট টাইমআউট ও অস্থায়ী Keychain যাচাই অন্তর্ভুক্ত। ভ্যালিডেশন রিপোজিটরি কাঠামোর পরীক্ষাও চালায়। এই ফলাফলগুলো নেটিভ আচরণ ও প্রোভাইডার ফিক্সচারের ক্ষেত্রে প্রযোজ্য; এগুলো লাইভ ভেন্ডর বা লাইসেন্সপ্রাপ্ত অ্যাপের সামঞ্জস্য প্রমাণ করে না। বর্তমান অবস্থা ওপরের ব্যাজগুলোতে দেখানো হয়েছে।

পুল রিকোয়েস্ট এবং `main`-এ পুশ করার ফলে ভ্যালিডেশন ও তার পরপরই নেটিভ E2E চলে। E2E ওয়ার্কফ্লোটি প্রতি রাতে এবং ম্যানুয়াল ডিসপ্যাচেও চলে, যেখানে নির্ধারণযোগ্য প্রোভাইডার অ্যাডাপ্টার টেস্টগুলো অন্তর্ভুক্ত থাকে। লাইভ ভেন্ডর টেস্টগুলো পৃথক ম্যানুয়াল `live-e2e.yml` ওয়ার্কফ্লো ব্যবহার করে। ডিফল্ট CI ডিসপোজেবল GitHub-হোস্টেড Mac, বিচ্ছিন্ন ফিক্সচার এবং সীমাবদ্ধ সাবপ্রসেস ব্যবহার করে; ডিফল্ট স্যুটের জন্য কোনো সেলফ-হোস্টেড রানার বা বাহ্যিক অ্যাকাউন্ট ক্রেডেনশিয়াল প্রয়োজন হয় না। ম্যানুয়াল লাইভ স্যুটের জন্য নির্দিষ্ট প্রোভাইডার সিক্রেট প্রয়োজন।

বর্তমান CI দ্বারা macOS-এর পুরোনো সংস্করণগুলো যাচাই করা হয় না। লাইভ প্রোভাইডার রানের জন্য নির্দিষ্ট সিক্রেট প্রয়োজন এবং এগুলো এখনো যাচাই করা হয়নি। Shortcuts/Siri এবং লাইসেন্সপ্রাপ্ত ডেস্কটপ অ্যাপগুলো ডিফল্ট হোস্টেড স্যুটের বাইরে। নেটিভ অ্যাকশন টেস্টগুলো সরাসরি প্যাকেজকৃত Alfred স্ক্রিপ্টগুলো পরীক্ষা করে; এগুলো সম্পূর্ণ Alfred UI সামঞ্জস্য প্রমাণ করে না। বিস্তারিত জানতে [টেস্ট সেটআপ, পূর্বশর্ত ও কভারেজ](../../../tests/e2e/README.md) দেখুন।

## লোকালাইজেশন

ব্যবহারকারীর দৃশ্যমান CLI, টেস্ট রানার এবং মেনু বারের স্ট্রিংগুলো কোনো তৃতীয় পক্ষের ডিপেনডেন্সি ছাড়াই `scripts/i18n.py`-এর মাধ্যমে `locales/`-এর অধীনে ৪৫টি লোকেলে (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) সরবরাহ করা হয়। লোকেল নির্ধারণের সময় প্রথমে `--lang`, তারপর `LC_ALL`, `LC_MESSAGES` ও `LANG` পরীক্ষা করা হয় এবং সবশেষে `en`-এ ফিরে যায়।

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## ডেভেলপমেন্ট

[mise](https://mise.jdx.dev/) ইনস্টল করুন এবং `.mise.toml`-এ নির্ধারিত Python সংস্করণ ব্যবহার করুন:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

ভ্যালিডেশন `test-results/`-এর অধীনে রিপোর্ট লেখে; বিল্ড স্ক্রিপ্টগুলো `dist/`-এ ফাইল তৈরি করে। `main`-এ হোস্টেড ডেস্কটপ স্যুট চালাতে:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

স্থানীয় ডেস্কটপ E2E-এর জন্য একটি পৃথক লগ-ইন করা টেস্ট অ্যাকাউন্ট এবং [E2E নির্দেশিকায়](../../../tests/e2e/README.md) বর্ণিত অনুমতিসমূহ প্রয়োজন। হোস্টেড পারমিশন-প্রভিশনিং স্ক্রিপ্টটি কেবল ডিসপোজেবল GitHub-হোস্টেড জবের জন্য সীমাবদ্ধ।

[Conventional Commits](https://www.conventionalcommits.org/) ব্যবহার করুন এবং [CONTRIBUTING.md](../../../CONTRIBUTING.md) অনুসরণ করুন। সাম্প্রতিক পরিবর্তনগুলো [CHANGELOG.md](../../../CHANGELOG.md)-এ নথিভুক্ত রয়েছে।

নিরাপত্তা নিয়ন্ত্রণ, রিলিজ স্বাক্ষর যাচাই এবং অবশিষ্ট Scorecard
সীমাবদ্ধতাগুলো [নিরাপত্তা মূল্যায়ন](../../../docs/security-assessment.md) নথিতে বর্ণিত রয়েছে।
রিলিজ ওয়ার্কফ্লোটি ড্রাফট রিলিজ তৈরি করার আগে প্যাকেজগুলো বিল্ড ও প্রত্যয়ন করে,
যার মধ্যে সোর্স কমিট ও রেফের বিপরীতে যাচাইকৃত স্বাক্ষরিত in-toto প্রভেন্যান্স এবং Sigstore বান্ডিল অন্তর্ভুক্ত থাকে।
নতুন প্রভেন্যান্স কেবল ওই ওয়ার্কফ্লো বিল্ডগুলোর ক্ষেত্রে প্রযোজ্য,
পুরোনো ডাউনলোডের জন্য নয়।

## প্রকল্পের ইতিহাস ও লাইসেন্স

MacGTD পূর্ববর্তী MacGTD-Native, MacGTD-Microsoft, MacGTD-Google এবং AlfredGTD রিপোজিটরিগুলোকে একত্রিত করেছে। এটি [MIT License](../../../LICENSE)-এর অধীনে লাইসেন্সকৃত।
