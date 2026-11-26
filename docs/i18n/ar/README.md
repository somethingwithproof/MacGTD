# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · **العربية** · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD هي مجموعة من مسارات عمل macOS لالتقاط المهام، وتنظيم التذكيرات، وتشغيل جلسات تركيز مؤقتة باستخدام التطبيقات التي تستخدمها بالفعل.**

تم تصميمها استنادًا إلى منهجية [Getting Things Done](https://gettingthingsdone.com/)، وهي توفّر الالتقاط عبر الحوار والحافظة والالتقاط الدفعي في تطبيق Apple Reminders؛ والتقاط الأحداث في تطبيق Calendar؛ وأوامر المهام والملاحظات والمشاريع والتركيز في Alfred. تحافظ AppleScript وAutomator على بقاء مسارات العمل الأصلية قريبة من macOS. تستخدم محولات واجهات برمجة التطبيقات كلاً من Todoist API v1 وNotion API 2026-03-11 وMicrosoft Graph v1.0 وGoogle Keep v1. كما تتضمن أيضًا محولات لـ Things وOmniFocus. تتحقق الاختبارات المستضافة من محولات واجهات برمجة التطبيقات مقابل بيئة اختبار HTTPS محلية؛ ولا يزال التوافق المباشر يتطلب حسابات مزوّدين مخصصة.

## ما يمكنك فعله

- **التقط المهام دون التبديل بين التطبيقات.** استخدم خدمة Automator، أو كلمة مفتاحية في Alfred، أو الحافظة لإضافة مهمة. ينشئ الالتقاط الدفعي تذكيرًا واحدًا لكل سطر غير فارغ.
- **حوّل النصوص إلى مهام مهيكلة.** حلّل التواريخ النسبية وتواريخ ISO والأوقات والأولويات والسياقات والمشاريع باستخدام محلل AppleScript الإنتاجي المشترك بين الالتقاط السريع الأصلي والتقاط Calendar.
- **التقط الأحداث وراجع صندوق الوارد.** أنشئ أحداث Calendar مع الوقت والمدة والموقع؛ ونفّذ مراجعة أسبوعية من خمس خطوات مع تفريغ ذهني في Reminders.
- **اعمل في جلسات تركيز مؤقتة.** ابدأ الجلسات وافحصها وأوقفها عبر العمليات المختلفة. تتولى مؤقتات launchd المملوكة للجلسة انتهاء الصلاحية والإلغاء؛ وتوفر سجلات JSONL تحليلات المدة.
- **استخدم Alfred لأكثر من مجرد المهام.** أنشئ قوائم Reminders للمشاريع، واحفظ الملاحظات المرجعية، وافتح صندوق الوارد للمراجعة، والتقط نص الحافظة، وحرّر التفضيلات ذات الأنواع المحددة.
- **اطّلع على صندوق الوارد من شريط القوائم.** يعرض ملحق SwiftBar/xbar الاختياري عدد عناصر صندوق الوارد غير المكتملة ويوفر روابط لمسارات عمل الالتقاط.

يتم التحقق من السلوك الأصلي على أجهزة Mac حقيقية مستضافة على GitHub: تشغّل الاختبارات مربعات حوار Automator، ثم تقرأ سجلات Reminders وCalendar للتحقق. راجع [الاختبار والتوافق](#testing-and-compatibility) للاطلاع على نطاق هذه الأدلة.

## البدء السريع: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

افتح مسار العمل في Automator وشغّله لتجربة الالتقاط. ولجعله متاحًا كخدمة (Service)، ثبّت الحزمة ضمن `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

عيّن اختصارًا في **System Settings → Keyboard → Keyboard Shortcuts → Services**. اسمح بالوصول التلقائي (Automation) إلى Reminders عندما يطلب macOS ذلك. أدخل:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

ينشئ مسار العمل الأصلي تذكيرًا عالي الأولوية مستحقًا غدًا، ويوجهه إلى قائمة `shopping`، ويسجّل السياق. وفي حال عدم وجود علامة مشروع أو سياق، يستخدم الالتقاط السريع قائمة `Inbox`.

## صيغة الالتقاط

يتعرّف محلل المهام الأصلي والتقاط المهام في Alfred على هذه العلامات. وتمتلك محولات المزوّدين دعمها الخاص للحقول والتوجيه.

| الإدخال | المعنى | المثال |
| --- | --- | --- |
| `!1`, `!2`, `!3` | أولوية عالية أو متوسطة أو منخفضة | `Fix login !1` |
| `today`, `tomorrow`, `next week` | تاريخ استحقاق نسبي | `Call dentist tomorrow` |
| اسم يوم أو `next weekday` | تاريخ استحقاق حسب يوم الأسبوع | `Send report next monday` |
| `due:YYYY-MM-DD` | تاريخ استحقاق صريح | `Renew membership due:2027-03-15` |
| وقت بجانب التاريخ | وقت الاستحقاق | `Call Alex tomorrow at 3pm` |
| `@context` | علامة السياق | `Buy milk @errands` |
| `+project` | التوجيه إلى مشروع/قائمة | `Draft outline +website` |

تُقبل أيضًا الصيغتان `due:today` و`due:tomorrow`. استخدم أحرفًا أو أرقامًا أو شرطات سفلية أو واصلات في علامات السياق والمشروع. يمنح الالتقاط السريع الأصلي أولوية لتوجيه المشروع على توجيه السياق.

يستخدم التقاط Calendar الرمز `@` لموقع الحدث ويقبل مدة بالدقائق أو الساعات:

```text
Planning tomorrow 2pm 45m @Conference Room
```

عند عدم تحديد وقت أو مدة صريحة، يستخدم التقاط Calendar الساعة 9:00 صباحًا ومدة ساعة واحدة، في أول تقويم قابل للكتابة.

## اختر مسار عمل

### مسارات عمل Apple الأصلية

| مسار العمل | السلوك | الحزمة |
| --- | --- | --- |
| الالتقاط السريع | تحليل نص المهمة وإنشاء تذكير | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| التقاط الحافظة | إنشاء تذكير من نص الحافظة | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| الالتقاط الدفعي | إنشاء تذكيرات من عدة أسطر | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| التقاط الأحداث | إنشاء حدث في Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| المراجعة الأسبوعية | مراجعة موجّهة وتفريغ ذهني للتذكيرات | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

افتح أي حزمة في Automator لتجربتها، أو ثبّتها ضمن `~/Library/Services` للوصول عبر لوحة المفاتيح. يحتاج كل من Reminders وCalendar إلى أذونات macOS Automation المناسبة.

### Alfred

يتطلب Alfred مع Powerpack. قم ببناء الحزمة من المصدر الحالي:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

يمكنك أيضًا تنزيل الحزمة من [الإصدارات](https://github.com/somethingwithproof/MacGTD/releases). تعكس حزم الإصدارات مصدرها الموسوم (tagged source)؛ أما الميزات المضافة إلى `main` بعد الإصدار فتتطلب البناء من المصدر.

| الكلمة المفتاحية | الإجراء |
| --- | --- |
| `task` | التقاط مهمة مع تحليل التاريخ والسياق والمشروع والأولوية |
| `note` | تخزين ملاحظة مرجعية في Reminders |
| `project` | إنشاء قائمة في Reminders |
| `gtd process` | فتح صندوق الوارد للمراجعة البشرية |
| `clip` | التقاط نص الحافظة |
| `gtd focus` | بدء جلسة تركيز أو فحص حالتها أو إيقافها |
| `gtd analytics` | فحص مدد التركيز المسجلة |
| `gtd preferences` | تعديل تفضيلات مسار العمل |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

تُحفظ التفضيلات في `~/Library/Preferences/com.alfredgtd.plist`؛ بينما تُحفظ حالة التركيز والسجلات ضمن `~/.gtd`. تحتوي التفضيلات على قيم افتراضية مدمجة، وفحوصات للأنواع، وعمليات استيراد محققة، وعمليات كتابة ذرية (atomic writes). لا تغيّر جلسات التركيز إعدادات إشعارات النظام. تفتح معالجة صندوق الوارد القائمة للمراجعة؛ ولا تنقل المهام أو تكملها تلقائيًا.

راجع [دليل Alfred](../../../workflows/alfred/README.md) و[وثائق مكتبة GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### محولات الالتقاط الخارجية

تُختبر مسارات عمل التقاط واجهات برمجة التطبيقات الأربعة جميعها عبر مربعات حوار Automator حقيقية وبيئة اختبار TLS محلية في اختبارات E2E المستضافة. كما تختبر مجموعة اختبارات يدوية منفصلة الاستمرارية الفعلية لدى المزوّدين عند تهيئة حسابات مخصصة. ويتطلب Things وOmniFocus مجموعة تكامل سطح المكتب المرخّصة.

| الهدف | الآلية | الإعداد / المصدر |
| --- | --- | --- |
| Todoist | الالتقاط عبر API | [إعداد مسار العمل وKeychain](../../../workflows/todoist/) |
| Notion | الالتقاط عبر API لمصدر البيانات | [إعداد مسار العمل وKeychain](../../../workflows/notion/) |
| Things 3 | مخطط URL | [مسار العمل](../../../workflows/things/) |
| OmniFocus | AppleScript / مخطط URL | [مسار العمل](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [مسار العمل](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [مسار العمل](../../../workflows/google/) |

تتطلب محولات واجهات برمجة التطبيقات إعداد بيانات الاعتماد؛ ويحتاج Microsoft إلى تفويض OAuth مفوّض، بينما يحتاج Google Keep إلى وصول Workspace مؤهّل:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

راجع [متطلبات إعداد API والترحيل والتفويض](../../../workflows/api/README.md). لا يتم ترحيل معرفات قواعد بيانات Notion الحالية إلا عند العثور على مصدر بيانات واحد بالضبط. يستخدم التقاط Microsoft وGoogle واجهات برمجة التطبيقات بدلاً من اختصارات المتصفح غير الموثقة. وتتطلب رموز وصول OAuth التجديد عبر عميل OAuth الخاص بك. تستخدم الحمولات (Payloads) مفاتيح JSON صريحة، وطلبات HTTPS محدودة، وتأكيد الاستجابة. وتحتفظ رسائل الخطأ بتفاصيل الفشل مع تنقيح رمز API المهيأ. راجع [SECURITY.md](../../../SECURITY.md) للإبلاغ عن المشكلات الأمنية.

### شريط القوائم وShortcuts

يغطي [دليل شريط القوائم](../../../workflows/menubar/README.md) ملحق SwiftBar/xbar الاختياري. ثبّت خدمات Apple Services أولاً، ثم هيّئ مجلد الملحقات في تطبيق شريط القوائم واربط `workflows/menubar/gtd-menubar.sh` بداخله.

يوفر [دليل Shortcuts](../../../workflows/shortcuts/README.md) إعدادًا يدويًا لالتقاط النصوص والحافظة والتقاط Siri على نظام macOS 12+. يقع كل من Shortcuts والتفعيل الصوتي عبر Siri خارج مجموعة الاختبارات المستضافة.

## البنية المعمارية

تُضمّن حزم Automator نصوص AppleScript لتتمكن من العمل كخدمات أصلية. يحزّم Alfred نصوص الإجراءات ويمرر إدخال المستخدم كوسائط. وتكشف GTDLib عمليات Reminders الأصلية المشتركة من مصدر AppleScript قابل للتحرير وحزمة نصية مترجمة.

- **محلل إنتاجي واحد:** يضمّن `scripts/sync-native-parser.py` المحلل المشترك في Quick Capture وEvent Capture؛ ويكتشف التحقق أي انحراف عن المصدر.
- **حالة تركيز دائمة:** تتشارك الاستدعاءات المنفصلة حالة الجلسة، مع مهام launchd مملوكة وحساب محدود للوقت المنقضي.
- **حزم قابلة لإعادة الإنتاج:** يبني التحزيم أرشيفًا جديدًا، وتقارن الاختبارات محتوياته بالمصدر. وتمتلك المكتبة سكربت ترجمة منفصلاً.
- **اختبارات قابلة للمراقبة:** تُحفظ تقارير JUnit وسجلات الأوامر وبنى البناء المختبرة لمدة 14 يومًا في GitHub Actions.

| الدليل | المسؤولية |
| --- | --- |
| [`workflows/`](../../../workflows/) | الحزم الأصلية، ومحولات المزوّدين، وAlfred، وShortcuts، وسكربتات شريط القوائم |
| [`scripts/`](../../../scripts/) | التحزيم، وترجمة المكتبة، ومزامنة المحلل، وتجهيز الاختبارات المستضافة |
| [`tests/`](../../../tests/) | التحقق، وفحوصات المكونات، واختبارات E2E الأصلية لسطح المكتب |
| [`.github/workflows/`](../../../.github/workflows/) | التكامل المستمر (CI)، واختبارات E2E الليلية/اليدوية، وصيانة المستودع |
| [`infra/`](../../../infra/) | إعداد مشغّل Mac محلي أو على EC2 بشكل اختياري؛ لا يتطلبه CI المستضاف |

## الاختبار والتوافق

| النطاق | البيئة | ما يتم التحقق منه |
| --- | --- | --- |
| التحقق | macOS 15 و26 المستضافان على GitHub | ترجمة AppleScript، والحزم، والمحلل الإنتاجي، وأهداف الإجراءات، والتفضيلات، وحالة التركيز، ونقل API في بيئة الاختبار، والتحقق الدائري للحزم |
| الفحوصات الأمنية | Ubuntu وmacOS 15 المستضافان على GitHub | CodeQL لـ Python، وShellCheck، واختبار Atheris العشوائي المحدود للمحلل الإنتاجي المترجم |
| اختبارات E2E لمحولات المزوّدين | `macos-15-intel` المستضاف على GitHub | مربعات حوار API الإنتاجية الأربعة جميعها، ونقل TLS، والحفظ/القراءة في بيئة الاختبار، وإخفاقات API، والإلغاء، واختيار مصدر Notion |
| اختبارات E2E للمزوّدين الفعليين | تشغيل Mac يدوي مستضاف على GitHub مع أسرار مخصصة | الالتقاط الفعلي في Todoist وNotion وMicrosoft وGoogle والقراءة من المزوّدين؛ يفشل إذا كانت الحسابات مفقودة |
| تكاملات سطح المكتب المرخّصة | حساب محلي مخصص | استدعاء واجهة المستخدم والحفظ في Things 3 وOmniFocus 4 وAlfred |
| اختبارات E2E الأصلية لسطح المكتب | `macos-15-intel` المستضاف على GitHub | مربعات حوار Automator حقيقية؛ وبيانات Reminders وCalendar المحفوظة؛ والمراجعة الأسبوعية؛ وعدادات القائمة؛ ومكتبة GTDLib المترجمة؛ وإجراءات Alfred الأصلية المحزّمة؛ وانتهاء صلاحية مؤقت launchd الفعلي وإلغاؤه |
| واجهة Alfred الاختيارية | حساب محلي مخصص، Alfred 5 + Powerpack | استيراد مسار العمل، والاستدعاء بالكلمات المفتاحية، وقراءة التذكير عبر الواجهة المرخّصة |

نجح [تشغيل تحديث API المتحقق منه](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) في **35 اختبار تحقق على كل منصة تحقق و26 اختبار E2E لسطح المكتب**، دون أي إخفاقات أو أخطاء أو تخطيات. تشمل تغطية سطح المكتب 15 اختبارًا أصليًا و11 اختبارًا لمحولات المزوّدين، بما في ذلك فحوصات مهلة النقل الفعلية وفحوصات Keychain المؤقتة. كما يشغّل التحقق فحوصات بنية المستودع. تغطي هذه النتائج السلوك الأصلي وبيئات اختبار المزوّدين؛ ولا تثبت التوافق مع المزوّدين الفعليين أو التطبيقات المرخّصة. تظهر الحالة الحالية عبر الشارات أعلاه.

تشغّل طلبات السحب وعمليات الدفع إلى `main` التحقق متبوعًا باختبارات E2E الأصلية. كما يعمل مسار عمل E2E ليليًا وعند التشغيل اليدوي، متضمنًا اختبارات محولات المزوّدين الحتمية. وتستخدم اختبارات المزوّدين الفعليين مسار العمل اليدوي المنفصل `live-e2e.yml`. يستخدم CI الافتراضي أجهزة Mac مؤقتة مستضافة على GitHub، وبيئات اختبار معزولة، وعمليات فرعية محدودة؛ ولا يلزم وجود مشغّل مستضاف ذاتيًا أو بيانات اعتماد حسابات خارجية لمجموعة الاختبارات الافتراضية. بينما تتطلب المجموعة الحية اليدوية أسرار مزوّدين مخصصة.

لا يتم التحقق من إصدارات macOS الأقدم بواسطة CI الحالي. وتتطلب عمليات التشغيل الفعلية للمزوّدين أسرارًا مخصصة ولم يتم التحقق منها بعد. وتقع Shortcuts/Siri وتطبيقات سطح المكتب المرخّصة خارج المجموعة المستضافة الافتراضية. تمارس اختبارات الإجراءات الأصلية سكربتات Alfred المحزّمة مباشرةً؛ ولا تثبت التوافق الكامل مع واجهة مستخدم Alfred. راجع [إعداد الاختبارات والمتطلبات المسبقة والتغطية](../../../tests/e2e/README.md).

## التوطين

تُشحن السلاسل النصية المواجهة للمستخدم في واجهة سطر الأوامر ومشغّل الاختبارات وشريط القوائم بـ 45 لغة محلية (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) ضمن `locales/` عبر `scripts/i18n.py` دون أي اعتماديات خارجية. يتحقق تحديد اللغة المحلية من `--lang`، ثم `LC_ALL`، و`LC_MESSAGES`، و`LANG`، مع الرجوع إلى `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## التطوير

ثبّت [mise](https://mise.jdx.dev/) واستخدم إصدار Python المثبّت في `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

يكتب التحقق التقارير ضمن `test-results/`؛ وتكتب سكربتات البناء المخرجات في `dist/`. لتشغيل مجموعة سطح المكتب المستضافة على `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

تتطلب اختبارات E2E المحلية لسطح المكتب حساب اختبار مخصصًا مسجّل الدخول والأذونات الموضحة في [دليل E2E](../../../tests/e2e/README.md). ويقتصر سكربت تجهيز الأذونات المستضاف على المهام المؤقتة المستضافة على GitHub.

استخدم [Conventional Commits](https://www.conventionalcommits.org/) واتبع [CONTRIBUTING.md](../../../CONTRIBUTING.md). تُسجّل التغييرات الأخيرة في [CHANGELOG.md](../../../CHANGELOG.md).

تُوثّق الضوابط الأمنية، والتحقق من توقيع الإصدارات، وقيود Scorecard المتبقية في [التقييم الأمني](../../../docs/security-assessment.md).
يبني مسار عمل الإصدار الحزم ويشهد بصحتها قبل إنشاء مسودة إصدار،
بما في ذلك بيانات مصدر in-toto موقّعة وحزم Sigstore المتحقق منها مقابل
الالتزام المصدري والمرجع. تنطبق بيانات المصدر الجديدة على بنيات مسار العمل تلك، لا على
التنزيلات الأقدم.

## تاريخ المشروع والترخيص

تدمج MacGTD مستودعات MacGTD-Native وMacGTD-Microsoft وMacGTD-Google وAlfredGTD السابقة. وهي مرخّصة بموجب [رخصة MIT](../../../LICENSE).
