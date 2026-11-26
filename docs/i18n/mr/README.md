# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · **मराठी** · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD हा तुम्ही आधीपासून वापरत असलेल्या ॲप्ससह कार्ये नोंदवण्यासाठी, रिमाइंडर्स व्यवस्थापित करण्यासाठी आणि कालबद्ध फोकस सत्रे चालवण्यासाठी असलेल्या macOS वर्कफ्लोचा संग्रह आहे.**

[Getting Things Done](https://gettingthingsdone.com/) पद्धतीवर आधारित, हे Apple Reminders मध्ये डायलॉग, क्लिपबोर्ड आणि बॅच पद्धतीने कार्ये नोंदवण्याची सुविधा आणते; Calendar मध्ये इव्हेंट नोंदवण्याची सुविधा देते; आणि Alfred मध्ये कार्य, टीप, प्रकल्प आणि फोकस कमांड्स उपलब्ध करून देते. AppleScript आणि Automator मुळे नेटिव्ह वर्कफ्लो macOS शी सुसंगत राहतात. API अडॅप्टर्स Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 आणि Google Keep v1 वापरतात. Things आणि OmniFocus अडॅप्टर्स देखील समाविष्ट आहेत. होस्ट केलेल्या चाचण्या स्थानिक HTTPS फिक्स्चरविरुद्ध API अडॅप्टर्सची पडताळणी करतात; थेट सुसंगततेसाठी अजूनही स्वतंत्र प्रदाता खात्यांची आवश्यकता आहे.

## तुम्ही काय करू शकता

- **ॲप्स न बदलता कार्ये नोंदवा.** कार्य जोडण्यासाठी Automator Service, Alfred कीवर्ड किंवा क्लिपबोर्ड वापरा. बॅच कॅप्चर प्रत्येक रिकाम्या नसलेल्या ओळीसाठी एक रिमाइंडर तयार करते.
- **मजकुराचे संरचित कार्यांमध्ये रूपांतर करा.** नेटिव्ह क्विक कॅप्चर आणि Calendar कॅप्चरद्वारे सामायिक केलेल्या प्रॉडक्शन AppleScript पार्सरचा वापर करून सापेक्ष आणि ISO तारखा, वेळा, प्राधान्यक्रम, संदर्भ आणि प्रकल्प पार्स करा.
- **इव्हेंट्स नोंदवा आणि तुमच्या इनबॉक्सचे पुनरावलोकन करा.** वेळ, कालावधी आणि स्थानासह Calendar इव्हेंट्स तयार करा; Reminders मध्ये ब्रेन डंपसह पाच-टप्प्यांचे साप्ताहिक पुनरावलोकन चालवा.
- **कालबद्ध फोकस सत्रांमध्ये काम करा.** विविध प्रक्रियांमध्ये सत्रे सुरू करा, तपासा आणि थांबवा. सत्राच्या मालकीचे launchd टायमर्स मुदत समाप्ती आणि रद्दीकरण हाताळतात; JSONL लॉग कालावधीचे विश्लेषण देतात.
- **केवळ कार्यांपेक्षा अधिक गोष्टींसाठी Alfred वापरा.** प्रकल्पांसाठी Reminders याद्या तयार करा, संदर्भ टिपा जतन करा, पुनरावलोकनासाठी इनबॉक्स उघडा, क्लिपबोर्ड मजकूर नोंदवा आणि टाइप केलेली प्राधान्ये संपादित करा.
- **मेनू बारमधून तुमचा इनबॉक्स पहा.** पर्यायी SwiftBar/xbar प्लगइन अपूर्ण इनबॉक्स संख्या दाखवते आणि कॅप्चर वर्कफ्लोशी लिंक करते.

प्रत्यक्ष GitHub-होस्ट केलेल्या Mac वर नेटिव्ह वर्तन तपासले जाते: चाचण्या Automator डायलॉग्स चालवतात आणि नंतर Reminders व Calendar नोंदी परत वाचतात. त्या पुराव्याच्या व्याप्तीसाठी [चाचणी आणि सुसंगतता](#testing-and-compatibility) पहा.

## त्वरित सुरुवात: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

कॅप्चर करून पाहण्यासाठी Automator मध्ये वर्कफ्लो उघडा आणि तो चालवा. तो Service म्हणून उपलब्ध करण्यासाठी, `~/Library/Services` अंतर्गत बंडल इंस्टॉल करा:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

**System Settings → Keyboard → Keyboard Shortcuts → Services** मध्ये शॉर्टकट नियुक्त करा. macOS ने विचारल्यावर Reminders साठी Automation प्रवेशास अनुमती द्या. प्रविष्ट करा:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

नेटिव्ह वर्कफ्लो उद्याची अंतिम मुदत असलेला उच्च-प्राधान्याचा रिमाइंडर तयार करतो, तो `shopping` यादीत पाठवतो आणि संदर्भ नोंदवतो. प्रकल्प किंवा संदर्भ चिन्हाशिवाय, क्विक कॅप्चर `Inbox` वापरतो.

## कॅप्चर सिंटॅक्स

नेटिव्ह कार्य पार्सर आणि Alfred कार्य कॅप्चर ही चिन्हे ओळखतात. प्रदाता अडॅप्टर्सना त्यांचे स्वतःचे फील्ड आणि राउटिंग समर्थन असते.

| इनपुट | अर्थ | उदाहरण |
| --- | --- | --- |
| `!1`, `!2`, `!3` | उच्च, मध्यम किंवा कमी प्राधान्य | `Fix login !1` |
| `today`, `tomorrow`, `next week` | सापेक्ष अंतिम तारीख | `Call dentist tomorrow` |
| आठवड्याचा वार किंवा `next weekday` | आठवड्याच्या वाराची अंतिम तारीख | `Send report next monday` |
| `due:YYYY-MM-DD` | स्पष्ट अंतिम तारीख | `Renew membership due:2027-03-15` |
| तारखेसह वेळ | अंतिम वेळ | `Call Alex tomorrow at 3pm` |
| `@context` | संदर्भ चिन्ह | `Buy milk @errands` |
| `+project` | प्रकल्प/यादी राउटिंग | `Draft outline +website` |

`due:today` आणि `due:tomorrow` देखील स्वीकारले जातात. संदर्भ आणि प्रकल्प चिन्हांमध्ये अक्षरे, अंक, अंडरस्कोर किंवा हायफन वापरा. नेटिव्ह क्विक कॅप्चर संदर्भ राउटिंगपेक्षा प्रकल्प राउटिंगला प्राधान्य देते.

Calendar कॅप्चर इव्हेंटच्या स्थानासाठी `@` वापरते आणि मिनिटे किंवा तासांमध्ये कालावधी स्वीकारते:

```text
Planning tomorrow 2pm 45m @Conference Room
```

स्पष्ट वेळ किंवा कालावधी नसताना, Calendar कॅप्चर पहिल्या लेखनीय कॅलेंडरमध्ये सकाळी 9:00 आणि एक तास वापरते.

## वर्कफ्लो निवडा

### नेटिव्ह Apple वर्कफ्लो

| वर्कफ्लो | वर्तन | बंडल |
| --- | --- | --- |
| क्विक कॅप्चर | कार्य मजकूर पार्स करा आणि रिमाइंडर तयार करा | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| क्लिपबोर्ड कॅप्चर | क्लिपबोर्ड मजकुरातून रिमाइंडर तयार करा | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| बॅच कॅप्चर | अनेक ओळींमधून रिमाइंडर्स तयार करा | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| इव्हेंट कॅप्चर | Calendar इव्हेंट तयार करा | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| साप्ताहिक पुनरावलोकन | मार्गदर्शित पुनरावलोकन आणि रिमाइंडर ब्रेन डंप | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

बंडल वापरून पाहण्यासाठी Automator मध्ये उघडा, किंवा कीबोर्ड प्रवेशासाठी `~/Library/Services` अंतर्गत इंस्टॉल करा. Reminders आणि Calendar ला योग्य macOS Automation परवानग्या आवश्यक आहेत.

### Alfred

Powerpack सह Alfred आवश्यक आहे. वर्तमान स्रोतापासून पॅकेज बिल्ड करा:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

तुम्ही [प्रकाशनांमधून](https://github.com/somethingwithproof/MacGTD/releases) देखील पॅकेज डाउनलोड करू शकता. प्रकाशन पॅकेजेस त्यांच्या टॅग केलेल्या स्रोताचे प्रतिबिंब असतात; प्रकाशनानंतर `main` मध्ये जोडलेल्या वैशिष्ट्यांसाठी स्रोत बिल्ड आवश्यक आहे.

| कीवर्ड | कृती |
| --- | --- |
| `task` | तारीख, संदर्भ, प्रकल्प आणि प्राधान्य पार्सिंगसह कार्य नोंदवा |
| `note` | Reminders मध्ये संदर्भ टीप साठवा |
| `project` | Reminders यादी तयार करा |
| `gtd process` | मानवी पुनरावलोकनासाठी Inbox उघडा |
| `clip` | क्लिपबोर्ड मजकूर नोंदवा |
| `gtd focus` | फोकस सत्र सुरू करा, स्थिती तपासा किंवा थांबवा |
| `gtd analytics` | नोंदवलेला फोकस कालावधी तपासा |
| `gtd preferences` | वर्कफ्लो प्राधान्ये संपादित करा |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

प्राधान्ये `~/Library/Preferences/com.alfredgtd.plist` मध्ये राहतात; फोकस स्थिती आणि लॉग `~/.gtd` अंतर्गत राहतात. प्राधान्यांमध्ये अंगभूत डीफॉल्ट्स, प्रकार तपासण्या, प्रमाणित आयाती आणि ॲटॉमिक लेखन असतात. फोकस सत्रे सिस्टम सूचना सेटिंग्ज बदलत नाहीत. Inbox प्रक्रिया पुनरावलोकनासाठी यादी उघडते; ती आपोआप कार्ये हलवत नाही किंवा पूर्ण करत नाही.

[Alfred मार्गदर्शक](../../../workflows/alfred/README.md) आणि [GTDLib लायब्ररी दस्तऐवजीकरण](../../../workflows/alfred/GTDLib.scptd/README.md) पहा.

### बाह्य कॅप्चर अडॅप्टर्स

होस्ट केलेल्या E2E मध्ये सर्व चार API कॅप्चर वर्कफ्लो प्रत्यक्ष Automator डायलॉग्स आणि स्थानिक TLS फिक्स्चरद्वारे तपासले जातात. स्वतंत्र खाती कॉन्फिगर केलेली असताना एक वेगळा मॅन्युअल संच प्रत्यक्ष विक्रेता डेटा साठवणुकीची चाचणी करतो. Things आणि OmniFocus साठी परवानाधारक डेस्कटॉप एकत्रीकरण संच आवश्यक आहे.

| लक्ष्य | यंत्रणा | सेटअप / स्रोत |
| --- | --- | --- |
| Todoist | API कॅप्चर | [वर्कफ्लो आणि Keychain सेटअप](../../../workflows/todoist/) |
| Notion | डेटा स्रोत API कॅप्चर | [वर्कफ्लो आणि Keychain सेटअप](../../../workflows/notion/) |
| Things 3 | URL स्कीम | [वर्कफ्लो](../../../workflows/things/) |
| OmniFocus | AppleScript / URL स्कीम | [वर्कफ्लो](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [वर्कफ्लो](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [वर्कफ्लो](../../../workflows/google/) |

API अडॅप्टर्सना क्रेडेन्शियल सेटअप आवश्यक आहे; Microsoft ला डेलिगेटेड OAuth अधिकृतता आवश्यक आहे आणि Google Keep ला पात्र Workspace प्रवेश आवश्यक आहे:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[API सेटअप, स्थलांतरण आणि अधिकृतता आवश्यकता](../../../workflows/api/README.md) पहा. विद्यमान Notion डेटाबेस ID केवळ तेव्हाच स्थलांतरित होतात जेव्हा नेमका एकच डेटा स्रोत सापडतो. Microsoft आणि Google कॅप्चर अनधिकृत ब्राउझर शॉर्टकट्सऐवजी API वापरतात. OAuth ॲक्सेस टोकन्सचे तुमच्या OAuth क्लायंटद्वारे नूतनीकरण करणे आवश्यक असते. पेलोड्स स्पष्ट JSON की, मर्यादित HTTPS विनंत्या आणि प्रतिसाद पुष्टीकरण वापरतात. त्रुटी संदेश कॉन्फिगर केलेला API टोकन लपवून अपयशाचा तपशील कायम ठेवतात. सुरक्षा समस्यांची तक्रार करण्यासाठी [SECURITY.md](../../../SECURITY.md) पहा.

### मेनू बार आणि Shortcuts

[मेनू बार मार्गदर्शक](../../../workflows/menubar/README.md) पर्यायी SwiftBar/xbar प्लगइनबद्दल माहिती देते. प्रथम Apple Services इंस्टॉल करा, त्यानंतर तुमच्या मेनू बार ॲपमध्ये प्लगइन निर्देशिका कॉन्फिगर करा आणि त्यात `workflows/menubar/gtd-menubar.sh` लिंक करा.

[Shortcuts मार्गदर्शक](../../../workflows/shortcuts/README.md) macOS 12+ वर मजकूर, क्लिपबोर्ड आणि Siri कॅप्चरसाठी मॅन्युअल सेटअप प्रदान करते. Shortcuts आणि Siri व्हॉइस सक्रियता होस्ट केलेल्या चाचणी संचाच्या बाहेर आहेत.

## आर्किटेक्चर

Automator बंडल्स AppleScript एम्बेड करतात जेणेकरून ते नेटिव्ह Services म्हणून चालू शकतील. Alfred कृती स्क्रिप्ट्स पॅकेज करते आणि वापरकर्ता इनपुट आर्ग्युमेंट्स म्हणून पाठवते. GTDLib संपादित करण्यायोग्य AppleScript स्रोत आणि संकलित स्क्रिप्ट बंडलमधून सामायिक नेटिव्ह Reminders क्रिया उपलब्ध करून देते.

- **एक प्रॉडक्शन पार्सर:** `scripts/sync-native-parser.py` हा सामायिक पार्सर Quick Capture आणि Event Capture मध्ये एम्बेड करतो; पडताळणी स्रोतातील फरक शोधून काढते.
- **चिरस्थायी फोकस स्थिती:** स्वतंत्र कॉल्स सत्राची स्थिती सामायिक करतात, ज्यामध्ये स्वतःचे launchd जॉब्स आणि मर्यादित व्यतीत-वेळ हिशेब असतो.
- **पुनरुत्पादनीय पॅकेजेस:** पॅकेजिंग नवीन संग्रह तयार करते आणि चाचण्या त्याची सामग्री स्रोताशी तुलना करतात. लायब्ररीसाठी स्वतंत्र संकलन स्क्रिप्ट आहे.
- **निरीक्षणीय चाचण्या:** JUnit अहवाल, कमांड लॉग आणि तपासलेल्या बिल्ड कलाकृती GitHub Actions मध्ये 14 दिवस जतन केल्या जातात.

| निर्देशिका | जबाबदारी |
| --- | --- |
| [`workflows/`](../../../workflows/) | नेटिव्ह बंडल्स, प्रदाता अडॅप्टर्स, Alfred, Shortcuts आणि मेनू बार स्क्रिप्ट्स |
| [`scripts/`](../../../scripts/) | पॅकेजिंग, लायब्ररी संकलन, पार्सर समक्रमण आणि होस्ट केलेल्या चाचण्यांची तरतूद |
| [`tests/`](../../../tests/) | पडताळणी, घटक तपासण्या आणि नेटिव्ह डेस्कटॉप E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, रात्रीच्या/मॅन्युअल E2E आणि रेपॉजिटरी देखभाल |
| [`infra/`](../../../infra/) | पर्यायी स्थानिक आणि EC2 Mac रनर सेटअप; होस्ट केलेल्या CI ला याची आवश्यकता नसते |

## चाचणी आणि सुसंगतता

| व्याप्ती | वातावरण | काय तपासले जाते |
| --- | --- | --- |
| पडताळणी | GitHub-होस्ट केलेले macOS 15 आणि 26 | AppleScript संकलन, बंडल्स, प्रॉडक्शन पार्सर, कृती लक्ष्ये, प्राधान्ये, फोकस स्थिती, फिक्स्चर API वाहतूक आणि पॅकेज राउंड ट्रिप्स |
| सुरक्षा तपासण्या | GitHub-होस्ट केलेले Ubuntu आणि macOS 15 | Python CodeQL, ShellCheck आणि संकलित प्रॉडक्शन पार्सरचे मर्यादित Atheris फझिंग |
| प्रदाता अडॅप्टर E2E | GitHub-होस्ट केलेले `macos-15-intel` | सर्व चार प्रॉडक्शन API डायलॉग्स, TLS वाहतूक, फिक्स्चर साठवणूक/परत वाचन, API अपयश, रद्दीकरण आणि Notion स्रोत निवड |
| थेट प्रदाता E2E | स्वतंत्र सिक्रेट्ससह मॅन्युअल GitHub-होस्ट केलेली Mac रन | प्रत्यक्ष Todoist, Notion, Microsoft आणि Google कॅप्चर आणि विक्रेता परत वाचन; खाती नसल्यास अयशस्वी होते |
| परवानाधारक डेस्कटॉप एकत्रीकरण | स्वतंत्र स्थानिक खाते | Things 3, OmniFocus 4 आणि Alfred UI कॉल करणे आणि डेटा साठवणूक |
| नेटिव्ह डेस्कटॉप E2E | GitHub-होस्ट केलेले `macos-15-intel` | प्रत्यक्ष Automator डायलॉग्स; साठवलेला Reminders आणि Calendar डेटा; साप्ताहिक पुनरावलोकन; मेनू संख्या; संकलित GTDLib; पॅकेज केलेल्या Alfred नेटिव्ह कृती; प्रत्यक्ष launchd टायमर मुदत समाप्ती आणि रद्दीकरण |
| पर्यायी Alfred UI | स्वतंत्र स्थानिक खाते, Alfred 5 + Powerpack | परवानाधारक UI द्वारे वर्कफ्लो आयात, कीवर्ड कॉल करणे आणि रिमाइंडर परत वाचन |

[सत्यापित API आधुनिकीकरण रनने](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) **प्रत्येक पडताळणी प्लॅटफॉर्मवर 35 पडताळणी चाचण्या आणि 26 डेस्कटॉप E2E चाचण्या** कोणत्याही अपयश, त्रुटी किंवा वगळण्याशिवाय उत्तीर्ण केल्या. डेस्कटॉप व्याप्तीमध्ये 15 नेटिव्ह चाचण्या आणि 11 प्रदाता अडॅप्टर चाचण्या समाविष्ट आहेत, ज्यात प्रत्यक्ष वाहतूक टाइमआउट आणि तात्पुरत्या Keychain तपासण्यांचा समावेश आहे. पडताळणी रेपॉजिटरी संरचना तपासण्या देखील चालवते. हे निकाल नेटिव्ह वर्तन आणि प्रदाता फिक्स्चर व्यापतात; ते थेट विक्रेता किंवा परवानाधारक ॲप सुसंगतता सिद्ध करत नाहीत. वर्तमान स्थिती वरील बॅजेसद्वारे दर्शविली आहे.

पुल विनंत्या आणि `main` वर केलेले पुश पडताळणी आणि त्यानंतर नेटिव्ह E2E चालवतात. E2E वर्कफ्लो रात्रीचा आणि मॅन्युअल डिस्पॅचवर देखील चालतो, ज्यामध्ये निश्चित स्वरूपाच्या प्रदाता अडॅप्टर चाचण्यांचा समावेश आहे. थेट विक्रेता चाचण्या स्वतंत्र मॅन्युअल `live-e2e.yml` वर्कफ्लो वापरतात. डीफॉल्ट CI मध्ये तात्पुरते GitHub-होस्ट केलेले Mac, वेगळे केलेले फिक्स्चर आणि मर्यादित उपप्रक्रिया वापरल्या जातात; डीफॉल्ट संचासाठी कोणत्याही स्वयं-होस्ट केलेल्या रनरची किंवा बाह्य खाते क्रेडेन्शियल्सची आवश्यकता नाही. मॅन्युअल थेट संचासाठी स्वतंत्र प्रदाता सिक्रेट्स आवश्यक असतात.

मागील macOS आवृत्त्या वर्तमान CI द्वारे तपासलेल्या नाहीत. थेट प्रदाता रन्ससाठी स्वतंत्र सिक्रेट्स आवश्यक आहेत आणि त्यांची अद्याप पडताळणी झालेली नाही. Shortcuts/Siri आणि परवानाधारक डेस्कटॉप ॲप्स डीफॉल्ट होस्ट केलेल्या संचाच्या बाहेर आहेत. नेटिव्ह कृती चाचण्या पॅकेज केलेल्या Alfred स्क्रिप्ट्स थेट तपासतात; त्या पूर्ण Alfred UI सुसंगतता सिद्ध करत नाहीत. [चाचणी सेटअप, पूर्वतयारी आणि व्याप्ती](../../../tests/e2e/README.md) पहा.

## स्थानिकीकरण

वापरकर्ता-समोर येणारे CLI, चाचणी रनर आणि मेनू बार मजकूर कोणत्याही तृतीय-पक्ष अवलंबनाशिवाय `scripts/i18n.py` द्वारे `locales/` अंतर्गत 45 लोकॅल्समध्ये (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) उपलब्ध आहेत. लोकॅल निश्चिती आधी `--lang`, नंतर `LC_ALL`, `LC_MESSAGES` आणि `LANG` तपासते, आणि काहीही न मिळाल्यास `en` वापरते.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## विकास

[mise](https://mise.jdx.dev/) इंस्टॉल करा आणि `.mise.toml` मध्ये पिन केलेली Python आवृत्ती वापरा:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

पडताळणी `test-results/` अंतर्गत अहवाल लिहिते; बिल्ड स्क्रिप्ट्स `dist/` मध्ये लिहितात. `main` वर होस्ट केलेला डेस्कटॉप संच चालवण्यासाठी:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

स्थानिक डेस्कटॉप E2E साठी एक स्वतंत्र लॉग-इन केलेले चाचणी खाते आणि [E2E मार्गदर्शक](../../../tests/e2e/README.md) मध्ये वर्णन केलेल्या परवानग्या आवश्यक आहेत. होस्ट केलेली परवानगी-तरतूद स्क्रिप्ट तात्पुरत्या GitHub-होस्ट केलेल्या कामांपुरती मर्यादित आहे.

[Conventional Commits](https://www.conventionalcommits.org/) वापरा आणि [CONTRIBUTING.md](../../../CONTRIBUTING.md) चे अनुसरण करा. अलीकडील बदल [CHANGELOG.md](../../../CHANGELOG.md) मध्ये नोंदवलेले आहेत.

सुरक्षा नियंत्रणे, प्रकाशन स्वाक्षरी पडताळणी आणि उर्वरित Scorecard मर्यादा [सुरक्षा मूल्यांकनामध्ये](../../../docs/security-assessment.md) दस्तऐवजीकरण केलेल्या आहेत. प्रकाशन वर्कफ्लो मसुदा प्रकाशन तयार करण्यापूर्वी पॅकेजेस बिल्ड आणि प्रमाणित करतो, ज्यामध्ये स्रोत कमिट आणि ref विरुद्ध सत्यापित केलेले स्वाक्षरीकृत in-toto मूळ दस्तऐवज आणि Sigstore बंडल्स समाविष्ट असतात. नवीन मूळ दस्तऐवज त्या वर्कफ्लो बिल्ड्सना लागू होतात, जुन्या डाउनलोड्सना नाही.

## प्रकल्पाचा इतिहास आणि परवाना

MacGTD पूर्वीच्या MacGTD-Native, MacGTD-Microsoft, MacGTD-Google आणि AlfredGTD रेपॉजिटरीजना एकत्र आणते. हे [MIT License](../../../LICENSE) अंतर्गत परवानाकृत आहे.
