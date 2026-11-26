# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · **አማርኛ** · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD ቀድመው በሚጠቀሙባቸው መተግበሪያዎች ተግባራትን ለመመዝገብ፣ አስታዋሾችን ለማደራጀት እና በጊዜ የተገደቡ የትኩረት ክፍለ ጊዜዎችን ለማስኬድ የሚያገለግሉ የmacOS የስራ ፍሰቶች ስብስብ ነው።**

በ[Getting Things Done](https://gettingthingsdone.com/) ላይ የተገነባው ይህ ስብስብ የመገናኛ ሳጥን፣ የቅንጥብ ሰሌዳ እና የጅምላ ምዝገባን ወደ Apple Reminders፤ የክስተት ምዝገባን ወደ Calendar፤ እንዲሁም የተግባር፣ የማስታወሻ፣ የፕሮጀክት እና የትኩረት ትዕዛዞችን ወደ Alfred ያመጣል። AppleScript እና Automator ነባሪ የስራ ፍሰቶችን ከmacOS ጋር በቅርበት እንዲሰሩ ያደርጋሉ። የAPI አስማሚዎች Todoist API v1፣ Notion API 2026-03-11፣ Microsoft Graph v1.0 እና Google Keep v1 ይጠቀማሉ። የThings እና የOmniFocus አስማሚዎችም ተካትተዋል። የተስተናገዱ ሙከራዎች የAPI አስማሚዎችን ከአካባቢያዊ የHTTPS መሞከሪያ ጋር በማነጻጸር ያረጋግጣሉ፤ ቀጥተኛ ተኳኋኝነት ግን አሁንም የተለዩ የአገልግሎት አቅራቢ መለያዎችን ይፈልጋል።

## ምን ማድረግ ይችላሉ

- **መተግበሪያዎችን ሳይቀያይሩ ይመዝግቡ።** ተግባር ለማከል የAutomator አገልግሎትን፣ የAlfred ቁልፍ ቃልን ወይም ቅንጥብ ሰሌዳውን ይጠቀሙ። የጅምላ ምዝገባ ለእያንዳንዱ ባዶ ላልሆነ መስመር አንድ አስታዋሽ ይፈጥራል።
- **ጽሑፍን ወደ የተዋቀሩ ተግባራት ይቀይሩ።** በነባሪ ፈጣን ምዝገባ እና በCalendar ምዝገባ በጋራ የሚጠቀሙበትን የምርት AppleScript ተንታኝ በመጠቀም አንጻራዊ እና የISO ቀኖችን፣ ሰዓቶችን፣ ቅድሚያዎችን፣ አውዶችን እና ፕሮጀክቶችን ይተንትኑ።
- **ክስተቶችን ይመዝግቡ እና የገቢ ሳጥንዎን ይገምግሙ።** ሰዓት፣ ቆይታ እና ቦታ ያላቸው የCalendar ክስተቶችን ይፍጠሩ፤ ሀሳቦችን በሙሉ ወደ Reminders የሚያስገባ ባለ አምስት ደረጃ ሳምንታዊ ግምገማ ያስኪዱ።
- **በጊዜ በተገደቡ የትኩረት ክፍለ ጊዜዎች ይስሩ።** ክፍለ ጊዜዎችን በተለያዩ ሂደቶች መካከል ይጀምሩ፣ ይመርምሩ እና ያቁሙ። በክፍለ ጊዜው የሚተዳደሩ የlaunchd ሰዓት ቆጣሪዎች ጊዜ ማብቃትን እና መሰረዝን ያስተናግዳሉ፤ የJSONL መዝገቦች የቆይታ ትንታኔ ይሰጣሉ።
- **Alfredን ከተግባራት ባለፈ ይጠቀሙ።** ለፕሮጀክቶች የReminders ዝርዝሮችን ይፍጠሩ፣ የማጣቀሻ ማስታወሻዎችን ያስቀምጡ፣ የገቢ ሳጥኑን ለግምገማ ይክፈቱ፣ የቅንጥብ ሰሌዳ ጽሑፍን ይመዝግቡ እና የተረጋገጠ አይነት ያላቸውን ምርጫዎች ያርትዑ።
- **የገቢ ሳጥንዎን ከምናሌ አሞሌው ይመልከቱ።** አማራጭ የሆነው የSwiftBar/xbar ተሰኪ ያልተጠናቀቁ የገቢ ሳጥን ቆጠራዎችን ያሳያል እንዲሁም ወደ መመዝገቢያ የስራ ፍሰቶች ያገናኛል።

ነባሪ ባህሪው በእውነተኛ በGitHub በሚስተናገዱ Mac ኮምፒውተሮች ላይ ይፈተሻል: ሙከራዎች የAutomator መገናኛ ሳጥኖችን ያስኬዳሉ፣ ከዚያም የReminders እና የCalendar መዝገቦችን መልሰው ያነባሉ። የዚህን ማስረጃ ወሰን ለማየት [ሙከራ እና ተኳኋኝነት](#testing-and-compatibility) ይመልከቱ።

## ፈጣን ጅምር: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

ምዝገባን ለመሞከር የስራ ፍሰቱን በAutomator ውስጥ ይክፈቱ እና ያስኪዱት። እንደ አገልግሎት እንዲገኝ ለማድረግ ጥቅሉን በ`~/Library/Services` ስር ይጫኑት:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

በ**System Settings → Keyboard → Keyboard Shortcuts → Services** ውስጥ አቋራጭ ይመድቡ። macOS ሲጠይቅ ለReminders የAutomation መዳረሻ ይፍቀዱ። የሚከተለውን ያስገቡ:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

ነባሪው የስራ ፍሰት ነገ የሚጠናቀቅ ከፍተኛ ቅድሚያ ያለው አስታዋሽ ይፈጥራል፣ ወደ `shopping` ዝርዝር ይመራዋል፣ እና አውዱን ይመዘግባል። የፕሮጀክት ወይም የአውድ ምልክት ከሌለ ፈጣን ምዝገባ `Inbox`ን ይጠቀማል።

## የምዝገባ አገባብ

ነባሪው የተግባር ተንታኝ እና የAlfred ተግባር ምዝገባ እነዚህን ምልክቶች ይለያሉ። የአገልግሎት አቅራቢ አስማሚዎች የራሳቸው የመስክ እና የመምሪያ ድጋፍ አላቸው።

| ግብዓት | ትርጉም | ምሳሌ |
| --- | --- | --- |
| `!1`፣ `!2`፣ `!3` | ከፍተኛ፣ መካከለኛ ወይም ዝቅተኛ ቅድሚያ | `Fix login !1` |
| `today`፣ `tomorrow`፣ `next week` | አንጻራዊ የመጨረሻ ቀን | `Call dentist tomorrow` |
| የሳምንቱ ቀን ወይም `next weekday` | የሳምንቱ ቀን የመጨረሻ ቀን | `Send report next monday` |
| `due:YYYY-MM-DD` | ግልጽ የመጨረሻ ቀን | `Renew membership due:2027-03-15` |
| ከቀን ጎን ያለ ሰዓት | የመጨረሻ ሰዓት | `Call Alex tomorrow at 3pm` |
| `@context` | የአውድ ምልክት | `Buy milk @errands` |
| `+project` | የፕሮጀክት/ዝርዝር መምሪያ | `Draft outline +website` |

`due:today` እና `due:tomorrow` እንዲሁ ተቀባይነት አላቸው። በአውድ እና በፕሮጀክት ምልክቶች ውስጥ ፊደላትን፣ ቁጥሮችን፣ የስር መስመሮችን ወይም ሰረዞችን ይጠቀሙ። ነባሪው ፈጣን ምዝገባ ከአውድ መምሪያ ይልቅ ለፕሮጀክት መምሪያ ቅድሚያ ይሰጣል።

የCalendar ምዝገባ ለክስተቱ ቦታ `@` ይጠቀማል እንዲሁም ቆይታን በደቂቃዎች ወይም በሰዓታት ይቀበላል:

```text
Planning tomorrow 2pm 45m @Conference Room
```

ግልጽ የሆነ ሰዓት ወይም ቆይታ ካልተሰጠ የCalendar ምዝገባ መጻፍ በሚቻልበት የመጀመሪያው የቀን መቁጠሪያ ውስጥ 9:00 AM እና አንድ ሰዓትን ይጠቀማል።

## የስራ ፍሰት ይምረጡ

### ነባሪ የApple የስራ ፍሰቶች

| የስራ ፍሰት | ባህሪ | ጥቅል |
| --- | --- | --- |
| ፈጣን ምዝገባ | የተግባር ጽሑፍን ተንትኖ አስታዋሽ መፍጠር | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| የቅንጥብ ሰሌዳ ምዝገባ | ከቅንጥብ ሰሌዳ ጽሑፍ አስታዋሽ መፍጠር | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| የጅምላ ምዝገባ | ከብዙ መስመሮች አስታዋሾችን መፍጠር | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| የክስተት ምዝገባ | የCalendar ክስተት መፍጠር | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| ሳምንታዊ ግምገማ | የሚመራ ግምገማ እና የአስታዋሽ ሀሳብ ማሰባሰብ | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

ጥቅሉን ለመሞከር በAutomator ውስጥ ይክፈቱት ወይም በቁልፍ ሰሌዳ ለመጠቀም በ`~/Library/Services` ስር ይጫኑት። Reminders እና Calendar ተገቢውን የmacOS Automation ፈቃዶች ያስፈልጋቸዋል።

### Alfred

Powerpack ያለው Alfred ያስፈልገዋል። ጥቅሉን ከአሁኑ ምንጭ ኮድ ይገንቡ:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

ጥቅሉን ከ[ልቀቶች](https://github.com/somethingwithproof/MacGTD/releases) ማውረድም ይችላሉ። የልቀት ጥቅሎች መለያ የተሰጠውን ምንጭ ኮዳቸውን ያንጸባርቃሉ፤ ከልቀት በኋላ ወደ `main` የተጨመሩ ባህሪያት ከምንጭ ኮድ መገንባትን ይጠይቃሉ።

| ቁልፍ ቃል | እርምጃ |
| --- | --- |
| `task` | ቀንን፣ አውድን፣ ፕሮጀክትን እና ቅድሚያን በመተንተን ተግባር መመዝገብ |
| `note` | በReminders ውስጥ የማጣቀሻ ማስታወሻ ማስቀመጥ |
| `project` | የReminders ዝርዝር መፍጠር |
| `gtd process` | ለሰው ግምገማ Inboxን መክፈት |
| `clip` | የቅንጥብ ሰሌዳ ጽሑፍን መመዝገብ |
| `gtd focus` | የትኩረት ክፍለ ጊዜ መጀመር፣ ሁኔታን መመርመር ወይም ማቆም |
| `gtd analytics` | የተመዘገቡ የትኩረት ቆይታዎችን መመርመር |
| `gtd preferences` | የስራ ፍሰት ምርጫዎችን ማርትዕ |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

ምርጫዎች በ`~/Library/Preferences/com.alfredgtd.plist` ውስጥ ይቀመጣሉ፤ የትኩረት ሁኔታ እና መዝገቦች በ`~/.gtd` ስር ይገኛሉ። ምርጫዎች አብረው የሚመጡ ነባሪ እሴቶች፣ የአይነት ፍተሻዎች፣ የተረጋገጡ ማስገቢያዎች እና አቶሚክ ጽሑፎች አሏቸው። የትኩረት ክፍለ ጊዜዎች የስርዓቱን የማሳወቂያ ቅንብሮች አይቀይሩም። የገቢ ሳጥን ማቀነባበር ዝርዝሩን ለግምገማ ይከፍታል፤ ተግባራትን በራስ-ሰር አያንቀሳቅስም ወይም አያጠናቅቅም።

[የAlfred መመሪያን](../../../workflows/alfred/README.md) እና [የGTDLib ቤተ-መጻሕፍት ሰነድን](../../../workflows/alfred/GTDLib.scptd/README.md) ይመልከቱ።

### የውጭ ምዝገባ አስማሚዎች

አራቱም የAPI ምዝገባ የስራ ፍሰቶች በተስተናገደ E2E ውስጥ በእውነተኛ የAutomator መገናኛ ሳጥኖች እና በአካባቢያዊ የTLS መሞከሪያ አማካኝነት ይፈተሻሉ። የተለዩ መለያዎች ሲዋቀሩ ሌላ በእጅ የሚስኬድ የሙከራ ስብስብ እውነተኛ የአገልግሎት አቅራቢ መረጃ ማስቀመጥን ይፈትሻል። Things እና OmniFocus ፈቃድ ያለው የዴስክቶፕ ውህደት ሙከራ ስብስብን ይፈልጋሉ።

| ዒላማ | ዘዴ | ማዋቀር / ምንጭ |
| --- | --- | --- |
| Todoist | የAPI ምዝገባ | [የስራ ፍሰት እና የKeychain ማዋቀር](../../../workflows/todoist/) |
| Notion | የውሂብ ምንጭ API ምዝገባ | [የስራ ፍሰት እና የKeychain ማዋቀር](../../../workflows/notion/) |
| Things 3 | የURL ዘዴ | [የስራ ፍሰት](../../../workflows/things/) |
| OmniFocus | AppleScript / የURL ዘዴ | [የስራ ፍሰት](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [የስራ ፍሰት](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [የስራ ፍሰት](../../../workflows/google/) |

የAPI አስማሚዎች የማረጋገጫ ዝርዝር ማዋቀርን ይጠይቃሉ፤ Microsoft የተወከለ የOAuth ፈቃድ እና Google Keep ብቁ የሆነ የWorkspace መዳረሻ ያስፈልጋቸዋል:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[የAPI ማዋቀር፣ ሽግግር እና የፈቃድ መስፈርቶችን](../../../workflows/api/README.md) ይመልከቱ። ነባር የNotion የውሂብ ጎታ መለያዎች የሚሸጋገሩት በትክክል አንድ የውሂብ ምንጭ ብቻ ሲገኝ ነው። የMicrosoft እና የGoogle ምዝገባዎች ሰነድ ከሌላቸው የአሳሽ አቋራጮች ይልቅ APIዎችን ይጠቀማሉ። የOAuth መዳረሻ ቶከኖች በእርስዎ የOAuth ደንበኛ በኩል መታደስ አለባቸው። የሚላኩ መረጃዎች ግልጽ የJSON ቁልፎችን፣ በጊዜ የተገደቡ የHTTPS ጥያቄዎችን እና የምላሽ ማረጋገጫን ይጠቀማሉ። የስህተት መልዕክቶች የተዋቀረውን የAPI ቶከን እየደበቁ የውድቀት ዝርዝሮችን ይይዛሉ። የደህንነት ችግሮችን ሪፖርት ለማድረግ [SECURITY.md](../../../SECURITY.md)ን ይመልከቱ።

### የምናሌ አሞሌ እና Shortcuts

[የምናሌ አሞሌ መመሪያው](../../../workflows/menubar/README.md) አማራጭ የሆነውን የSwiftBar/xbar ተሰኪ ይሸፍናል። መጀመሪያ የApple አገልግሎቶችን ይጫኑ፣ ከዚያም በምናሌ አሞሌ መተግበሪያዎ ውስጥ የተሰኪውን ማውጫ ያዋቅሩ እና `workflows/menubar/gtd-menubar.sh`ን ወደ እሱ ያገናኙ።

[የShortcuts መመሪያው](../../../workflows/shortcuts/README.md) በmacOS 12+ ላይ ለጽሑፍ፣ ለቅንጥብ ሰሌዳ እና ለSiri ምዝገባ በእጅ የሚደረግ ማዋቀርን ያቀርባል። Shortcuts እና የSiri የድምጽ ማንቂያ ከተስተናገደው የሙከራ ስብስብ ውጭ ናቸው።

## አርክቴክቸር

የAutomator ጥቅሎች እንደ ነባሪ አገልግሎቶች እንዲሰሩ AppleScriptን በውስጣቸው ያካትታሉ። Alfred የድርጊት ስክሪፕቶችን ያሽጋል እንዲሁም የተጠቃሚ ግብዓትን እንደ መለኪያዎች ያስተላልፋል። GTDLib ሊታረም ከሚችል የAppleScript ምንጭ ኮድ እና ከተጠናቀረ የስክሪፕት ጥቅል የጋራ ነባሪ የReminders ክወናዎችን ያቀርባል።

- **አንድ የምርት ተንታኝ:** `scripts/sync-native-parser.py` የጋራ ተንታኙን በፈጣን ምዝገባ እና በክስተት ምዝገባ ውስጥ ያካትታል፤ ማረጋገጫው የምንጭ ኮድ መዛባትን ይለያል።
- **ዘላቂ የትኩረት ሁኔታ:** የተለያዩ ጥሪዎች የክፍለ ጊዜ ሁኔታን ይጋራሉ፣ በባለቤትነት የተያዙ የlaunchd ስራዎችን እና የተገደበ ያለፈ ጊዜ ስሌትን በመጠቀም።
- **ሊደገሙ የሚችሉ ጥቅሎች:** ማሸግ አዲስ ማህደር ይገነባል፣ ሙከራዎችም ይዘቱን ከምንጭ ኮዱ ጋር ያነጻጽራሉ። ቤተ-መጻሕፍቱ የተለየ የማጠናቀሪያ ስክሪፕት አለው።
- **ሊታዩ የሚችሉ ሙከራዎች:** የJUnit ሪፖርቶች፣ የትዕዛዝ መዝገቦች እና የተፈተሹ የግንባታ ውጤቶች በGitHub Actions ውስጥ ለ14 ቀናት ይቀመጣሉ።

| ማውጫ | ኃላፊነት |
| --- | --- |
| [`workflows/`](../../../workflows/) | ነባሪ ጥቅሎች፣ የአገልግሎት አቅራቢ አስማሚዎች፣ Alfred፣ Shortcuts እና የምናሌ አሞሌ ስክሪፕቶች |
| [`scripts/`](../../../scripts/) | ማሸግ፣ የቤተ-መጻሕፍት ማጠናቀር፣ የተንታኝ ማመሳሰል እና የተስተናገደ ሙከራ ዝግጅት |
| [`tests/`](../../../tests/) | ማረጋገጫ፣ የክፍል ፍተሻዎች እና ነባሪ የዴስክቶፕ E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI፣ የሌሊት/በእጅ የሚስኬድ E2E እና የማከማቻ ጥገና |
| [`infra/`](../../../infra/) | አማራጭ አካባቢያዊ እና የEC2 Mac አስፈጻሚ ማዋቀር፤ የተስተናገደ CI ይህን አይፈልግም |

## ሙከራ እና ተኳኋኝነት

| ወሰን | አካባቢ | ምን እንደሚፈተሽ |
| --- | --- | --- |
| ማረጋገጫ | በGitHub የሚስተናገዱ macOS 15 እና 26 | የAppleScript ማጠናቀር፣ ጥቅሎች፣ የምርት ተንታኝ፣ የድርጊት ዒላማዎች፣ ምርጫዎች፣ የትኩረት ሁኔታ፣ የመሞከሪያ API ማስተላለፊያ እና የጥቅል ሙሉ ዙር ፍተሻዎች |
| የደህንነት ፍተሻዎች | በGitHub የሚስተናገዱ Ubuntu እና macOS 15 | የPython CodeQL፣ ShellCheck እና በተጠናቀረው የምርት ተንታኝ ላይ የሚደረግ የተገደበ የAtheris ፋዚንግ ሙከራ |
| የአገልግሎት አቅራቢ አስማሚ E2E | በGitHub የሚስተናገድ `macos-15-intel` | አራቱም የምርት API መገናኛ ሳጥኖች፣ የTLS ማስተላለፊያ፣ የመሞከሪያ መረጃ ማስቀመጥ እና መልሶ ማንበብ፣ የAPI ውድቀቶች፣ መሰረዝ እና የNotion ምንጭ ምርጫ |
| ቀጥተኛ የአገልግሎት አቅራቢ E2E | የተለዩ ምስጢራዊ ቁልፎች ያሉት በእጅ የሚስኬድ በGitHub የሚስተናገድ የMac ሂደት | እውነተኛ የTodoist፣ Notion፣ Microsoft እና Google ምዝገባ እና ከአገልግሎት አቅራቢ መልሶ ማንበብ፤ መለያዎች ከሌሉ ይወድቃል |
| ፈቃድ ያላቸው የዴስክቶፕ ውህደቶች | የተለየ አካባቢያዊ መለያ | የThings 3፣ OmniFocus 4 እና Alfred የተጠቃሚ በይነገጽ ጥሪ እና መረጃ ማስቀመጥ |
| ነባሪ የዴስክቶፕ E2E | በGitHub የሚስተናገድ `macos-15-intel` | እውነተኛ የAutomator መገናኛ ሳጥኖች፤ የተቀመጡ የReminders እና የCalendar ውሂቦች፤ ሳምንታዊ ግምገማ፤ የምናሌ ቆጠራዎች፤ የተጠናቀረ GTDLib፤ የታሸጉ የAlfred ነባሪ ድርጊቶች፤ እውነተኛ የlaunchd ሰዓት ቆጣሪ ጊዜ ማብቃት እና መሰረዝ |
| አማራጭ የAlfred UI | የተለየ አካባቢያዊ መለያ፣ Alfred 5 + Powerpack | ፈቃድ ባለው የተጠቃሚ በይነገጽ በኩል የስራ ፍሰት ማስገባት፣ የቁልፍ ቃል ጥሪ እና አስታዋሽን መልሶ ማንበብ |

[የተረጋገጠው የAPI ማዘመኛ ሂደት](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ምንም ውድቀት፣ ስህተት ወይም የተዘለለ ሙከራ ሳይኖር **በእያንዳንዱ የማረጋገጫ መድረክ ላይ 35 የማረጋገጫ ሙከራዎችን እና 26 የዴስክቶፕ E2E ሙከራዎችን** አልፏል። የዴስክቶፕ ሽፋኑ 15 ነባሪ ሙከራዎችን እና 11 የአገልግሎት አቅራቢ አስማሚ ሙከራዎችን ያካትታል፣ እውነተኛ የማስተላለፊያ ጊዜ ማብቂያ እና ጊዜያዊ የKeychain ፍተሻዎችን ጨምሮ። ማረጋገጫው የማከማቻ መዋቅር ፍተሻዎችንም ያስኪዳል። እነዚህ ውጤቶች ነባሪ ባህሪን እና የአገልግሎት አቅራቢ መሞከሪያዎችን ይሸፍናሉ፤ ቀጥተኛ የአገልግሎት አቅራቢ ወይም ፈቃድ ያላቸው መተግበሪያዎች ተኳኋኝነትን አያረጋግጡም። የአሁኑ ሁኔታ ከላይ ባሉት ባጆች ይታያል።

Pull Requestዎች እና ወደ `main` የሚደረጉ ግፊቶች ማረጋገጫን እና ከዚያም ነባሪ E2Eን ያስኪዳሉ። የE2E የስራ ፍሰቱ ውሳኔያዊ የአገልግሎት አቅራቢ አስማሚ ሙከራዎችን ጨምሮ በየሌሊቱ እና በእጅ ሲታዘዝ ይሰራል። ቀጥተኛ የአገልግሎት አቅራቢ ሙከራዎች የተለየውን በእጅ የሚስኬድ `live-e2e.yml` የስራ ፍሰት ይጠቀማሉ። ነባሪው CI ጊዜያዊ በGitHub የሚስተናገዱ የMac ኮምፒውተሮችን፣ የተገለሉ መሞከሪያዎችን እና የተገደቡ ንዑስ ሂደቶችን ይጠቀማል፤ ለነባሪው ስብስብ በራስ የሚስተናገድ አስፈጻሚ ወይም የውጭ መለያ ማረጋገጫዎች አያስፈልጉም። በእጅ የሚስኬደው ቀጥተኛ ስብስብ የተለዩ የአገልግሎት አቅራቢ ምስጢራዊ ቁልፎችን ይፈልጋል።

ቀደም ያሉ የmacOS ስሪቶች በአሁኑ CI አልተረጋገጡም። ቀጥተኛ የአገልግሎት አቅራቢ ሂደቶች የተለዩ ምስጢራዊ ቁልፎችን ይፈልጋሉ እና እስካሁን አልተረጋገጡም። Shortcuts/Siri እና ፈቃድ ያላቸው የዴስክቶፕ መተግበሪያዎች ከነባሪው የተስተናገደ ስብስብ ውጭ ናቸው። ነባሪ የድርጊት ሙከራዎች የታሸጉ የAlfred ስክሪፕቶችን በቀጥታ ይፈትሻሉ፤ ሙሉ የAlfred UI ተኳኋኝነትን አያረጋግጡም። [የሙከራ ማዋቀር፣ ቅድመ ሁኔታዎች እና ሽፋንን](../../../tests/e2e/README.md) ይመልከቱ።

## አካባቢያዊነት

ለተጠቃሚ የሚታዩ የCLI፣ የሙከራ አስፈጻሚ እና የምናሌ አሞሌ ጽሑፎች ያለምንም የሶስተኛ ወገን ጥገኝነት በ`scripts/i18n.py` አማካኝነት በ`locales/` ስር በ45 አካባቢዎች (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) ይቀርባሉ። የአካባቢ መለየት መጀመሪያ `--lang`ን፣ ከዚያም `LC_ALL`፣ `LC_MESSAGES` እና `LANG`ን ይፈትሻል፣ ካልተገኘ ወደ `en` ይመለሳል።

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## ልማት

[mise](https://mise.jdx.dev/)ን ይጫኑ እና በ`.mise.toml` ውስጥ የተወሰነውን የPython ስሪት ይጠቀሙ:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

ማረጋገጫ ሪፖርቶችን በ`test-results/` ስር ይጽፋል፤ የግንባታ ስክሪፕቶች ወደ `dist/` ይጽፋሉ። የተስተናገደውን የዴስክቶፕ ስብስብ በ`main` ላይ ለማስኬድ:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

አካባቢያዊ የዴስክቶፕ E2E የተለየ የገባ የሙከራ መለያ እና በ[E2E መመሪያው](../../../tests/e2e/README.md) ውስጥ የተገለጹትን ፈቃዶች ይፈልጋል። የተስተናገደው የፈቃድ ማዘጋጃ ስክሪፕት በጊዜያዊ በGitHub በሚስተናገዱ ስራዎች ብቻ የተገደበ ነው።

[Conventional Commits](https://www.conventionalcommits.org/)ን ይጠቀሙ እና [CONTRIBUTING.md](../../../CONTRIBUTING.md)ን ይከተሉ። የቅርብ ጊዜ ለውጦች በ[CHANGELOG.md](../../../CHANGELOG.md) ውስጥ ተመዝግበዋል።

የደህንነት መቆጣጠሪያዎች፣ የልቀት ፊርማ ማረጋገጫ እና የቀሩ የScorecard ገደቦች በ[ደህንነት ግምገማው](../../../docs/security-assessment.md) ውስጥ ተመዝግበዋል። የልቀት የስራ ፍሰቱ ረቂቅ ልቀት ከመፍጠሩ በፊት ጥቅሎችን ይገነባል እና ያረጋግጣል፣ ከምንጭ ኮሚት እና ref ጋር የተረጋገጡ የተፈረሙ የin-toto መነሻ ማረጋገጫዎችን እና የSigstore ጥቅሎችን ጨምሮ። አዲስ የመነሻ ማረጋገጫ የሚተገበረው በእነዚያ የስራ ፍሰት ግንባታዎች ላይ እንጂ በቀድሞ ውርዶች ላይ አይደለም።

## የፕሮጀክት ታሪክ እና ፈቃድ

MacGTD የቀድሞዎቹን MacGTD-Native፣ MacGTD-Microsoft፣ MacGTD-Google እና AlfredGTD ማከማቻዎችን በአንድ ላይ ያዋህዳል። በ[MIT License](../../../LICENSE) ስር ፈቃድ ተሰጥቶታል።
