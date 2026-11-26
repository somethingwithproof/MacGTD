# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · **فارسی** · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD مجموعه‌ای از گردش‌کارهای macOS برای ثبت وظایف، سازمان‌دهی یادآوری‌ها و اجرای جلسات تمرکز زمان‌بندی‌شده با برنامه‌هایی است که همین حالا از آن‌ها استفاده می‌کنید.**

این مجموعه بر پایهٔ روش [Getting Things Done](https://gettingthingsdone.com/) ساخته شده است و امکان ثبت از طریق پنجرهٔ گفتگو، کلیپ‌بورد و ثبت دسته‌ای را به Apple Reminders، ثبت رویداد را به Calendar و دستورهای وظیفه، یادداشت، پروژه و تمرکز را به Alfred می‌آورد. AppleScript و Automator این گردش‌کارهای بومی را نزدیک به محیط macOS نگه می‌دارند. آداپتورهای API از Todoist API v1، Notion API 2026-03-11، Microsoft Graph v1.0 و Google Keep v1 استفاده می‌کنند. آداپتورهای Things و OmniFocus نیز در این مجموعه گنجانده شده‌اند. آزمون‌های میزبانی‌شده، آداپتورهای API را در برابر یک فیکسچر HTTPS محلی بررسی می‌کنند؛ سازگاری در محیط واقعی همچنان نیازمند حساب‌های اختصاصی سرویس‌دهنده‌ها است.

## کارهایی که می‌توانید انجام دهید

- **ثبت بدون جابه‌جایی بین برنامه‌ها.** از یک سرویس Automator، کلیدواژهٔ Alfred یا کلیپ‌بورد برای افزودن یک وظیفه استفاده کنید. ثبت دسته‌ای برای هر خط غیرخالی یک یادآوری می‌سازد.
- **تبدیل متن به وظایف ساختاریافته.** تاریخ‌های نسبی و ISO، زمان‌ها، اولویت‌ها، زمینه‌ها و پروژه‌ها را با استفاده از تجزیه‌گر AppleScript نسخهٔ تولید که بین ثبت سریع بومی و ثبت Calendar مشترک است، تجزیه کنید.
- **ثبت رویدادها و مرور صندوق ورودی.** رویدادهای Calendar را همراه با زمان، مدت‌زمان و مکان ایجاد کنید؛ یک مرور هفتگی پنج‌مرحله‌ای همراه با تخلیهٔ ذهنی به درون Reminders اجرا کنید.
- **کار در جلسات تمرکز زمان‌بندی‌شده.** جلسات را در میان پردازش‌های مختلف آغاز، بررسی و متوقف کنید. زمان‌سنج‌های launchd متعلق به هر جلسه، انقضا و لغو را مدیریت می‌کنند؛ گزارش‌های JSONL آمار تحلیلی مدت‌زمان را فراهم می‌کنند.
- **استفاده از Alfred فراتر از مدیریت وظایف.** فهرست‌های Reminders را برای پروژه‌ها بسازید، یادداشت‌های مرجع ذخیره کنید، صندوق ورودی را برای مرور باز کنید، متن کلیپ‌بورد را ثبت کنید و ترجیحات نوع‌دار را ویرایش نمایید.
- **مشاهدهٔ صندوق ورودی از نوار منو.** افزونهٔ اختیاری SwiftBar/xbar تعداد موارد ناتمام صندوق ورودی را نمایش می‌دهد و پیوندهایی به گردش‌کارهای ثبت ارائه می‌کند.

رفتار بومی روی مک‌های واقعی میزبانی‌شده در GitHub بررسی می‌شود: آزمون‌ها پنجره‌های گفتگوی Automator را اجرا می‌کنند و سپس رکوردهای Reminders و Calendar را بازخوانی می‌نمایند. برای دامنهٔ این شواهد به بخش [آزمون و سازگاری](#testing-and-compatibility) مراجعه کنید.

## شروع سریع: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

گردش‌کار را در Automator باز و اجرا کنید تا ثبت را امتحان نمایید. برای اینکه به‌عنوان یک سرویس در دسترس باشد، بسته را در مسیر `~/Library/Services` نصب کنید:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

یک میان‌بر در **System Settings → Keyboard → Keyboard Shortcuts → Services** اختصاص دهید. هنگامی که macOS درخواست کرد، دسترسی Automation به Reminders را مجاز کنید. عبارت زیر را وارد نمایید:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

گردش‌کار بومی یک یادآوری با اولویت بالا و سررسید فردا می‌سازد، آن را به فهرست `shopping` هدایت می‌کند و زمینه را ثبت می‌نماید. بدون نشانگر پروژه یا زمینه، ثبت سریع از `Inbox` استفاده می‌کند.

## نحو ثبت

تجزیه‌گر بومی وظایف و ثبت وظیفهٔ Alfred این نشانگرها را تشخیص می‌دهند. آداپتورهای سرویس‌دهنده‌ها پشتیبانی فیلد و مسیریابی مخصوص به خود را دارند.

| ورودی | معنا | نمونه |
| --- | --- | --- |
| `!1`، `!2`، `!3` | اولویت بالا، متوسط یا پایین | `Fix login !1` |
| `today`، `tomorrow`، `next week` | تاریخ سررسید نسبی | `Call dentist tomorrow` |
| نام روز هفته یا `next weekday` | تاریخ سررسید بر اساس روز هفته | `Send report next monday` |
| `due:YYYY-MM-DD` | تاریخ سررسید صریح | `Renew membership due:2027-03-15` |
| زمان در کنار تاریخ | ساعت سررسید | `Call Alex tomorrow at 3pm` |
| `@context` | نشانگر زمینه | `Buy milk @errands` |
| `+project` | مسیریابی به پروژه/فهرست | `Draft outline +website` |

عبارت‌های `due:today` و `due:tomorrow` نیز پذیرفته می‌شوند. در نشانگرهای زمینه و پروژه از حروف، اعداد، زیرخط یا خط تیره استفاده کنید. ثبت سریع بومی، مسیریابی پروژه را بر مسیریابی زمینه اولویت می‌دهد.

ثبت Calendar از `@` برای مکان رویداد استفاده می‌کند و مدت‌زمان را بر حسب دقیقه یا ساعت می‌پذیرد:

```text
Planning tomorrow 2pm 45m @Conference Room
```

بدون زمان یا مدت‌زمان صریح، ثبت Calendar از ساعت ۹:۰۰ صبح و مدت یک ساعت، در نخستین تقویم قابل نوشتن استفاده می‌کند.

## انتخاب یک گردش‌کار

### گردش‌کارهای بومی Apple

| گردش‌کار | عملکرد | بسته |
| --- | --- | --- |
| ثبت سریع | تجزیهٔ متن وظیفه و ساخت یادآوری | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| ثبت از کلیپ‌بورد | ساخت یادآوری از متن کلیپ‌بورد | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| ثبت دسته‌ای | ساخت یادآوری از چند خط | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| ثبت رویداد | ساخت یک رویداد Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| مرور هفتگی | مرور هدایت‌شده و تخلیهٔ ذهنی در یادآوری‌ها | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

برای امتحان یک بسته آن را در Automator باز کنید، یا برای دسترسی با صفحه‌کلید در مسیر `~/Library/Services` نصبش نمایید. Reminders و Calendar به مجوزهای مناسب Automation در macOS نیاز دارند.

### Alfred

نیازمند Alfred همراه با Powerpack است. بسته را از کد منبع فعلی بسازید:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

همچنین می‌توانید بسته را از بخش [انتشارها](https://github.com/somethingwithproof/MacGTD/releases) دریافت کنید. بسته‌های انتشار بازتاب‌دهندهٔ کد منبع برچسب‌گذاری‌شدهٔ خود هستند؛ قابلیت‌هایی که پس از یک انتشار به `main` افزوده شده‌اند نیازمند ساخت از کد منبع هستند.

| کلیدواژه | عملیات |
| --- | --- |
| `task` | ثبت یک وظیفه همراه با تجزیهٔ تاریخ، زمینه، پروژه و اولویت |
| `note` | ذخیرهٔ یک یادداشت مرجع در Reminders |
| `project` | ساخت یک فهرست Reminders |
| `gtd process` | باز کردن Inbox برای مرور انسانی |
| `clip` | ثبت متن کلیپ‌بورد |
| `gtd focus` | آغاز یک جلسهٔ تمرکز، بررسی وضعیت یا توقف آن |
| `gtd analytics` | بررسی مدت‌زمان‌های ثبت‌شدهٔ تمرکز |
| `gtd preferences` | ویرایش ترجیحات گردش‌کار |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

ترجیحات در `~/Library/Preferences/com.alfredgtd.plist` نگهداری می‌شوند؛ وضعیت تمرکز و گزارش‌ها در مسیر `~/.gtd` قرار دارند. ترجیحات دارای مقادیر پیش‌فرض داخلی، بررسی نوع داده، واردسازی اعتبارسنجی‌شده و نوشتن اتمیک هستند. جلسات تمرکز تنظیمات اعلان سیستم را تغییر نمی‌دهند. پردازش صندوق ورودی، فهرست را برای مرور باز می‌کند و وظایف را به‌طور خودکار جابه‌جا یا تکمیل نمی‌نماید.

به [راهنمای Alfred](../../../workflows/alfred/README.md) و [مستندات کتابخانهٔ GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md) مراجعه کنید.

### آداپتورهای ثبت خارجی

هر چهار گردش‌کار ثبت از طریق API در آزمون‌های E2E میزبانی‌شده با پنجره‌های گفتگوی واقعی Automator و یک فیکسچر TLS محلی آزموده می‌شوند. یک مجموعه آزمون دستی جداگانه، در صورت پیکربندی حساب‌های اختصاصی، ماندگاری واقعی در سرویس‌دهنده‌ها را آزمایش می‌کند. Things و OmniFocus نیازمند مجموعهٔ یکپارچه‌سازی دسکتاپ دارای مجوز هستند.

| هدف | سازوکار | راه‌اندازی / کد منبع |
| --- | --- | --- |
| Todoist | ثبت از طریق API | [راه‌اندازی گردش‌کار و Keychain](../../../workflows/todoist/) |
| Notion | ثبت از طریق API منبع داده | [راه‌اندازی گردش‌کار و Keychain](../../../workflows/notion/) |
| Things 3 | طرحوارهٔ URL | [گردش‌کار](../../../workflows/things/) |
| OmniFocus | AppleScript / طرحوارهٔ URL | [گردش‌کار](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [گردش‌کار](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [گردش‌کار](../../../workflows/google/) |

آداپتورهای API نیازمند پیکربندی اعتبارنامه‌ها هستند؛ Microsoft به مجوزدهی OAuth تفویض‌شده و Google Keep به دسترسی واجد شرایط Workspace نیاز دارد:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

به [راه‌اندازی API، مهاجرت و الزامات مجوزدهی](../../../workflows/api/README.md) مراجعه کنید. شناسه‌های پایگاه دادهٔ موجود Notion تنها زمانی مهاجرت داده می‌شوند که دقیقاً یک منبع داده یافت شود. ثبت در Microsoft و Google به‌جای میان‌برهای مستندنشدهٔ مرورگر از APIها استفاده می‌کند. توکن‌های دسترسی OAuth نیازمند تمدید از طریق کلاینت OAuth شما هستند. بارداده‌ها از کلیدهای صریح JSON، درخواست‌های HTTPS محدودشده و تأیید پاسخ استفاده می‌کنند. پیام‌های خطا جزئیات شکست را حفظ کرده و در عین حال توکن API پیکربندی‌شده را سانسور می‌کنند. برای گزارش مسائل امنیتی به [SECURITY.md](../../../SECURITY.md) مراجعه نمایید.

### نوار منو و Shortcuts

[راهنمای نوار منو](../../../workflows/menubar/README.md) افزونهٔ اختیاری SwiftBar/xbar را پوشش می‌دهد. ابتدا سرویس‌های Apple را نصب کنید، سپس پوشهٔ افزونه‌ها را در برنامهٔ نوار منوی خود پیکربندی کرده و `workflows/menubar/gtd-menubar.sh` را در آن پیوند دهید.

[راهنمای Shortcuts](../../../workflows/shortcuts/README.md) دستورالعمل راه‌اندازی دستی برای ثبت متن، کلیپ‌بورد و Siri در macOS 12+ را ارائه می‌دهد. Shortcuts و فعال‌سازی صوتی Siri خارج از مجموعه آزمون میزبانی‌شده قرار دارند.

## معماری

بسته‌های Automator کد AppleScript را در خود جای می‌دهند تا بتوانند به‌عنوان سرویس‌های بومی اجرا شوند. Alfred اسکریپت‌های عملیات را بسته‌بندی کرده و ورودی کاربر را به‌عنوان آرگومان ارسال می‌کند. GTDLib عملیات مشترک بومی Reminders را از طریق کد منبع AppleScript قابل ویرایش و یک بستهٔ اسکریپت کامپایل‌شده در دسترس قرار می‌دهد.

- **یک تجزیه‌گر تولیدی واحد:** `scripts/sync-native-parser.py` تجزیه‌گر مشترک را در Quick Capture و Event Capture تعبیه می‌کند؛ اعتبارسنجی، ناهمخوانی کد منبع را تشخیص می‌دهد.
- **وضعیت ماندگار تمرکز:** فراخوانی‌های جداگانه، وضعیت جلسه را با کارهای launchd تحت مالکیت خود و محاسبهٔ زمان سپری‌شدهٔ محدودشده به اشتراک می‌گذارند.
- **بسته‌های تکرارپذیر:** بسته‌بندی یک آرشیو تازه می‌سازد و آزمون‌ها محتوای آن را با کد منبع مقایسه می‌کنند. این کتابخانه یک اسکریپت کامپایل جداگانه دارد.
- **آزمون‌های مشاهده‌پذیر:** گزارش‌های JUnit، لاگ‌های دستورها و مصنوعات ساخت آزمایش‌شده به مدت ۱۴ روز در GitHub Actions نگهداری می‌شوند.

| پوشه | مسئولیت |
| --- | --- |
| [`workflows/`](../../../workflows/) | بسته‌های بومی، آداپتورهای سرویس‌دهنده‌ها، Alfred، Shortcuts و اسکریپت‌های نوار منو |
| [`scripts/`](../../../scripts/) | بسته‌بندی، کامپایل کتابخانه، همگام‌سازی تجزیه‌گر و تدارک آزمون میزبانی‌شده |
| [`tests/`](../../../tests/) | اعتبارسنجی، بررسی‌های اجزا و آزمون E2E بومی دسکتاپ |
| [`.github/workflows/`](../../../.github/workflows/) | CI، آزمون‌های E2E شبانه/دستی و نگهداری مخزن |
| [`infra/`](../../../infra/) | راه‌اندازی اختیاری اجراگر محلی و EC2 Mac؛ CI میزبانی‌شده به آن نیازی ندارد |

<a name="testing-and-compatibility"></a>

## آزمون و سازگاری

| دامنه | محیط | موارد بررسی‌شده |
| --- | --- | --- |
| اعتبارسنجی | macOS 15 و 26 میزبانی‌شده در GitHub | کامپایل AppleScript، بسته‌ها، تجزیه‌گر تولید، هدف‌های عملیات، ترجیحات، وضعیت تمرکز، انتقال API فیکسچر و رفت‌وبرگشت بسته‌بندی |
| بررسی‌های امنیتی | Ubuntu و macOS 15 میزبانی‌شده در GitHub | Python CodeQL، ShellCheck و فازینگ محدودشده با Atheris روی تجزیه‌گر تولید کامپایل‌شده |
| E2E آداپتور سرویس‌دهنده | `macos-15-intel` میزبانی‌شده در GitHub | هر چهار پنجرهٔ گفتگوی API تولید، انتقال TLS، ماندگاری/بازخوانی فیکسچر، خطاهای API، لغو و انتخاب منبع در Notion |
| E2E سرویس‌دهندهٔ زنده | اجرای دستی در Mac میزبانی‌شده در GitHub با رازهای اختصاصی | ثبت و بازخوانی واقعی در Todoist، Notion، Microsoft و Google؛ در صورت نبود حساب‌ها با شکست مواجه می‌شود |
| یکپارچه‌سازی‌های دسکتاپ دارای مجوز | حساب محلی اختصاصی | فراخوانی و ماندگاری رابط کاربری در Things 3، OmniFocus 4 و Alfred |
| E2E بومی دسکتاپ | `macos-15-intel` میزبانی‌شده در GitHub | پنجره‌های گفتگوی واقعی Automator؛ داده‌های ماندگار Reminders و Calendar؛ مرور هفتگی؛ شمارنده‌های منو؛ GTDLib کامپایل‌شده؛ عملیات بومی بسته‌بندی‌شدهٔ Alfred؛ انقضا و لغو واقعی زمان‌سنج launchd |
| رابط کاربری اختیاری Alfred | حساب محلی اختصاصی، Alfred 5 + Powerpack | واردسازی گردش‌کار، فراخوانی با کلیدواژه و بازخوانی یادآوری از طریق رابط کاربری دارای مجوز |

[اجرای تأییدشدهٔ به‌روزرسانی API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) **۳۵ آزمون اعتبارسنجی در هر پلتفرم اعتبارسنجی و ۲۶ آزمون E2E دسکتاپ** را بدون هیچ شکست، خطا یا مورد ردشده‌ای با موفقیت گذراند. پوشش دسکتاپ شامل ۱۵ آزمون بومی و ۱۱ آزمون آداپتور سرویس‌دهنده، از جمله بررسی‌های واقعی زمان‌انتظار انتقال و بررسی‌های گذرای Keychain است. اعتبارسنجی همچنین بررسی‌های ساختار مخزن را اجرا می‌کند. این نتایج رفتار بومی و فیکسچرهای سرویس‌دهنده را پوشش می‌دهند و سازگاری زندهٔ سرویس‌دهنده‌ها یا برنامه‌های دارای مجوز را اثبات نمی‌کنند. وضعیت فعلی توسط نشان‌های بالا نمایش داده می‌شود.

درخواست‌های کشیدن و ارسال‌ها به `main` ابتدا اعتبارسنجی و سپس E2E بومی را اجرا می‌کنند. گردش‌کار E2E همچنین به‌صورت شبانه و با اجرای دستی، شامل آزمون‌های قطعی آداپتور سرویس‌دهنده، اجرا می‌شود. آزمون‌های زندهٔ سرویس‌دهنده از گردش‌کار دستی جداگانهٔ `live-e2e.yml` استفاده می‌کنند. CI پیش‌فرض از مک‌های یک‌بارمصرف میزبانی‌شده در GitHub، فیکسچرهای ایزوله و زیرپردازش‌های محدودشده استفاده می‌کند؛ برای مجموعهٔ پیش‌فرض هیچ نیازی به اجراگر خودمیزبان یا اعتبارنامهٔ حساب خارجی نیست. مجموعهٔ زندهٔ دستی نیازمند رازهای اختصاصی سرویس‌دهنده است.

نسخه‌های قدیمی‌تر macOS توسط CI فعلی اعتبارسنجی نمی‌شوند. اجراهای زندهٔ سرویس‌دهنده نیازمند رازهای اختصاصی هستند و هنوز تأیید نشده‌اند. Shortcuts/Siri و برنامه‌های دسکتاپ دارای مجوز خارج از مجموعهٔ میزبانی‌شدهٔ پیش‌فرض قرار دارند. آزمون‌های عملیات بومی، اسکریپت‌های بسته‌بندی‌شدهٔ Alfred را مستقیماً می‌آزمایند و سازگاری کامل با رابط کاربری Alfred را اثبات نمی‌کنند. به [راه‌اندازی آزمون، پیش‌نیازها و پوشش](../../../tests/e2e/README.md) مراجعه کنید.

## بومی‌سازی

رشته‌های قابل مشاهده توسط کاربر در CLI، اجراگر آزمون و نوار منو در ۴۵ زبان (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) زیر مسیر `locales/` از طریق `scripts/i18n.py` و بدون هیچ وابستگی شخص ثالثی عرضه می‌شوند. تشخیص زبان ابتدا `--lang` و سپس `LC_ALL`، `LC_MESSAGES` و `LANG` را بررسی کرده و در نهایت به `en` بازمی‌گردد.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## توسعه

ابزار [mise](https://mise.jdx.dev/) را نصب کنید و از نسخهٔ Python پین‌شده در `.mise.toml` استفاده نمایید:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

اعتبارسنجی گزارش‌ها را در `test-results/` می‌نویسد؛ اسکریپت‌های ساخت خروجی را در `dist/` ذخیره می‌کنند. برای اجرای مجموعهٔ دسکتاپ میزبانی‌شده روی `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

اجرای E2E دسکتاپ محلی نیازمند یک حساب آزمون واردشدهٔ اختصاصی و مجوزهای شرح‌داده‌شده در [راهنمای E2E](../../../tests/e2e/README.md) است. اسکریپت تدارک مجوزهای میزبانی‌شده به کارهای یک‌بارمصرف میزبانی‌شده در GitHub محدود شده است.

از [Conventional Commits](https://www.conventionalcommits.org/) استفاده کنید و از [CONTRIBUTING.md](../../../CONTRIBUTING.md) پیروی نمایید. تغییرات اخیر در [CHANGELOG.md](../../../CHANGELOG.md) ثبت شده‌اند.

کنترل‌های امنیتی، تأیید امضای انتشار و محدودیت‌های باقی‌ماندهٔ Scorecard در [ارزیابی امنیتی](../../../docs/security-assessment.md) مستند شده‌اند.
گردش‌کار انتشار پیش از ساخت پیش‌نویس انتشار، بسته‌ها را می‌سازد و گواهی می‌کند، از جمله منشأ امضاشدهٔ in-toto و بسته‌های Sigstore که در برابر کامیت و مرجع کد منبع راستی‌آزمایی می‌شوند. گواهی منشأ جدید به همان ساخت‌های گردش‌کار اعمال می‌شود و شامل دانلودهای قدیمی‌تر نمی‌گردد.

## تاریخچهٔ پروژه و مجوز

MacGTD مخازن پیشین MacGTD-Native، MacGTD-Microsoft، MacGTD-Google و AlfredGTD را یکپارچه می‌کند. این پروژه تحت [مجوز MIT](../../../LICENSE) منتشر شده است.
