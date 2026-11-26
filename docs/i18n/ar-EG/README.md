# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · **العربية (مصر)** · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD عبارة عن مجموعة workflows لنظام macOS عشان تسجل المهام، تنظم التذكيرات، وتشغل جلسات تركيز بوقت محدد باستخدام التطبيقات اللي بتستخدمها أصلاً.**

المشروع مبني على منهجية [Getting Things Done](https://gettingthingsdone.com/)، وبيضيف طرق لالتقاط المهام عن طريق نافذة حوار، أو الحافظة، أو بشكل جماعي جوه Apple Reminders؛ والتقاط المواعيد في Calendar؛ وكمان أوامر للمهام والملاحظات والمشاريع وجلسات التركيز في Alfred. استخدام AppleScript وAutomator بيخلي الـ workflows الأصلية قريبة ومندمجة مع macOS. محولات الـ API بتستخدم Todoist API v1 وNotion API 2026-03-11 وMicrosoft Graph v1.0 وGoogle Keep v1. وكمان موجود محولات لـ Things وOmniFocus. الاختبارات المستضافة بتتأكد من شغل محولات الـ API قصاد بيئة اختبار HTTPS محلية؛ بس التوافق المباشر مع الخدمات الحقيقية لسه محتاج حسابات مخصصة عند كل مزود.

## تقدر تعمل إيه

- **سجل مهامك من غير ما تسيب التطبيق اللي شغال عليه.** استخدم خدمة Automator، أو كلمة مفتاحية في Alfred، أو الحافظة عشان تضيف مهمة. الالتقاط الجماعي بيعمل تذكير واحد لكل سطر مش فاضي.
- **حول الكلام العادي لمهام منظمة.** حلل التواريخ النسبية وتواريخ ISO، والأوقات، والأولويات، والسياقات، والمشاريع باستخدام محلل AppleScript الأساسي المشترك بين الالتقاط السريع الأصلي والتقاط Calendar.
- **سجل المواعيد وراجع صندوق الوارد بتاعك.** اعمل مواعيد في Calendar بالوقت والمدة والمكان؛ وشغل مراجعة أسبوعية من خمس خطوات مع تفريغ أفكار مباشر جوه Reminders.
- **اشتغل في جلسات تركيز بوقت محدد.** ابدأ، راقب، ووقف الجلسات بين العمليات المختلفة. مؤقتات launchd الخاصة بالجلسة بتدير انتهاء الوقت والإلغاء؛ وسجلات JSONL بتديك تحليلات لمدة التركيز.
- **استخدم Alfred لأكتر من مجرد مهام.** اعمل قوائم Reminders للمشاريع، احفظ ملاحظات مرجعية، افتح صندوق الوارد للمراجعة، التقط نص من الحافظة، وعدل الإعدادات المتحققة من نوعها.
- **شوف صندوق الوارد من شريط القوائم.** الإضافة الاختيارية لـ SwiftBar/xbar بتعرض عدد المهام اللي لسه ما خلصتش في صندوق الوارد وروابط لـ workflows الالتقاط.

الشغل الأصلي بيتراجع على أجهزة Mac حقيقية مستضافة على GitHub: الاختبارات بتشغل نوافذ Automator، وبعدين بترجع تقرا السجلات من Reminders وCalendar. شوف قسم [الاختبار والتوافق](#testing-and-compatibility) عشان تعرف نطاق الاختبارات دي.

## البداية السريعة: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

افتح الـ workflow في Automator وشغله عشان تجرب الالتقاط. عشان تخليه متاح كخدمة (Service)، ثبت الحزمة تحت `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

اعمل اختصار لوحة مفاتيح من **إعدادات النظام (System Settings) ← لوحة المفاتيح (Keyboard) ← اختصارات لوحة المفاتيح (Keyboard Shortcuts) ← الخدمات (Services)**. وافق على صلاحية الـ Automation لـ Reminders لما macOS يسألك. بعدين اكتب:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

الـ workflow الأصلي بيعمل تذكير بأولوية عالية ميعاده بكرة، وبيوجهه لقائمة `shopping`، وبيسجل السياق. ومن غير علامة مشروع أو سياق، الالتقاط السريع بيستخدم `Inbox`.

## صيغة الالتقاط

محلل المهام الأصلي والتقاط المهام في Alfred بيتعرفوا على العلامات دي. محولات المزودين التانيين ليها دعمها الخاص للحقول والتوجيه.

| الإدخال | المعنى | مثال |
| --- | --- | --- |
| `!1`, `!2`, `!3` | أولوية عالية، متوسطة، أو قليلة | `Fix login !1` |
| `today`, `tomorrow`, `next week` | تاريخ استحقاق نسبي | `Call dentist tomorrow` |
| اسم يوم في الأسبوع أو `next weekday` | تاريخ استحقاق بيوم الأسبوع | `Send report next monday` |
| `due:YYYY-MM-DD` | تاريخ استحقاق صريح | `Renew membership due:2027-03-15` |
| وقت جنب التاريخ | وقت الاستحقاق | `Call Alex tomorrow at 3pm` |
| `@context` | علامة السياق | `Buy milk @errands` |
| `+project` | توجيه للمشروع أو القائمة | `Draft outline +website` |

صيغ `due:today` و`due:tomorrow` مقبولة برضه. استخدم حروف أو أرقام أو شرطات سفلية أو شرطات عادية في علامات السياق والمشروع. الالتقاط السريع الأصلي بيدي أولوية لتوجيه المشروع على توجيه السياق.

التقاط Calendar بيستخدم `@` لمكان الميعاد وبيقبل المدة بالدقايق أو الساعات:

```text
Planning tomorrow 2pm 45m @Conference Room
```

من غير وقت أو مدة محددة، التقاط Calendar بيستخدم الساعة 9:00 الصبح ومدة ساعة واحدة، في أول تقويم متاح للكتابة.

## اختار workflow

### Workflows Apple الأصلية

| الـ Workflow | بيعمل إيه | الحزمة |
| --- | --- | --- |
| الالتقاط السريع | بيحلل نص المهمة ويعمل تذكير | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| التقاط من الحافظة | بيعمل تذكير من النص اللي في الحافظة | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| الالتقاط الجماعي | بيعمل تذكيرات من كذا سطر | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| التقاط المواعيد | بيعمل ميعاد في Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| المراجعة الأسبوعية | مراجعة موجهة وتفريغ أفكار في التذكيرات | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

افتح أي حزمة في Automator عشان تجربها، أو ثبتها تحت `~/Library/Services` عشان تستخدمها باختصارات الكيبورد. Reminders وCalendar محتاجين صلاحيات macOS Automation المناسبة.

### Alfred

محتاج Alfred مع Powerpack. ابني الحزمة من الكود الحالي:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

تقدر كمان تحمل الحزمة من صفحة [الإصدارات](https://github.com/somethingwithproof/MacGTD/releases). حزم الإصدارات بتمثل الكود وقت الـ tag بتاعها؛ الميزات اللي اتضافت على `main` بعد الإصدار محتاجة بناء من المصدر.

| الكلمة المفتاحية | الإجراء |
| --- | --- |
| `task` | التقاط مهمة مع تحليل التاريخ والسياق والمشروع والأولوية |
| `note` | حفظ ملاحظة مرجعية في Reminders |
| `project` | إنشاء قائمة جديدة في Reminders |
| `gtd process` | فتح Inbox للمراجعة اليدوية |
| `clip` | التقاط النص اللي في الحافظة |
| `gtd focus` | بدء جلسة تركيز، مراجعة حالتها، أو إيقافها |
| `gtd analytics` | مراجعة مدد التركيز المسجلة |
| `gtd preferences` | تعديل إعدادات الـ workflow |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

الإعدادات موجودة في `~/Library/Preferences/com.alfredgtd.plist`؛ وحالة جلسات التركيز والسجلات موجودة تحت `~/.gtd`. الإعدادات فيها قيم افتراضية مدمجة، وفحص لأنواع البيانات، واستيراد متحقق منه، وكتابة ذرية آمنة. جلسات التركيز مش بتغير إعدادات إشعارات النظام. معالجة صندوق الوارد بتفتح القائمة عشان تراجعها بنفسك؛ مش بتنقل أو تكمل المهام تلقائياً.

شوف [دليل Alfred](../../../workflows/alfred/README.md) و[توثيق مكتبة GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### محولات الالتقاط الخارجية

كل الـ workflows الأربعة بتاعة التقاط الـ API بتتختبر عن طريق نوافذ Automator حقيقية وبيئة اختبار TLS محلية في اختبارات E2E المستضافة. في مجموعة اختبارات يدوية منفصلة بتختبر الحفظ الحقيقي عند المزودين لما تكون الحسابات المخصصة متظبطة. Things وOmniFocus محتاجين مجموعة اختبارات التكامل المكتبي المرخصة.

| الوجهة | الآلية | الإعداد / المصدر |
| --- | --- | --- |
| Todoist | التقاط عبر API | [إعداد الـ Workflow وKeychain](../../../workflows/todoist/) |
| Notion | التقاط عبر API مصدر البيانات | [إعداد الـ Workflow وKeychain](../../../workflows/notion/) |
| Things 3 | URL scheme | [Workflow](../../../workflows/things/) |
| OmniFocus | AppleScript / URL scheme | [Workflow](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Workflow](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Workflow](../../../workflows/google/) |

محولات الـ API محتاجة إعداد بيانات الدخول؛ Microsoft محتاج تفويض OAuth مفوض، وGoogle Keep محتاج صلاحية وصول مؤهلة لـ Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

شوف [إعداد الـ API والترحيل ومتطلبات التفويض](../../../workflows/api/README.md). معرفات قواعد بيانات Notion الحالية بتترحل بس لما يكون في مصدر بيانات واحد بالظبط. الالتقاط مع Microsoft وGoogle بيستخدم APIs بدل اختصارات المتصفح غير الموثقة. رموز وصول OAuth بتحتاج تجديد عن طريق عميل الـ OAuth بتاعك. البيانات المرسلة بتستخدم مفاتيح JSON صريحة، وطلبات HTTPS بمهلة محددة، وتأكيد للاستجابة. رسائل الأخطاء بتحتفظ بتفاصيل الفشل مع إخفاء رمز الـ API المتسجل. شوف [SECURITY.md](../../../SECURITY.md) عشان تبلغ عن أي مشاكل أمنية.

### شريط القوائم وShortcuts

[دليل شريط القوائم](../../../workflows/menubar/README.md) بيشرح الإضافة الاختيارية لـ SwiftBar/xbar. ثبت خدمات Apple الأول، وبعدين ظبط مجلد الإضافات في تطبيق شريط القوائم واربط جواه ملف `workflows/menubar/gtd-menubar.sh`.

[دليل Shortcuts](../../../workflows/shortcuts/README.md) بيوفر خطوات إعداد يدوية لالتقاط النص والحافظة وSiri على macOS 12 والأحدث. Shortcuts والتفعيل الصوتي بـ Siri بره مجموعة الاختبارات المستضافة.

## البنية المعمارية

حزم Automator بتدمج AppleScript جواها عشان تشتغل كخدمات أصلية في النظام. Alfred بيجمع سكريبتات الإجراءات وبيبعت مدخلات المستخدم كـ arguments. مكتبة GTDLib بتوفر عمليات Reminders الأصلية المشتركة من كود AppleScript قابل للتعديل وحزمة سكريبت مجمعة.

- **محلل أساسي واحد:** ملف `scripts/sync-native-parser.py` بيدمج المحلل المشترك جوه الالتقاط السريع والتقاط المواعيد؛ وفحص التحقق بيكتشف أي اختلاف عن المصدر.
- **حالة تركيز مستمرة:** الاستدعاءات المنفصلة بتتشارك حالة الجلسة، مع مهام launchd مملوكة للجلسة وحساب محكوم للوقت اللي عدى.
- **حزم قابلة لإعادة الإنتاج:** عملية التغليف بتبني أرشيف جديد من الصفر، والاختبارات بتقارن محتوياته بالمصدر. والمكتبة ليها سكريبت تجميع منفصل.
- **اختبارات قابلة للمتابعة:** تقارير JUnit، وسجلات الأوامر، ومخرجات البناء المختبرة بتفضل محفوظة لمدة 14 يوم في GitHub Actions.

| المجلد | المسؤولية |
| --- | --- |
| [`workflows/`](../../../workflows/) | الحزم الأصلية، ومحولات المزودين، وAlfred، وShortcuts، وسكريبتات شريط القوائم |
| [`scripts/`](../../../scripts/) | التغليف، وتجميع المكتبة، ومزامنة المحلل، وتجهيز بيئة الاختبارات المستضافة |
| [`tests/`](../../../tests/) | التحقق، وفحوصات المكونات، واختبارات E2E المكتبية الأصلية |
| [`.github/workflows/`](../../../.github/workflows/) | CI، واختبارات E2E الليلية واليدوية، وصيانة المستودع |
| [`infra/`](../../../infra/) | إعداد اختياري لـ Mac runner محلي أو على EC2؛ الـ CI المستضاف مش محتاجه |

## الاختبار والتوافق

| النطاق | البيئة | إيه اللي بيتفحص |
| --- | --- | --- |
| التحقق | أجهزة macOS 15 و26 مستضافة على GitHub | تجميع AppleScript، الحزم، المحلل الأساسي، أهداف الإجراءات، الإعدادات، حالة التركيز، نقل الـ API في بيئة الاختبار، ودورة التغليف والاسترجاع |
| الفحوصات الأمنية | Ubuntu وmacOS 15 مستضافة على GitHub | Python CodeQL وShellCheck واختبار fuzzing محدود بـ Atheris للمحلل الأساسي المجمع |
| اختبارات E2E لمحولات المزودين | `macos-15-intel` مستضاف على GitHub | كل نوافذ الـ API الأربعة الأساسية، النقل عبر TLS، الحفظ وإعادة القراءة في بيئة الاختبار، فشل الـ API، الإلغاء، واختيار مصدر بيانات Notion |
| اختبارات E2E المباشرة للمزودين | تشغيل يدوي على Mac مستضاف على GitHub بأسرار مخصصة | التقاط حقيقي وقراءة راجعة من Todoist وNotion وMicrosoft وGoogle؛ بتفشل لو الحسابات مش موجودة |
| تكاملات التطبيقات المكتبية المرخصة | حساب محلي مخصص | تشغيل Things 3 وOmniFocus 4 وواجهة Alfred والتأكد من الحفظ |
| اختبارات E2E المكتبية الأصلية | `macos-15-intel` مستضاف على GitHub | نوافذ Automator حقيقية؛ بيانات Reminders وCalendar المحفوظة؛ المراجعة الأسبوعية؛ عدادات شريط القوائم؛ مكتبة GTDLib المجمعة؛ إجراءات Alfred الأصلية المغلفة؛ وانتهاء وإلغاء مؤقتات launchd الحقيقية |
| واجهة Alfred الاختيارية | حساب محلي مخصص، Alfred 5 + Powerpack | استيراد الـ workflow، استدعاء الكلمات المفتاحية، وقراءة التذكيرات تاني من خلال الواجهة المرخصة |

[تشغيل تحديث الـ API الموثق](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) نجح في **35 اختبار تحقق على كل منصة تحقق و26 اختبار E2E مكتبي**، من غير أي فشل أو أخطاء أو تخطي. التغطية المكتبية بتشمل 15 اختبار أصلي و11 اختبار لمحولات المزودين، بما فيهم اختبارات حقيقية لانتهاء مهلة الاتصال وفحوصات Keychain المؤقتة. التحقق بيشغل كمان فحوصات هيكل المستودع. النتايج دي بتغطي الشغل الأصلي وبيئات اختبار المزودين؛ لكنها مش بتثبت التوافق المباشر مع الخدمات الحقيقية أو التطبيقات المرخصة. الحالة الحالية ظاهرة في الشارات اللي فوق.

طلبات الدمج (Pull requests) والرفع على `main` بيشغلوا التحقق وبعده اختبارات E2E الأصلية. وكمان workflow اختبارات E2E بيشتغل كل ليلة وعند التشغيل اليدوي، وشامل اختبارات حتمية لمحولات المزودين. اختبارات المزودين المباشرة بتستخدم ملف الـ workflow اليدوي المنفصل `live-e2e.yml`. الـ CI الافتراضي بيستخدم أجهزة Mac مؤقتة مستضافة على GitHub، وبيئات اختبار معزولة، وعمليات فرعية بمهل محددة؛ مش محتاج self-hosted runner ولا بيانات حسابات خارجية لمجموعة الاختبارات الافتراضية. المجموعة المباشرة اليدوية هي اللي محتاجة أسرار مخصصة للمزودين.

إصدارات macOS الأقدم مش بتتفحص في الـ CI الحالي. تشغيلات المزودين المباشرة محتاجة أسرار مخصصة ولسه ما اتوثقتش. Shortcuts وSiri وتطبيقات سطح المكتب المرخصة بره المجموعة المستضافة الافتراضية. اختبارات الإجراءات الأصلية بتختبر سكريبتات Alfred المغلفة بشكل مباشر؛ ومش بتثبت التوافق الكامل مع واجهة Alfred. شوف [إعداد الاختبارات والمتطلبات والتغطية](../../../tests/e2e/README.md).

## اللغات والتوطين

نصوص واجهة سطر الأوامر، ومشغل الاختبارات، وشريط القوائم اللي بتظهر للمستخدم متوفرة بـ 45 لغة ومحلية (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) تحت `locales/` عن طريق `scripts/i18n.py` من غير أي مكتبات خارجية. تحديد اللغة بيفحص `--lang` الأول، وبعدين `LC_ALL` و`LC_MESSAGES` و`LANG`، ولو مفيش حاجة فيهم بيرجع لـ `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## التطوير

ثبت [mise](https://mise.jdx.dev/) واستخدم إصدار Python المثبت في `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

التحقق بيكتب التقارير تحت `test-results/`؛ وسكريبتات البناء بتكتب في `dist/`. عشان تشغل مجموعة الاختبارات المكتبية المستضافة على `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

تشغيل اختبارات E2E المكتبية محلياً محتاج حساب اختبار مخصص مسجل دخول والصلاحيات المشروحة في [دليل E2E](../../../tests/e2e/README.md). سكريبت تجهيز الصلاحيات المستضاف مقصور على مهام GitHub المؤقتة بس.

استخدم [Conventional Commits](https://www.conventionalcommits.org/) واتبع [CONTRIBUTING.md](../../../CONTRIBUTING.md). آخر التغييرات متسجلة في [CHANGELOG.md](../../../CHANGELOG.md).

الضوابط الأمنية، والتحقق من توقيع الإصدارات، وقيود Scorecard اللي لسه موجودة متوثقة في [التقييم الأمني](../../../docs/security-assessment.md).
workflow الإصدارات بيبني الحزم وبيوثقها قبل ما يعمل مسودة إصدار، وده بيشمل شهادة مصدر in-toto موقعة وحزم Sigstore متحقق منها قصاد الـ commit والمرجع الأصلي. شهادة المصدر الجديدة دي بتطبق على بناءات الـ workflow ده بس، مش على التحميلات القديمة.

## تاريخ المشروع والترخيص

MacGTD بيجمع المستودعات القديمة MacGTD-Native وMacGTD-Microsoft وMacGTD-Google وAlfredGTD في مكان واحد. المشروع مرخص تحت [رخصة MIT](../../../LICENSE).
