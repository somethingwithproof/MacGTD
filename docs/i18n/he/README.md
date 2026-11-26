# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · **עברית** · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD הוא אוסף של תהליכי עבודה ל-macOS ללכידת משימות, ארגון תזכורות והפעלת סשנים מתוזמנים של מיקוד באמצעות האפליקציות שכבר נמצאות בשימושכם.**

הכלי בנוי סביב שיטת [Getting Things Done](https://gettingthingsdone.com/), ומביא לכידה דרך תיבת דו-שיח, מלוח ההעתקה ובאצווה אל Apple Reminders; לכידת אירועים אל Calendar; ופקודות למשימות, הערות, פרויקטים ומיקוד אל Alfred. AppleScript ו-Automator שומרים את תהליכי העבודה המקוריים קרובים ל-macOS. מתאמי ה-API משתמשים ב-Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 ו-Google Keep v1. מתאמים עבור Things ו-OmniFocus כלולים גם הם. בדיקות מתארחות מאמתות את מתאמי ה-API מול תשתית דמה מקומית של HTTPS; תאימות חיה עדיין דורשת חשבונות ייעודיים אצל הספקים.

## מה ניתן לעשות

- **לכידה בלי להחליף אפליקציות.** השתמשו ב-Automator Service, במילת מפתח של Alfred או בלוח ההעתקה כדי להוסיף משימה. לכידה באצווה יוצרת תזכורת אחת עבור כל שורה שאינה ריקה.
- **הפיכת טקסט למשימות מובנות.** פענחו תאריכים יחסיים ותאריכי ISO, שעות, עדיפויות, הקשרים ופרויקטים באמצעות מנתח ה-AppleScript המבצעי המשותף ללכידה המהירה המקורית וללכידה ב-Calendar.
- **לכידת אירועים וסקירת תיבת הדואר הנכנס.** צרו אירועי Calendar עם שעה, משך ומיקום; הריצו סקירה שבועית בת חמישה שלבים עם ריקון רעיונות ישירות אל Reminders.
- **עבודה בסשנים מתוזמנים של מיקוד.** התחילו, בדקו ועצרו סשנים בין תהליכים. טיימרים של launchd שבבעלות הסשן מטפלים בפקיעה ובביטול; יומני JSONL מספקים ניתוח משכי זמן.
- **שימוש ב-Alfred מעבר למשימות בלבד.** צרו רשימות Reminders עבור פרויקטים, שמרו הערות סימוכין, פתחו את תיבת הדואר הנכנס לסקירה, לכדו טקסט מלוח ההעתקה וערכו העדפות מוגדרות-טיפוס.
- **צפייה בתיבת הדואר הנכנס משורת התפריטים.** התוסף האופציונלי עבור SwiftBar/xbar מציג ספירות של פריטים לא שלמים בתיבת הדואר הנכנס ומקשר לתהליכי עבודה של לכידה.

ההתנהגות המקורית נבדקת על מחשבי Mac אמיתיים המתארחים ב-GitHub: הבדיקות מפעילות תיבות דו-שיח של Automator, ולאחר מכן קוראות חזרה רשומות מ-Reminders ומ-Calendar. ראו [בדיקות ותאימות](#testing-and-compatibility) להיקף הראיות הללו.

## התחלה מהירה: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

פתחו את תהליך העבודה ב-Automator והריצו אותו כדי להתנסות בלכידה. כדי להפוך אותו לזמין בתור Service, התקינו את החבילה תחת `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

הקצו קיצור דרך תחת **System Settings → Keyboard → Keyboard Shortcuts → Services**. אפשרו גישת Automation אל Reminders כאשר macOS מבקשת זאת. הזינו:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

תהליך העבודה המקורי יוצר תזכורת בעדיפות גבוהה שמועד היעד שלה הוא מחר, מנתב אותה לרשימה `shopping`, ומתעד את ההקשר. ללא סמן של פרויקט או הקשר, הלכידה המהירה משתמשת ב-`Inbox`.

## תחביר הלכידה

מנתח המשימות המקורי ולכידת המשימות של Alfred מזהים את הסמנים הבאים. למתאמי הספקים יש תמיכה משלהם בשדות ובניתוב.

| קלט | משמעות | דוגמה |
| --- | --- | --- |
| `!1`, `!2`, `!3` | עדיפות גבוהה, בינונית או נמוכה | `Fix login !1` |
| `today`, `tomorrow`, `next week` | תאריך יעד יחסי | `Call dentist tomorrow` |
| יום בשבוע או `next weekday` | תאריך יעד לפי יום בשבוע | `Send report next monday` |
| `due:YYYY-MM-DD` | תאריך יעד מפורש | `Renew membership due:2027-03-15` |
| שעה לצד תאריך | שעת יעד | `Call Alex tomorrow at 3pm` |
| `@context` | סמן הקשר | `Buy milk @errands` |
| `+project` | ניתוב לפרויקט/רשימה | `Draft outline +website` |

`due:today` ו-`due:tomorrow` מתקבלים גם הם. השתמשו באותיות, ספרות, קווים תחתונים או מקפים בסמני הקשר ופרויקט. לכידה מהירה מקורית נותנת עדיפות לניתוב פרויקט על פני ניתוב הקשר.

לכידה ב-Calendar משתמשת ב-`@` עבור מיקום האירוע ומקבלת משך זמן בדקות או בשעות:

```text
Planning tomorrow 2pm 45m @Conference Room
```

ללא שעה או משך מפורשים, הלכידה ב-Calendar משתמשת בשעה 9:00 AM ובמשך של שעה אחת, בלוח השנה הראשון הניתן לכתיבה.

## בחירת תהליך עבודה

### תהליכי עבודה מקוריים של Apple

| תהליך עבודה | התנהגות | חבילה |
| --- | --- | --- |
| לכידה מהירה | פענוח טקסט משימה ויצירת תזכורת | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| לכידה מלוח ההעתקה | יצירת תזכורת מטקסט בלוח ההעתקה | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| לכידה באצווה | יצירת תזכורות ממספר שורות | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| לכידת אירוע | יצירת אירוע ב-Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| סקירה שבועית | סקירה מונחית וריקון תזכורות לתיבה | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

פתחו חבילה ב-Automator כדי לנסות אותה, או התקינו אותה תחת `~/Library/Services` לגישה באמצעות מקלדת. Reminders ו-Calendar דורשים את הרשאות ה-Automation המתאימות של macOS.

### Alfred

דורש Alfred עם Powerpack. בנו את החבילה מקוד המקור הנוכחי:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

ניתן גם להוריד את החבילה מתוך [גרסאות (releases)](https://github.com/somethingwithproof/MacGTD/releases). חבילות שחרור משקפות את קוד המקור המתויג שלהן; תכונות שנוספו אל `main` לאחר שחרור גרסה דורשות בנייה מקוד המקור.

| מילת מפתח | פעולה |
| --- | --- |
| `task` | לכידת משימה עם פענוח תאריך, הקשר, פרויקט ועדיפות |
| `note` | שמירת הערת סימוכין ב-Reminders |
| `project` | יצירת רשימת Reminders |
| `gtd process` | פתיחת Inbox לסקירה אנושית |
| `clip` | לכידת טקסט מלוח ההעתקה |
| `gtd focus` | התחלת סשן מיקוד, בדיקת מצב או עצירה |
| `gtd analytics` | בדיקת משכי מיקוד מתועדים |
| `gtd preferences` | עריכת העדפות תהליך העבודה |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

ההעדפות נשמרות ב-`~/Library/Preferences/com.alfredgtd.plist`; מצב המיקוד והיומנים נשמרים תחת `~/.gtd`. להעדפות יש ערכי ברירת מחדל מובנים, בדיקות טיפוסים, ייבוא מאומת וכתיבות אטומיות. סשני מיקוד אינם משנים את הגדרות ההתראות של המערכת. עיבוד Inbox פותח את הרשימה לסקירה; הוא אינו מעביר או משלים משימות באופן אוטומטי.

ראו את [מדריך Alfred](../../../workflows/alfred/README.md) ואת [תיעוד ספריית GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### מתאמי לכידה חיצוניים

כל ארבעת תהליכי הלכידה מבוססי ה-API נבדקים באמצעות תיבות דו-שיח אמיתיות של Automator ותשתית TLS מקומית בסביבת E2E מתארחת. חבילת בדיקות ידנית נפרדת בודקת שמירה אמיתית אצל הספקים כאשר מוגדרים חשבונות ייעודיים. Things ו-OmniFocus דורשים את חבילת האינטגרציה השולחנית המורשית.

| יעד | מנגנון | הגדרה / מקור |
| --- | --- | --- |
| Todoist | לכידת API | [תהליך עבודה והגדרת Keychain](../../../workflows/todoist/) |
| Notion | לכידת Data source API | [תהליך עבודה והגדרת Keychain](../../../workflows/notion/) |
| Things 3 | סכימת URL | [תהליך עבודה](../../../workflows/things/) |
| OmniFocus | AppleScript / סכימת URL | [תהליך עבודה](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [תהליך עבודה](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [תהליך עבודה](../../../workflows/google/) |

מתאמי API דורשים הגדרת אישורים; Microsoft דורש הרשאת OAuth מואצלת ו-Google Keep דורש גישה מתאימה ל-Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

ראו [דרישות הגדרת API, העברה והרשאה](../../../workflows/api/README.md). מזהי מסד נתונים קיימים של Notion מועברים רק כאשר נמצא מקור נתונים אחד בדיוק. לכידה ב-Microsoft וב-Google משתמשת בממשקי API במקום בקיצורי דפדפן לא מתועדים. אסימוני גישה של OAuth דורשים חידוש דרך לקוח ה-OAuth שלכם. מטעני הבקשה משתמשים במפתחות JSON מפורשים, בקשות HTTPS תחומות ובאימות תגובה. הודעות שגיאה שומרות על פרטי הכשל תוך הסתרת אסימון ה-API המוגדר. ראו [SECURITY.md](../../../SECURITY.md) לדיווח על בעיות אבטחה.

### שורת תפריטים ו-Shortcuts

[מדריך שורת התפריטים](../../../workflows/menubar/README.md) מכסה את התוסף האופציונלי של SwiftBar/xbar. התקינו תחילה את Apple Services, ולאחר מכן הגדירו את תיקיית התוספים באפליקציית שורת התפריטים וקשרו את `workflows/menubar/gtd-menubar.sh` לתוכה.

[מדריך Shortcuts](../../../workflows/shortcuts/README.md) מספק הגדרה ידנית ללכידת טקסט, לוח העתקה ו-Siri ב-macOS 12 ומעלה. Shortcuts והפעלה קולית של Siri אינם נכללים בחבילת הבדיקות המתארחת.

## ארכיטקטורה

חבילות Automator מטמיעות AppleScript כך שיוכלו לרוץ בתור Services מקוריים. Alfred אורז את סקריפטי הפעולה ומעביר קלט משתמש כארגומנטים. GTDLib חושפת פעולות Reminders מקוריות משותפות מתוך קוד מקור AppleScript הניתן לעריכה וחבילת סקריפט מקומפלת.

- **מנתח מבצעי יחיד:** `scripts/sync-native-parser.py` מטמיע את המנתח המשותף ב-Quick Capture וב-Event Capture; אימות מזהה סטייה מקוד המקור.
- **מצב מיקוד מתמיד:** הפעלות נפרדות משתפות מצב סשן, עם משימות launchd בבעלות הסשן וחשבונאות זמן חולף תחומה.
- **חבילות ניתנות לשחזור:** האריזה בונה ארכיון חדש, ובדיקות משוות את תוכנו לקוד המקור. לספרייה יש סקריפט קומפילציה נפרד.
- **בדיקות נצפות:** דוחות JUnit, יומני פקודות ותוצרי בנייה שנבדקו נשמרים למשך 14 ימים ב-GitHub Actions.

| תיקייה | אחריות |
| --- | --- |
| [`workflows/`](../../../workflows/) | חבילות מקוריות, מתאמי ספקים, Alfred, Shortcuts וסקריפטי שורת תפריטים |
| [`scripts/`](../../../scripts/) | אריזה, קומפילציית ספרייה, סנכרון מנתח והקצאת בדיקות מתארחות |
| [`tests/`](../../../tests/) | אימות, בדיקות רכיבים ו-E2E שולחני מקורי |
| [`.github/workflows/`](../../../.github/workflows/) | CI, בדיקות E2E ליליות/ידניות ותחזוקת מאגר |
| [`infra/`](../../../infra/) | הגדרת רץ מקומי או EC2 Mac אופציונלית; CI מתארח אינו דורש זאת |

<a name="testing-and-compatibility"></a>

## בדיקות ותאימות

| היקף | סביבה | מה נבדק |
| --- | --- | --- |
| אימות | macOS 15 ו-26 מתארחים ב-GitHub | קומפילציית AppleScript, חבילות, מנתח מבצעי, יעדי פעולה, העדפות, מצב מיקוד, תעבורת API מול תשתית דמה ובדיקות סבב מלא של אריזה |
| בדיקות אבטחה | Ubuntu ו-macOS 15 מתארחים ב-GitHub | CodeQL ל-Python, ShellCheck ו-fuzzing תחום עם Atheris של המנתח המבצעי המקומפל |
| E2E למתאמי ספקים | `macos-15-intel` מתארח ב-GitHub | כל ארבע תיבות הדו-שיח המבצעיות של API, תעבורת TLS, שמירה/קריאה חוזרת בתשתית הדמה, כשלי API, ביטול ובחירת מקור Notion |
| E2E חי מול ספקים | הרצת Mac ידנית מתארחת ב-GitHub עם סודות ייעודיים | לכידה אמיתית וקריאה חוזרת מהספק עבור Todoist, Notion, Microsoft ו-Google; נכשל אם חסרים חשבונות |
| אינטגרציות שולחניות מורשות | חשבון מקומי ייעודי | הפעלה ושמירה בממשק המשתמש של Things 3, OmniFocus 4 ו-Alfred |
| E2E שולחני מקורי | `macos-15-intel` מתארח ב-GitHub | תיבות דו-שיח אמיתיות של Automator; נתוני Reminders ו-Calendar שמורים; סקירה שבועית; ספירות תפריט; GTDLib מקומפלת; פעולות מקוריות ארוזות של Alfred; פקיעה וביטול אמיתיים של טיימר launchd |
| ממשק Alfred אופציונלי | חשבון מקומי ייעודי, Alfred 5 + Powerpack | ייבוא תהליך עבודה, הפעלת מילת מפתח וקריאה חוזרת של תזכורות דרך ממשק המשתמש המורשה |

[הרצת המודרניזציה של ה-API המאומתת](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) עברה **35 בדיקות אימות בכל פלטפורמת אימות ו-26 בדיקות E2E שולחניות**, ללא כשלים, שגיאות או דילוגים. הכיסוי השולחני כולל 15 בדיקות מקוריות ו-11 בדיקות של מתאמי ספקים, כולל בדיקות timeout אמיתיות של תעבורה ובדיקות Keychain זמניות. האימות מריץ גם בדיקות מבנה מאגר. תוצאות אלו מכסות התנהגות מקורית ותשתיות דמה של ספקים; הן אינן מוכיחות תאימות חיה מול ספקים או אפליקציות מורשות. המצב הנוכחי מוצג בתגים למעלה.

בקשות משיכה ודחיפות אל `main` מריצות אימות ולאחריו E2E מקורי. תהליך ה-E2E רץ גם מדי לילה ובהפעלה ידנית, כולל בדיקות דטרמיניסטיות של מתאמי ספקים. בדיקות חיות מול ספקים משתמשות בתהליך הידני הנפרד `live-e2e.yml`. ה-CI כברירת מחדל משתמש במחשבי Mac זמניים המתארחים ב-GitHub, תשתיות דמה מבודדות ותתי-תהליכים תחומים; אין צורך ברץ באירוח עצמי או באישורי חשבון חיצוניים עבור חבילת ברירת המחדל. החבילה החיה הידנית דורשת סודות ספק ייעודיים.

גרסאות macOS מוקדמות יותר אינן מאומתות על ידי ה-CI הנוכחי. הרצות חיות מול ספקים דורשות סודות ייעודיים וטרם אומתו. Shortcuts/Siri ואפליקציות שולחניות מורשות נמצאים מחוץ לחבילת הבדיקות המתארחת כברירת מחדל. בדיקות פעולה מקוריות מפעילות סקריפטים ארוזים של Alfred ישירות; הן אינן מוכיחות תאימות מלאה של ממשק המשתמש של Alfred. ראו [הגדרת בדיקות, דרישות מוקדמות וכיסוי](../../../tests/e2e/README.md).

## לוקליזציה

מחרוזות CLI המופנות למשתמש, מריץ הבדיקות ושורת התפריטים מופצות ב-45 שפות/לוקאלים (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) תחת `locales/` באמצעות `scripts/i18n.py` עם אפס תלויות צד שלישי. זיהוי הלוקאל בודק את `--lang`, ולאחר מכן את `LC_ALL`, `LC_MESSAGES` ו-`LANG`, עם נסיגה ל-`en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## פיתוח

התקינו את [mise](https://mise.jdx.dev/) והשתמשו בגרסת ה-Python המוצמדת ב-`.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

האימות כותב דוחות תחת `test-results/`; סקריפטי הבנייה כותבים אל `dist/`. כדי להריץ את החבילה השולחנית המתארחת על `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

בדיקות E2E שולחניות מקומיות דורשות חשבון בדיקה ייעודי מחובר ואת ההרשאות המתוארות ב-[מדריך E2E](../../../tests/e2e/README.md). סקריפט הקצאת ההרשאות המתארח מוגבל למשימות זמניות המתארחות ב-GitHub.

השתמשו ב-[Conventional Commits](https://www.conventionalcommits.org/) ועקבו אחר [CONTRIBUTING.md](../../../CONTRIBUTING.md). שינויים אחרונים מתועדים ב-[CHANGELOG.md](../../../CHANGELOG.md).

בקרות אבטחה, אימות חתימת שחרור ומגבלות Scorecard נותרות מתועדות ב-[הערכת האבטחה](../../../docs/security-assessment.md).
תהליך השחרור בונה ומאשר חבילות לפני יצירת טיוטת שחרור,
כולל הצהרת מקור חתומה של in-toto וחבילות Sigstore המאומתות מול
הקומיט וה-ref של המקור. הצהרת המקור החדשה חלה על בניות תהליך עבודה אלו, ולא
על הורדות ישנות יותר.

## היסטוריית הפרויקט ורישיון

MacGTD מאחד את המאגרים לשעבר MacGTD-Native, MacGTD-Microsoft, MacGTD-Google ו-AlfredGTD. הוא מורשה תחת [רישיון MIT](../../../LICENSE).
