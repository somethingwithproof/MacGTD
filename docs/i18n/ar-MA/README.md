# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · **العربية (المغرب)** · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD هو مجموعة ديال workflows لـ macOS باش تسجّل المهام، تنظّم التذكيرات، وتطلق جلسات ديال التركيز بوقت محدد مع التطبيقات لي ديجا كتخدم بيهم.**

مبني على منهجية [Getting Things Done](https://gettingthingsdone.com/)، وكيجيب تسجيل المهام من نافذة الحوار، الحافظة، والإدخال بالجملة لـ Apple Reminders؛ وتسجيل المواعيد لـ Calendar؛ وأوامر ديال المهام، الملاحظات، المشاريع، والتركيز لـ Alfred. AppleScript و Automator كيخليو الـ workflows الأصليين قراب ومندمجين مزيان مع macOS. المكيّفات ديال الـ API كتستعمل Todoist API v1 و Notion API 2026-03-11 و Microsoft Graph v1.0 و Google Keep v1. كاينين حتى مكيّفات ديال Things و OmniFocus. الاختبارات المستضافة كتحقق من مكيّفات الـ API قدام fixture محلي ديال HTTPS؛ أما التوافق المباشر فمازال خاصو حسابات مخصصة عند المزوّدين.

## شنو تقدر دير بيه

- **سجّل المهام بلا ما تبدّل التطبيق.** استعمل Automator Service، ولا كلمة مفتاحية فـ Alfred، ولا الحافظة باش تزيد مهمة. التسجيل بالجملة كيصايب تذكير واحد لكل سطر ما خاويش.
- **حوّل النص لمهام منظمة.** حلّل التواريخ النسبية وتواريخ ISO، الأوقات، الأولويات، السياقات، والمشاريع باستعمال محلّل AppleScript الإنتاجي لي مشترك ما بين التسجيل السريع الأصلي وتسجيل Calendar.
- **سجّل المواعيد وراجع صندوق الوارد.** صايب مواعيد فـ Calendar بالوقت والمدة والمكان؛ ودير مراجعة أسبوعية فيها خمسة ديال المراحل مع تفريغ الأفكار مباشرة فـ Reminders.
- **خدم فـ جلسات تركيز بوقت محدد.** بدا، راقب، ووقّف الجلسات ما بين العمليات المختلفة. مؤقّتات launchd لي تابعة لكل جلسة كتكلف بنهاية الوقت والإلغاء؛ وسجلات JSONL كتعطيك إحصائيات على مدد التركيز.
- **استعمل Alfred لشي حوايج كثر من المهام.** صايب لوائح فـ Reminders للمشاريع، خزّن ملاحظات مرجعية، حلّ صندوق الوارد للمراجعة، سجّل النص لي فـ الحافظة، وعدّل الإعدادات لي عندها أنواع مضبوطة.
- **شوف صندوق الوارد ديالك من شريط القوائم.** الإضافة الاختيارية ديال SwiftBar/xbar كتورّيك عدد المهام لي مازال ما كملاتش فـ صندوق الوارد وروابط سريعة لـ workflows ديال التسجيل.

السلوك الأصلي كيتجرّب على أجهزة Mac حقيقية مستضافة على GitHub: الاختبارات كتخدم بنافذات Automator، ومن بعد كتقرا السجلات لي تخزّنات فـ Reminders و Calendar. شوف [الاختبارات والتوافق](#testing-and-compatibility) باش تعرف النطاق ديال هاد التحقق.

## بداية سريعة: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

حلّ الـ workflow فـ Automator وشغّلو باش تجرّب التسجيل. باش يولي متاح كـ Service، ثبّت الحزمة تحت `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

دير ليه اختصار ديال الكلافيي فـ **System Settings → Keyboard → Keyboard Shortcuts → Services**. عطيه الإذن ديال Automation باش يدخل لـ Reminders ملي يطلب منك macOS هادشي. من بعد دخل:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

الـ workflow الأصلي كيصايب تذكير بأولوية عالية موعدو غدا، كيحطّو فـ لائحة `shopping`، وكيسجّل السياق. إلى ما درتيش علامة ديال مشروع ولا سياق، التسجيل السريع كيستعمل `Inbox`.

## صيغة التسجيل

المحلّل الأصلي ديال المهام وتسجيل المهام فـ Alfred كيفهمو هاد العلامات. المكيّفات ديال المزوّدين عندها دعم خاص بيها للحقول والتوجيه.

| الإدخال | المعنى | مثال |
| --- | --- | --- |
| `!1`, `!2`, `!3` | أولوية عالية، متوسطة، ولا منخفضة | `Fix login !1` |
| `today`, `tomorrow`, `next week` | تاريخ استحقاق نسبي | `Call dentist tomorrow` |
| يوم فـ السيمانة ولا `next weekday` | تاريخ استحقاق حسب يوم السيمانة | `Send report next monday` |
| `due:YYYY-MM-DD` | تاريخ استحقاق محدد | `Renew membership due:2027-03-15` |
| وقت حدا التاريخ | ساعة الاستحقاق | `Call Alex tomorrow at 3pm` |
| `@context` | علامة ديال السياق | `Buy milk @errands` |
| `+project` | توجيه للمشروع/اللائحة | `Draft outline +website` |

حتى `due:today` و `due:tomorrow` مقبولين. استعمل حروف، أرقام، شرطات سفلية، ولا شرطات عادية فـ علامات السياق والمشروع. فـ التسجيل السريع الأصلي، توجيه المشروع عندو الأولوية على توجيه السياق.

تسجيل Calendar كيستعمل `@` لبلاصة الموعد وكيقبل المدة بالدقائق ولا بالسوايع:

```text
Planning tomorrow 2pm 45m @Conference Room
```

إلى ما حددتيش الوقت ولا المدة، تسجيل Calendar كيستعمل 9:00 صباحاً ومدة ساعة وحدة، فـ أول تقويم تقدر تكتب فيه.

## اختار workflow

### Workflows الأصليين ديال Apple

| الـ Workflow | شنو كيدير | الحزمة |
| --- | --- | --- |
| التسجيل السريع | كيحلّل نص المهمة وكيصايب تذكير | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| التسجيل من الحافظة | كيصايب تذكير من النص لي فـ الحافظة | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| التسجيل بالجملة | كيصايب تذكيرات من عدة سطور | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| تسجيل المواعيد | كيصايب موعد فـ Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| المراجعة الأسبوعية | مراجعة موجّهة وتفريغ الأفكار فـ التذكيرات | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

حلّ أي حزمة فـ Automator باش تجرّبها، ولا ثبّتها تحت `~/Library/Services` باش توصل ليها باختصارات الكلافيي. Reminders و Calendar خاصهم أذونات Automation المناسبة فـ macOS.

### Alfred

كيحتاج Alfred مع Powerpack. ابني الحزمة من الكود المصدري الحالي:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

تقدر كذلك تحمّل الحزمة من [الإصدارات](https://github.com/somethingwithproof/MacGTD/releases). الحزم ديال الإصدارات كتعكس الكود ديال التاغ ديالها؛ الميزات لي تزادت فـ `main` من بعد شي إصدار خاصها بناء من المصدر.

| الكلمة المفتاحية | الإجراء |
| --- | --- |
| `task` | تسجيل مهمة مع تحليل التاريخ، السياق، المشروع، والأولوية |
| `note` | تخزين ملاحظة مرجعية فـ Reminders |
| `project` | إنشاء لائحة جديدة فـ Reminders |
| `gtd process` | فتح Inbox للمراجعة اليدوية |
| `clip` | تسجيل النص لي فـ الحافظة |
| `gtd focus` | بداية جلسة تركيز، مراقبة الحالة ديالها، ولا توقيفها |
| `gtd analytics` | الاطلاع على مدد التركيز المسجّلة |
| `gtd preferences` | تعديل إعدادات الـ workflow |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

الإعدادات كتخزّن فـ `~/Library/Preferences/com.alfredgtd.plist`؛ أما حالة التركيز والسجلات فكاينين تحت `~/.gtd`. الإعدادات عندها قيم افتراضية مدمجة، فحص ديال الأنواع، استيراد متحقّق منو، وكتابة ذرية (atomic writes). جلسات التركيز ما كتبدّلش إعدادات الإشعارات ديال النظام. معالجة Inbox كتحلّ غير اللائحة للمراجعة؛ ما كتحوّلش وما كتكمّلش المهام بوحدها.

شوف [دليل Alfred](../../../workflows/alfred/README.md) و [توثيق مكتبة GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### مكيّفات التسجيل الخارجية

كاع الـ workflows الأربعة ديال التسجيل عبر الـ API كيتجرّبو بنافذات Automator حقيقية و fixture محلي ديال TLS فـ اختبارات E2E المستضافة. كاينة مجموعة اختبارات يدوية منفصلة كتجرّب التخزين الحقيقي عند المزوّدين ملي كتكون الحسابات المخصصة مضبوطة. أما Things و OmniFocus فخاصهم مجموعة اختبارات تكامل سطح المكتب المرخّصة.

| الوجهة | الآلية | الإعداد / المصدر |
| --- | --- | --- |
| Todoist | التسجيل عبر API | [الـ Workflow وإعداد Keychain](../../../workflows/todoist/) |
| Notion | التسجيل عبر API مصدر البيانات | [الـ Workflow وإعداد Keychain](../../../workflows/notion/) |
| Things 3 | نظام الروابط (URL scheme) | [الـ Workflow](../../../workflows/things/) |
| OmniFocus | AppleScript / URL scheme | [الـ Workflow](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [الـ Workflow](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [الـ Workflow](../../../workflows/google/) |

مكيّفات الـ API خاصها إعداد بيانات الدخول؛ Microsoft كيحتاج تفويض OAuth مفوّض و Google Keep كيحتاج وصول مؤهّل لـ Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

شوف [إعداد الـ API والترحيل ومتطلبات التفويض](../../../workflows/api/README.md). معرّفات قواعد بيانات Notion القديمة كترحّل غير إلى تلقى مصدر بيانات واحد بالضبط. التسجيل فـ Microsoft و Google كيستعمل الـ APIs عوض اختصارات المتصفح غير الموثّقة. رموز الوصول ديال OAuth خاصهم يتجدّدو عبر عميل OAuth ديالك. البيانات المرسلة كتستعمل مفاتيح JSON واضحة، طلبات HTTPS محدودة المدة، وتأكيد ديال الرد. رسائل الخطأ كتحتافظ بتفاصيل المشكل ولكن كتحجب رمز الـ API المضبوط. شوف [SECURITY.md](../../../SECURITY.md) باش تبلّغ على المشاكل الأمنية.

### شريط القوائم و Shortcuts

[دليل شريط القوائم](../../../workflows/menubar/README.md) كيشرح الإضافة الاختيارية ديال SwiftBar/xbar. ثبّت خدمات Apple أولاً، ومن بعد اضبط مجلد الإضافات فـ تطبيق شريط القوائم ديالك وربط فيه `workflows/menubar/gtd-menubar.sh`.

[دليل Shortcuts](../../../workflows/shortcuts/README.md) كيعطي الإعداد اليدوي لتسجيل النص، الحافظة، و Siri على macOS 12+. Shortcuts والتفعيل الصوتي ديال Siri خارجين على مجموعة الاختبارات المستضافة.

## البنية التقنية

حزم Automator كيكون مدمج فيها AppleScript باش تقدر تخدم كـ Services أصلية. Alfred كيجمع السكربتات ديال الإجراءات وكيدوّز إدخال المستخدم كوسائط (arguments). مكتبة GTDLib كتوفّر عمليات Reminders الأصلية المشتركة من كود AppleScript قابل للتعديل وحزمة سكربت مترجمة (compiled).

- **محلّل إنتاجي واحد:** `scripts/sync-native-parser.py` كيدمج المحلّل المشترك فـ Quick Capture و Event Capture؛ وفحص التحقق كيكتشف أي اختلاف على الكود المصدري.
- **حالة تركيز مستمرة:** التشغيلات المنفصلة كتشارك نفس حالة الجلسة، مع مهام launchd تابعة للجلسة وحساب مضبوط للوقت لي داز.
- **حزم قابلة لإعادة الإنتاج:** التغليف كيبني أرشيف جديد، والاختبارات كتقارن المحتوى ديالو مع المصدر. والمكتبة عندها سكربت ترجمة بوحدو.
- **اختبارات قابلة للمراقبة:** تقارير JUnit، سجلات الأوامر، ومخرجات البناء المختبرة كتبقى محفوظة لمدة 14 يوم فـ GitHub Actions.

| المجلد | الدور ديالو |
| --- | --- |
| [`workflows/`](../../../workflows/) | الحزم الأصلية، مكيّفات المزوّدين، Alfred، Shortcuts، وسكربتات شريط القوائم |
| [`scripts/`](../../../scripts/) | التغليف، ترجمة المكتبة، مزامنة المحلّل، وتهيئة الاختبارات المستضافة |
| [`tests/`](../../../tests/) | التحقق، فحص المكونات، واختبارات E2E الأصلية لسطح المكتب |
| [`.github/workflows/`](../../../.github/workflows/) | CI، اختبارات E2E الليلية/اليدوية، وصيانة المستودع |
| [`infra/`](../../../infra/) | إعداد اختياري لـ Mac runner محلي ولا على EC2؛ الـ CI المستضاف ما كيحتاجوش |

## الاختبارات والتوافق

| النطاق | البيئة | شنو كيتفحص |
| --- | --- | --- |
| التحقق | macOS 15 و 26 مستضافين على GitHub | ترجمة AppleScript، الحزم، المحلّل الإنتاجي، أهداف الإجراءات، الإعدادات، حالة التركيز، نقل API عبر الـ fixture، واختبار تغليف وفك الحزم |
| الفحوصات الأمنية | Ubuntu و macOS 15 مستضافين على GitHub | Python CodeQL و ShellCheck واختبار fuzzing محدود بـ Atheris للمحلّل الإنتاجي المترجم |
| اختبارات E2E لمكيّفات المزوّدين | `macos-15-intel` مستضاف على GitHub | النوافذ الأربعة الإنتاجية ديال الـ API، نقل TLS، الحفظ والقراءة من الـ fixture، أخطاء الـ API، الإلغاء، واختيار مصدر Notion |
| اختبارات E2E المباشرة للمزوّدين | تشغيل يدوي على Mac مستضاف على GitHub بأسرار مخصصة | التسجيل الحقيقي والقراءة من Todoist و Notion و Microsoft و Google؛ كيفشل إلى كانو الحسابات ناقصين |
| تكاملات سطح المكتب المرخّصة | حساب محلي مخصص | تشغيل وحفظ Things 3 و OmniFocus 4 وواجهة Alfred |
| اختبارات E2E الأصلية لسطح المكتب | `macos-15-intel` مستضاف على GitHub | نوافذ Automator حقيقية؛ بيانات Reminders و Calendar المحفوظة؛ المراجعة الأسبوعية؛ عدّادات القائمة؛ مكتبة GTDLib المترجمة؛ إجراءات Alfred الأصلية المغلّفة؛ انتهاء وإلغاء مؤقّتات launchd الحقيقية |
| واجهة Alfred الاختيارية | حساب محلي مخصص، Alfred 5 + Powerpack | استيراد الـ workflow، تشغيل الكلمات المفتاحية، وقراءة التذكيرات عبر الواجهة المرخّصة |

[تشغيل تحديث الـ API المتحقّق منو](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) داز بنجاح فـ **35 اختبار تحقق على كل منصة و 26 اختبار E2E لسطح المكتب**، بلا حتى فشل ولا خطأ ولا تخطي. تغطية سطح المكتب فيها 15 اختبار أصلي و 11 اختبار لمكيّفات المزوّدين، بما فيها فحص انتهاء مهلة الاتصال الحقيقي وفحوصات Keychain المؤقتة. التحقق كيدير حتى فحص بنية المستودع. هاد النتائج كتغطي السلوك الأصلي والـ fixtures ديال المزوّدين؛ ما كتثبتش التوافق المباشر مع المزوّدين ولا مع التطبيقات المرخّصة. الحالة الحالية باينة فـ الشارات الفوق.

طلبات السحب (pull requests) وعمليات الدفع (pushes) لـ `main` كتشغّل التحقق ومن بعدو اختبارات E2E الأصلية. الـ workflow ديال E2E كيخدم حتى كل ليلة ولا بتشغيل يدوي، وكيشمل اختبارات حتمية لمكيّفات المزوّدين. الاختبارات المباشرة للمزوّدين كتستعمل الـ workflow اليدوي المنفصل `live-e2e.yml`. الـ CI الافتراضي كيستعمل أجهزة Mac مؤقتة مستضافة على GitHub، و fixtures معزولة، وعمليات فرعية محدودة؛ المجموعة الافتراضية ما كتحتاج لا runner مستضاف عندك لا بيانات حسابات خارجية. أما المجموعة المباشرة اليدوية فكتحتاج أسرار مخصصة للمزوّدين.

الإصدارات القديمة ديال macOS ما متحقّقش منها فـ الـ CI الحالي. التشغيلات المباشرة للمزوّدين كتحتاج أسرار مخصصة ومازال ما تتحقّقش منهم. Shortcuts/Siri وتطبيقات سطح المكتب المرخّصة خارجين على المجموعة المستضافة الافتراضية. اختبارات الإجراءات الأصلية كتجرّب سكربتات Alfred المغلّفة مباشرة؛ وما كتثبتش التوافق الكامل مع واجهة Alfred. شوف [إعداد الاختبارات والمتطلبات والتغطية](../../../tests/e2e/README.md).

## التوطين واللغات

النصوص لي كيشوفها المستخدم فـ سطر الأوامر (CLI)، مشغّل الاختبارات، وشريط القوائم كيجيو بـ 45 لغة ومحلية (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) تحت `locales/` عبر `scripts/i18n.py` بلا حتى اعتمادية خارجية. تحديد اللغة كيقلّب أولاً فـ `--lang`، ومن بعد فـ `LC_ALL` و `LC_MESSAGES` و `LANG`، وإلى ما لقاش كيرجع لـ `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## التطوير

ثبّت [mise](https://mise.jdx.dev/) واستعمل نسخة Python المثبّتة فـ `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

التحقق كيكتب التقارير تحت `test-results/`؛ وسكربتات البناء كتكتب فـ `dist/`. باش تشغّل مجموعة اختبارات سطح المكتب المستضافة على `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

تشغيل اختبارات E2E ديال سطح المكتب محلياً كيحتاج حساب اختبار مخصص يكون مسجّل الدخول والأذونات المشروحة فـ [دليل E2E](../../../tests/e2e/README.md). سكربت تهيئة الأذونات المستضاف مقتصر غير على المهام المؤقتة المستضافة على GitHub.

استعمل [Conventional Commits](https://www.conventionalcommits.org/) وتبع [CONTRIBUTING.md](../../../CONTRIBUTING.md). التغييرات الأخيرة مسجّلة فـ [CHANGELOG.md](../../../CHANGELOG.md).

ضوابط الأمان، التحقق من توقيع الإصدارات، والحدود لي مازال كاينة فـ Scorecard موثّقين فـ [تقييم الأمان](../../../docs/security-assessment.md). الـ workflow ديال الإصدار كيبني الحزم وكيوثّقها قبل ما يصايب مسوّدة إصدار، بما فيها إثبات مصدر موقّع بـ in-toto وحزم Sigstore متحقّق منها مقابل الـ commit والمرجع المصدري. إثبات المصدر الجديد كيتطبّق غير على البناءات ديال هاد الـ workflow، ماشي على التحميلات القديمة.

## تاريخ المشروع والرخصة

MacGTD كيجمع المستودعات السابقة MacGTD-Native و MacGTD-Microsoft و MacGTD-Google و AlfredGTD فـ مشروع واحد. ومرخّص تحت [رخصة MIT](../../../LICENSE).
