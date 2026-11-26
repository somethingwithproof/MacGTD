# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · **తెలుగు** · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD అనేది మీరు ఇప్పటికే ఉపయోగిస్తున్న యాప్‌లతో టాస్క్‌లను క్యాప్చర్ చేయడానికి, రిమైండర్‌లను నిర్వహించడానికి మరియు సమయబద్ధమైన ఫోకస్ సెషన్‌లను అమలు చేయడానికి ఉద్దేశించిన macOS వర్క్‌ఫ్లోల సేకరణ.**

[Getting Things Done](https://gettingthingsdone.com/) ఆధారంగా రూపొందించబడిన ఇది Apple Reminders లోకి డైలాగ్, క్లిప్‌బోర్డ్ మరియు బ్యాచ్ క్యాప్చర్‌ను; Calendar లోకి ఈవెంట్ క్యాప్చర్‌ను; మరియు Alfred లోకి టాస్క్, నోట్, ప్రాజెక్ట్ మరియు ఫోకస్ కమాండ్‌లను అందిస్తుంది. AppleScript మరియు Automator ఈ నేటివ్ వర్క్‌ఫ్లోలను macOS కు దగ్గరగా ఉంచుతాయి. API అడాప్టర్‌లు Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, మరియు Google Keep v1 లను ఉపయోగిస్తాయి. Things మరియు OmniFocus అడాప్టర్‌లు కూడా ఇందులో ఉన్నాయి. హోస్ట్ చేసిన టెస్ట్‌లు API అడాప్టర్‌లను స్థానిక HTTPS ఫిక్చర్‌పై ధృవీకరిస్తాయి; లైవ్ అనుకూలతకు ఇప్పటికీ ప్రత్యేక ప్రొవైడర్ ఖాతాలు అవసరం.

## మీరు ఏమి చేయవచ్చు

- **యాప్‌లను మార్చకుండానే క్యాప్చర్ చేయండి.** టాస్క్‌ను జోడించడానికి Automator Service, Alfred కీవర్డ్ లేదా క్లిప్‌బోర్డ్‌ను ఉపయోగించండి. బ్యాచ్ క్యాప్చర్ ఖాళీ కాని ప్రతి లైన్‌కు ఒక రిమైండర్‌ను సృష్టిస్తుంది.
- **టెక్స్ట్‌ను నిర్మాణాత్మక టాస్క్‌లుగా మార్చండి.** నేటివ్ క్విక్ క్యాప్చర్ మరియు Calendar క్యాప్చర్ పంచుకునే ప్రొడక్షన్ AppleScript పార్సర్‌ను ఉపయోగించి సాపేక్ష మరియు ISO తేదీలు, సమయాలు, ప్రాధాన్యతలు, సందర్భాలు మరియు ప్రాజెక్ట్‌లను పార్స్ చేయండి.
- **ఈవెంట్‌లను క్యాప్చర్ చేయండి మరియు మీ ఇన్‌బాక్స్‌ను సమీక్షించండి.** సమయం, వ్యవధి మరియు ప్రదేశంతో Calendar ఈవెంట్‌లను సృష్టించండి; Reminders లోకి బ్రెయిన్ డంప్‌తో ఐదు దశల వారపు సమీక్షను నిర్వహించండి.
- **సమయబద్ధమైన ఫోకస్ సెషన్‌లలో పని చేయండి.** వివిధ ప్రాసెస్‌ల మధ్య సెషన్‌లను ప్రారంభించండి, పరిశీలించండి మరియు ఆపండి. సెషన్ యాజమాన్యంలోని launchd టైమర్‌లు గడువు మరియు రద్దును నిర్వహిస్తాయి; JSONL లాగ్‌లు వ్యవధి విశ్లేషణలను అందిస్తాయి.
- **టాస్క్‌ల కంటే ఎక్కువ పనుల కోసం Alfred ను ఉపయోగించండి.** ప్రాజెక్ట్‌ల కోసం Reminders జాబితాలను సృష్టించండి, రిఫరెన్స్ నోట్‌లను సేవ్ చేయండి, సమీక్ష కోసం ఇన్‌బాక్స్‌ను తెరవండి, క్లిప్‌బోర్డ్ టెక్స్ట్‌ను క్యాప్చర్ చేయండి మరియు టైప్డ్ ప్రాధాన్యతలను సవరించండి.
- **మెనూ బార్ నుండే మీ ఇన్‌బాక్స్‌ను చూడండి.** ఐచ్ఛిక SwiftBar/xbar ప్లగిన్ పూర్తికాని ఇన్‌బాక్స్ గణనలను చూపుతుంది మరియు క్యాప్చర్ వర్క్‌ఫ్లోలకు లింక్ చేస్తుంది.

నిజమైన GitHub హోస్ట్ చేసిన Mac లపై నేటివ్ ప్రవర్తన తనిఖీ చేయబడుతుంది: టెస్ట్‌లు Automator డైలాగ్‌లను నిర్వహించి, ఆపై Reminders మరియు Calendar రికార్డులను తిరిగి చదువుతాయి. ఆ సాక్ష్యం పరిధి కోసం [టెస్టింగ్ మరియు అనుకూలత](#testing-and-compatibility) చూడండి.

## త్వరిత ప్రారంభం: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

క్యాప్చర్‌ను ప్రయత్నించడానికి Automator లో వర్క్‌ఫ్లోను తెరిచి రన్ చేయండి. దీనిని Service గా అందుబాటులో ఉంచడానికి, బండిల్‌ను `~/Library/Services` క్రింద ఇన్‌స్టాల్ చేయండి:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

**System Settings → Keyboard → Keyboard Shortcuts → Services** లో ఒక షార్ట్‌కట్‌ను కేటాయించండి. macOS అడిగినప్పుడు Reminders కు Automation యాక్సెస్‌ను అనుమతించండి. నమోదు చేయండి:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

నేటివ్ వర్క్‌ఫ్లో రేపటికి గడువు ఉన్న అధిక ప్రాధాన్యత గల రిమైండర్‌ను సృష్టిస్తుంది, దానిని `shopping` జాబితాకు రూట్ చేస్తుంది మరియు సందర్భాన్ని రికార్డ్ చేస్తుంది. ప్రాజెక్ట్ లేదా సందర్భ మార్కర్ లేకుండా, క్విక్ క్యాప్చర్ `Inbox` ను ఉపయోగిస్తుంది.

## క్యాప్చర్ సింటాక్స్

నేటివ్ టాస్క్ పార్సర్ మరియు Alfred టాస్క్ క్యాప్చర్ ఈ మార్కర్‌లను గుర్తిస్తాయి. ప్రొవైడర్ అడాప్టర్‌లకు వాటి స్వంత ఫీల్డ్ మరియు రూటింగ్ మద్దతు ఉంది.

| ఇన్‌పుట్ | అర్థం | ఉదాహరణ |
| --- | --- | --- |
| `!1`, `!2`, `!3` | అధిక, మధ్యస్థ లేదా తక్కువ ప్రాధాన్యత | `Fix login !1` |
| `today`, `tomorrow`, `next week` | సాపేక్ష గడువు తేదీ | `Call dentist tomorrow` |
| వారపు రోజు లేదా `next weekday` | వారపు రోజు గడువు తేదీ | `Send report next monday` |
| `due:YYYY-MM-DD` | స్పష్టమైన గడువు తేదీ | `Renew membership due:2027-03-15` |
| తేదీతో పాటు సమయం | గడువు సమయం | `Call Alex tomorrow at 3pm` |
| `@context` | సందర్భ మార్కర్ | `Buy milk @errands` |
| `+project` | ప్రాజెక్ట్/జాబితా రూటింగ్ | `Draft outline +website` |

`due:today` మరియు `due:tomorrow` కూడా ఆమోదించబడతాయి. సందర్భ మరియు ప్రాజెక్ట్ మార్కర్‌లలో అక్షరాలు, సంఖ్యలు, అండర్‌స్కోర్‌లు లేదా హైఫన్‌లను ఉపయోగించండి. నేటివ్ క్విక్ క్యాప్చర్ సందర్భ రూటింగ్ కంటే ప్రాజెక్ట్ రూటింగ్‌కు ప్రాధాన్యత ఇస్తుంది.

Calendar క్యాప్చర్ ఈవెంట్ ప్రదేశం కోసం `@` ను ఉపయోగిస్తుంది మరియు నిమిషాలు లేదా గంటలలో వ్యవధిని ఆమోదిస్తుంది:

```text
Planning tomorrow 2pm 45m @Conference Room
```

స్పష్టమైన సమయం లేదా వ్యవధి లేకుండా, Calendar క్యాప్చర్ రాయదగిన మొదటి క్యాలెండర్‌లో ఉదయం 9:00 గంటలు మరియు ఒక గంటను ఉపయోగిస్తుంది.

## వర్క్‌ఫ్లోను ఎంచుకోండి

### నేటివ్ Apple వర్క్‌ఫ్లోలు

| వర్క్‌ఫ్లో | ప్రవర్తన | బండిల్ |
| --- | --- | --- |
| క్విక్ క్యాప్చర్ | టాస్క్ టెక్స్ట్‌ను పార్స్ చేసి రిమైండర్‌ను సృష్టించండి | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| క్లిప్‌బోర్డ్ క్యాప్చర్ | క్లిప్‌బోర్డ్ టెక్స్ట్ నుండి రిమైండర్‌ను సృష్టించండి | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| బ్యాచ్ క్యాప్చర్ | బహుళ లైన్‌ల నుండి రిమైండర్‌లను సృష్టించండి | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| ఈవెంట్ క్యాప్చర్ | Calendar ఈవెంట్‌ను సృష్టించండి | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| వారపు సమీక్ష | మార్గదర్శక సమీక్ష మరియు రిమైండర్ బ్రెయిన్ డంప్ | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

ఒక బండిల్‌ను ప్రయత్నించడానికి Automator లో తెరవండి, లేదా కీబోర్డ్ యాక్సెస్ కోసం దానిని `~/Library/Services` క్రింద ఇన్‌స్టాల్ చేయండి. Reminders మరియు Calendar కు తగిన macOS Automation అనుమతులు అవసరం.

### Alfred

Powerpack తో కూడిన Alfred అవసరం. ప్రస్తుత సోర్స్ నుండి ప్యాకేజీని బిల్డ్ చేయండి:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

మీరు [రిలీజ్‌ల](https://github.com/somethingwithproof/MacGTD/releases) నుండి కూడా ప్యాకేజీని డౌన్‌లోడ్ చేసుకోవచ్చు. రిలీజ్ ప్యాకేజీలు వాటి ట్యాగ్ చేయబడిన సోర్స్‌ను ప్రతిబింబిస్తాయి; ఒక రిలీజ్ తర్వాత `main` కు జోడించబడిన ఫీచర్లకు సోర్స్ బిల్డ్ అవసరం.

| కీవర్డ్ | చర్య |
| --- | --- |
| `task` | తేదీ, సందర్భం, ప్రాజెక్ట్ మరియు ప్రాధాన్యత పార్సింగ్‌తో టాస్క్‌ను క్యాప్చర్ చేయండి |
| `note` | Reminders లో రిఫరెన్స్ నోట్‌ను నిల్వ చేయండి |
| `project` | Reminders జాబితాను సృష్టించండి |
| `gtd process` | మానవ సమీక్ష కోసం ఇన్‌బాక్స్‌ను తెరవండి |
| `clip` | క్లిప్‌బోర్డ్ టెక్స్ట్‌ను క్యాప్చర్ చేయండి |
| `gtd focus` | ఫోకస్ సెషన్‌ను ప్రారంభించండి, స్థితిని పరిశీలించండి లేదా ఆపండి |
| `gtd analytics` | రికార్డ్ చేయబడిన ఫోకస్ వ్యవధులను పరిశీలించండి |
| `gtd preferences` | వర్క్‌ఫ్లో ప్రాధాన్యతలను సవరించండి |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

ప్రాధాన్యతలు `~/Library/Preferences/com.alfredgtd.plist` లో ఉంటాయి; ఫోకస్ స్థితి మరియు లాగ్‌లు `~/.gtd` క్రింద ఉంటాయి. ప్రాధాన్యతలకు అంతర్నిర్మిత డిఫాల్ట్‌లు, టైప్ తనిఖీలు, ధృవీకరించబడిన ఇంపోర్ట్‌లు మరియు అటామిక్ రైట్‌లు ఉంటాయి. ఫోకస్ సెషన్‌లు సిస్టమ్ నోటిఫికేషన్ సెట్టింగ్‌లను మార్చవు. ఇన్‌బాక్స్ ప్రాసెసింగ్ సమీక్ష కోసం జాబితాను తెరుస్తుంది; ఇది టాస్క్‌లను స్వయంచాలకంగా తరలించదు లేదా పూర్తి చేయదు.

[Alfred గైడ్](../../../workflows/alfred/README.md) మరియు [GTDLib లైబ్రరీ డాక్యుమెంటేషన్](../../../workflows/alfred/GTDLib.scptd/README.md) చూడండి.

### బాహ్య క్యాప్చర్ అడాప్టర్‌లు

మొత్తం నాలుగు API క్యాప్చర్ వర్క్‌ఫ్లోలు హోస్ట్ చేసిన E2E లో నిజమైన Automator డైలాగ్‌లు మరియు స్థానిక TLS ఫిక్చర్ ద్వారా పరీక్షించబడతాయి. ప్రత్యేక ఖాతాలు కాన్ఫిగర్ చేయబడినప్పుడు ప్రత్యేక మాన్యువల్ సూట్ నిజమైన వెండర్ పర్సిస్టెన్స్‌ను పరీక్షిస్తుంది. Things మరియు OmniFocus కు లైసెన్స్ పొందిన డెస్క్‌టాప్ ఇంటిగ్రేషన్ సూట్ అవసరం.

| లక్ష్యం | విధానం | సెటప్ / సోర్స్ |
| --- | --- | --- |
| Todoist | API క్యాప్చర్ | [వర్క్‌ఫ్లో మరియు Keychain సెటప్](../../../workflows/todoist/) |
| Notion | డేటా సోర్స్ API క్యాప్చర్ | [వర్క్‌ఫ్లో మరియు Keychain సెటప్](../../../workflows/notion/) |
| Things 3 | URL స్కీమ్ | [వర్క్‌ఫ్లో](../../../workflows/things/) |
| OmniFocus | AppleScript / URL స్కీమ్ | [వర్క్‌ఫ్లో](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [వర్క్‌ఫ్లో](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [వర్క్‌ఫ్లో](../../../workflows/google/) |

API అడాప్టర్‌లకు క్రెడెన్షియల్ సెటప్ అవసరం; Microsoft కు డెలిగేటెడ్ OAuth ఆథరైజేషన్ మరియు Google Keep కు అర్హత గల Workspace యాక్సెస్ అవసరం:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[API సెటప్, మైగ్రేషన్ మరియు ఆథరైజేషన్ అవసరాలు](../../../workflows/api/README.md) చూడండి. సరిగ్గా ఒక డేటా సోర్స్ కనుగొనబడినప్పుడు మాత్రమే ఇప్పటికే ఉన్న Notion డేటాబేస్ ID లు మైగ్రేట్ అవుతాయి. Microsoft మరియు Google క్యాప్చర్ డాక్యుమెంట్ చేయబడని బ్రౌజర్ షార్ట్‌కట్‌లకు బదులుగా API లను ఉపయోగిస్తాయి. OAuth యాక్సెస్ టోకెన్‌లను మీ OAuth క్లయింట్ ద్వారా పునరుద్ధరించాల్సి ఉంటుంది. పేలోడ్‌లు స్పష్టమైన JSON కీలు, బౌండెడ్ HTTPS అభ్యర్థనలు మరియు ప్రతిస్పందన నిర్ధారణను ఉపయోగిస్తాయి. ఎర్రర్ సందేశాలు కాన్ఫిగర్ చేసిన API టోకెన్‌ను దాచిపెడుతూనే వైఫల్య వివరాలను నిలుపుకుంటాయి. భద్రతా సమస్యలను నివేదించడానికి [SECURITY.md](../../../SECURITY.md) చూడండి.

### మెనూ బార్ మరియు Shortcuts

[మెనూ బార్ గైడ్](../../../workflows/menubar/README.md) ఐచ్ఛిక SwiftBar/xbar ప్లగిన్‌ను వివరిస్తుంది. ముందుగా Apple Services ను ఇన్‌స్టాల్ చేయండి, ఆపై మీ మెనూ బార్ యాప్‌లో ప్లగిన్ డైరెక్టరీని కాన్ఫిగర్ చేసి అందులోకి `workflows/menubar/gtd-menubar.sh` ను లింక్ చేయండి.

[Shortcuts గైడ్](../../../workflows/shortcuts/README.md) macOS 12+ పై టెక్స్ట్, క్లిప్‌బోర్డ్ మరియు Siri క్యాప్చర్ కోసం మాన్యువల్ సెటప్‌ను అందిస్తుంది. Shortcuts మరియు Siri వాయిస్ యాక్టివేషన్ హోస్ట్ చేసిన టెస్ట్ సూట్ వెలుపల ఉన్నాయి.

## ఆర్కిటెక్చర్

Automator బండిల్స్ నేటివ్ Services గా రన్ అయ్యేలా AppleScript ను పొందుపరుస్తాయి. Alfred యాక్షన్ స్క్రిప్ట్‌లను ప్యాకేజ్ చేసి వినియోగదారు ఇన్‌పుట్‌ను ఆర్గ్యుమెంట్‌లుగా పాస్ చేస్తుంది. GTDLib సవరించదగిన AppleScript సోర్స్ మరియు కంపైల్ చేసిన స్క్రిప్ట్ బండిల్ నుండి పంచుకున్న నేటివ్ Reminders ఆపరేషన్‌లను అందిస్తుంది.

- **ఒకే ప్రొడక్షన్ పార్సర్:** `scripts/sync-native-parser.py` పంచుకున్న పార్సర్‌ను Quick Capture మరియు Event Capture లలో పొందుపరుస్తుంది; ధృవీకరణ సోర్స్ తేడాలను గుర్తిస్తుంది.
- **నిరంతర ఫోకస్ స్థితి:** వేర్వేరు ఆహ్వానాలు తమ సొంత launchd జాబ్‌లు మరియు బౌండెడ్ గడిచిన-సమయ లెక్కింపుతో సెషన్ స్థితిని పంచుకుంటాయి.
- **పునరుత్పాదక ప్యాకేజీలు:** ప్యాకేజింగ్ కొత్త ఆర్కైవ్‌ను నిర్మిస్తుంది మరియు టెస్ట్‌లు దాని కంటెంట్‌లను సోర్స్‌తో పోలుస్తాయి. లైబ్రరీకి ప్రత్యేక కంపైలేషన్ స్క్రిప్ట్ ఉంది.
- **పరిశీలించదగిన టెస్ట్‌లు:** JUnit నివేదికలు, కమాండ్ లాగ్‌లు మరియు పరీక్షించిన బిల్డ్ ఆర్టిఫ్యాక్ట్‌లు GitHub Actions లో 14 రోజుల పాటు నిల్వ చేయబడతాయి.

| డైరెక్టరీ | బాధ్యత |
| --- | --- |
| [`workflows/`](../../../workflows/) | నేటివ్ బండిల్స్, ప్రొవైడర్ అడాప్టర్‌లు, Alfred, Shortcuts మరియు మెనూ బార్ స్క్రిప్ట్‌లు |
| [`scripts/`](../../../scripts/) | ప్యాకేజింగ్, లైబ్రరీ కంపైలేషన్, పార్సర్ సింక్రొనైజేషన్ మరియు హోస్ట్ చేసిన టెస్ట్ ప్రొవిజనింగ్ |
| [`tests/`](../../../tests/) | ధృవీకరణ, కాంపోనెంట్ తనిఖీలు మరియు నేటివ్ డెస్క్‌టాప్ E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, నైట్లీ/మాన్యువల్ E2E మరియు రిపోజిటరీ నిర్వహణ |
| [`infra/`](../../../infra/) | ఐచ్ఛిక స్థానిక మరియు EC2 Mac రన్నర్ సెటప్; హోస్ట్ చేసిన CI కి ఇది అవసరం లేదు |

<a name="testing-and-compatibility"></a>

## టెస్టింగ్ మరియు అనుకూలత

| పరిధి | పర్యావరణం | ఏమి తనిఖీ చేయబడుతుంది |
| --- | --- | --- |
| ధృవీకరణ | GitHub హోస్ట్ చేసిన macOS 15 మరియు 26 | AppleScript కంపైలేషన్, బండిల్స్, ప్రొడక్షన్ పార్సర్, యాక్షన్ లక్ష్యాలు, ప్రాధాన్యతలు, ఫోకస్ స్థితి, ఫిక్చర్ API ట్రాన్స్‌పోర్ట్ మరియు ప్యాకేజీ రౌండ్ ట్రిప్‌లు |
| భద్రతా తనిఖీలు | GitHub హోస్ట్ చేసిన Ubuntu మరియు macOS 15 | Python CodeQL, ShellCheck మరియు కంపైల్ చేసిన ప్రొడక్షన్ పార్సర్ యొక్క బౌండెడ్ Atheris ఫజ్జింగ్ |
| ప్రొవైడర్ అడాప్టర్ E2E | GitHub హోస్ట్ చేసిన `macos-15-intel` | మొత్తం నాలుగు ప్రొడక్షన్ API డైలాగ్‌లు, TLS ట్రాన్స్‌పోర్ట్, ఫిక్చర్ పర్సిస్టెన్స్/రీడ్‌బ్యాక్, API వైఫల్యాలు, రద్దు మరియు Notion సోర్స్ ఎంపిక |
| లైవ్ ప్రొవైడర్ E2E | ప్రత్యేక సీక్రెట్‌లతో మాన్యువల్ GitHub హోస్ట్ చేసిన Mac రన్ | నిజమైన Todoist, Notion, Microsoft మరియు Google క్యాప్చర్ మరియు వెండర్ రీడ్‌బ్యాక్; ఖాతాలు లేకపోతే విఫలమవుతుంది |
| లైసెన్స్ పొందిన డెస్క్‌టాప్ ఇంటిగ్రేషన్‌లు | ప్రత్యేక స్థానిక ఖాతా | Things 3, OmniFocus 4 మరియు Alfred UI ఆహ్వానం మరియు పర్సిస్టెన్స్ |
| నేటివ్ డెస్క్‌టాప్ E2E | GitHub హోస్ట్ చేసిన `macos-15-intel` | నిజమైన Automator డైలాగ్‌లు; నిల్వ చేయబడిన Reminders మరియు Calendar డేటా; వారపు సమీక్ష; మెనూ గణనలు; కంపైల్ చేసిన GTDLib; ప్యాకేజ్ చేసిన Alfred నేటివ్ చర్యలు; నిజమైన launchd టైమర్ గడువు మరియు రద్దు |
| ఐచ్ఛిక Alfred UI | ప్రత్యేక స్థానిక ఖాతా, Alfred 5 + Powerpack | లైసెన్స్ పొందిన UI ద్వారా వర్క్‌ఫ్లో ఇంపోర్ట్, కీవర్డ్ ఆహ్వానం మరియు రిమైండర్ రీడ్‌బ్యాక్ |

[ధృవీకరించబడిన API ఆధునీకరణ రన్](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ఎటువంటి వైఫల్యాలు, లోపాలు లేదా స్కిప్‌లు లేకుండా **ప్రతి ధృవీకరణ ప్లాట్‌ఫామ్‌పై 35 ధృవీకరణ టెస్ట్‌లు మరియు 26 డెస్క్‌టాప్ E2E టెస్ట్‌లలో** ఉత్తీర్ణమైంది. డెస్క్‌టాప్ కవరేజీలో 15 నేటివ్ టెస్ట్‌లు మరియు నిజమైన ట్రాన్స్‌పోర్ట్ టైమ్‌అవుట్ మరియు తాత్కాలిక Keychain తనిఖీలతో సహా 11 ప్రొవైడర్ అడాప్టర్ టెస్ట్‌లు ఉన్నాయి. ధృవీకరణ రిపోజిటరీ నిర్మాణ తనిఖీలను కూడా అమలు చేస్తుంది. ఈ ఫలితాలు నేటివ్ ప్రవర్తన మరియు ప్రొవైడర్ ఫిక్చర్‌లను కవర్ చేస్తాయి; అవి లైవ్ వెండర్ లేదా లైసెన్స్ పొందిన యాప్ అనుకూలతను నిర్ధారించవు. ప్రస్తుత స్థితి పైనున్న బ్యాడ్జ్‌ల ద్వారా చూపబడింది.

పుల్ రిక్వెస్ట్‌లు మరియు `main` కు చేసే పుష్‌లు ధృవీకరణను మరియు ఆ తర్వాత నేటివ్ E2E ను రన్ చేస్తాయి. E2E వర్క్‌ఫ్లో డిటర్మినిస్టిక్ ప్రొవైడర్ అడాప్టర్ టెస్ట్‌లతో సహా ప్రతి రాత్రి మరియు మాన్యువల్ డిస్పాచ్‌పై కూడా రన్ అవుతుంది. లైవ్ వెండర్ టెస్ట్‌లు ప్రత్యేక మాన్యువల్ `live-e2e.yml` వర్క్‌ఫ్లోను ఉపయోగిస్తాయి. డిఫాల్ట్ CI డిస్పోజబుల్ GitHub హోస్ట్ చేసిన Mac లు, ఐసోలేటెడ్ ఫిక్చర్‌లు మరియు బౌండెడ్ సబ్‌ప్రాసెస్‌లను ఉపయోగిస్తుంది; డిఫాల్ట్ సూట్ కోసం సెల్ఫ్ హోస్ట్ చేసిన రన్నర్ లేదా బాహ్య ఖాతా క్రెడెన్షియల్స్ అవసరం లేదు. మాన్యువల్ లైవ్ సూట్‌కు ప్రత్యేక ప్రొవైడర్ సీక్రెట్‌లు అవసరం.

మునుపటి macOS వెర్షన్‌లు ప్రస్తుత CI ద్వారా ధృవీకరించబడలేదు. లైవ్ ప్రొవైడర్ రన్‌లకు ప్రత్యేక సీక్రెట్‌లు అవసరం మరియు ఇంకా ధృవీకరించబడలేదు. Shortcuts/Siri మరియు లైసెన్స్ పొందిన డెస్క్‌టాప్ యాప్‌లు డిఫాల్ట్ హోస్ట్ చేసిన సూట్ వెలుపల ఉన్నాయి. నేటివ్ యాక్షన్ టెస్ట్‌లు ప్యాకేజ్ చేసిన Alfred స్క్రిప్ట్‌లను నేరుగా అమలు చేస్తాయి; అవి పూర్తి Alfred UI అనుకూలతను నిర్ధారించవు. [టెస్ట్ సెటప్, ముందస్తు అవసరాలు మరియు కవరేజీ](../../../tests/e2e/README.md) చూడండి.

## స్థానికీకరణ

వినియోగదారులకు కనిపించే CLI, టెస్ట్ రన్నర్ మరియు మెనూ బార్ స్ట్రింగ్‌లు ఎటువంటి థర్డ్-పార్టీ డిపెండెన్సీలు లేకుండా `scripts/i18n.py` ద్వారా `locales/` క్రింద 45 లోకేల్‌లలో (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) అందించబడతాయి. లోకేల్ రిజల్యూషన్ `--lang`, ఆపై `LC_ALL`, `LC_MESSAGES`, మరియు `LANG` లను తనిఖీ చేసి, చివరికి `en` కు ఫాల్‌బ్యాక్ అవుతుంది.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## అభివృద్ధి

[mise](https://mise.jdx.dev/) ను ఇన్‌స్టాల్ చేసి `.mise.toml` లో పిన్ చేసిన Python వెర్షన్‌ను ఉపయోగించండి:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

ధృవీకరణ నివేదికలను `test-results/` క్రింద రాస్తుంది; బిల్డ్ స్క్రిప్ట్‌లు `dist/` లోకి రాస్తాయి. `main` పై హోస్ట్ చేసిన డెస్క్‌టాప్ సూట్‌ను రన్ చేయడానికి:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

స్థానిక డెస్క్‌టాప్ E2E కోసం ప్రత్యేక లాగిన్ చేసిన టెస్ట్ ఖాతా మరియు [E2E గైడ్](../../../tests/e2e/README.md) లో వివరించిన అనుమతులు అవసరం. హోస్ట్ చేసిన అనుమతి-ప్రొవిజనింగ్ స్క్రిప్ట్ డిస్పోజబుల్ GitHub హోస్ట్ చేసిన జాబ్‌లకు మాత్రమే పరిమితం చేయబడింది.

[Conventional Commits](https://www.conventionalcommits.org/) ను ఉపయోగించండి మరియు [CONTRIBUTING.md](../../../CONTRIBUTING.md) ను అనుసరించండి. ఇటీవలి మార్పులు [CHANGELOG.md](../../../CHANGELOG.md) లో నమోదు చేయబడ్డాయి.

భద్రతా నియంత్రణలు, రిలీజ్ సంతకం ధృవీకరణ మరియు మిగిలిన Scorecard
పరిమితులు [భద్రతా అంచనా](../../../docs/security-assessment.md) లో డాక్యుమెంట్ చేయబడ్డాయి.
రిలీజ్ వర్క్‌ఫ్లో డ్రాఫ్ట్ రిలీజ్‌ను సృష్టించే ముందు ప్యాకేజీలను బిల్డ్ చేసి ధృవీకరిస్తుంది,
ఇందులో సోర్స్ కమిట్ మరియు ref పై ధృవీకరించబడిన సంతకం చేసిన in-toto ప్రొవెనెన్స్
మరియు Sigstore బండిల్స్ ఉంటాయి. కొత్త ప్రొవెనెన్స్ ఆ వర్క్‌ఫ్లో బిల్డ్‌లకు మాత్రమే
వర్తిస్తుంది, పాత డౌన్‌లోడ్‌లకు కాదు.

## ప్రాజెక్ట్ చరిత్ర మరియు లైసెన్స్

MacGTD గతంలోని MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, మరియు AlfredGTD రిపోజిటరీలను ఏకీకృతం చేస్తుంది. ఇది [MIT లైసెన్స్](../../../LICENSE) క్రింద లైసెన్స్ పొందింది.
