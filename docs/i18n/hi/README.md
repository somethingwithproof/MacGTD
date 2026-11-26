# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · **हिन्दी** · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD macOS वर्कफ़्लो का एक संग्रह है, जो आपके पहले से उपयोग किए जाने वाले ऐप्स के साथ कार्य कैप्चर करने, रिमाइंडर व्यवस्थित करने और समयबद्ध फ़ोकस सत्र चलाने के लिए बनाया गया है।**

[Getting Things Done](https://gettingthingsdone.com/) पर आधारित यह टूल Apple Reminders में डायलॉग, क्लिपबोर्ड और बैच कैप्चर; Calendar में ईवेंट कैप्चर; और Alfred में कार्य, नोट, प्रोजेक्ट और फ़ोकस कमांड लाता है। AppleScript और Automator नेटिव वर्कफ़्लो को macOS के साथ सहजता से एकीकृत रखते हैं। API अडैप्टर Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, और Google Keep v1 का उपयोग करते हैं। Things और OmniFocus अडैप्टर भी इसमें शामिल हैं। होस्ट किए गए परीक्षण एक स्थानीय HTTPS फ़िक्स्चर के विरुद्ध API अडैप्टर को सत्यापित करते हैं; लाइव संगतता के लिए अभी भी समर्पित प्रदाता खातों की आवश्यकता होती है।

## आप क्या कर सकते हैं

- **ऐप्स बदले बिना कैप्चर करें।** कार्य जोड़ने के लिए Automator Service, Alfred कीवर्ड या क्लिपबोर्ड का उपयोग करें। बैच कैप्चर प्रत्येक गैर-रिक्त पंक्ति के लिए एक रिमाइंडर बनाता है।
- **टेक्स्ट को संरचित कार्यों में बदलें।** नेटिव क्विक कैप्चर और Calendar कैप्चर द्वारा साझा किए जाने वाले प्रोडक्शन AppleScript पार्सर का उपयोग करके सापेक्ष और ISO दिनांक, समय, प्राथमिकताएँ, संदर्भ और प्रोजेक्ट पार्स करें।
- **ईवेंट कैप्चर करें और अपने इनबॉक्स की समीक्षा करें।** समय, अवधि और स्थान के साथ Calendar ईवेंट बनाएँ; Reminders में ब्रेन डंप के साथ पाँच-चरणीय साप्ताहिक समीक्षा चलाएँ।
- **समयबद्ध फ़ोकस सत्रों में कार्य करें।** विभिन्न प्रक्रियाओं में सत्र शुरू करें, उनकी स्थिति जाँचें और उन्हें रोकें। सत्र के स्वामित्व वाले launchd टाइमर समाप्ति और रद्दीकरण को संभालते हैं; JSONL लॉग अवधि विश्लेषण प्रदान करते हैं।
- **केवल कार्यों से अधिक के लिए Alfred का उपयोग करें।** प्रोजेक्ट के लिए Reminders सूचियाँ बनाएँ, संदर्भ नोट्स सहेजें, समीक्षा के लिए इनबॉक्स खोलें, क्लिपबोर्ड टेक्स्ट कैप्चर करें और टाइप-जाँची गई प्राथमिकताएँ संपादित करें।
- **मेनू बार से अपना इनबॉक्स देखें।** वैकल्पिक SwiftBar/xbar प्लगइन अधूरे इनबॉक्स आइटम की संख्या दिखाता है और कैप्चर वर्कफ़्लो से लिंक करता है।

नेटिव व्यवहार की जाँच वास्तविक GitHub-होस्टेड Mac पर की जाती है: परीक्षण Automator डायलॉग संचालित करते हैं, फिर Reminders और Calendar रिकॉर्ड वापस पढ़ते हैं। उस प्रमाण के दायरे के लिए [परीक्षण और संगतता](#testing-and-compatibility) देखें।

## त्वरित प्रारंभ: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

कैप्चर आज़माने के लिए वर्कफ़्लो को Automator में खोलें और चलाएँ। इसे Service के रूप में उपलब्ध कराने के लिए, बंडल को `~/Library/Services` के अंतर्गत इंस्टॉल करें:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

**System Settings → Keyboard → Keyboard Shortcuts → Services** में एक शॉर्टकट असाइन करें। जब macOS पूछे, तब Reminders के लिए Automation एक्सेस की अनुमति दें। दर्ज करें:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

नेटिव वर्कफ़्लो कल की नियत तिथि वाला एक उच्च-प्राथमिकता रिमाइंडर बनाता है, उसे `shopping` सूची में रूट करता है और संदर्भ रिकॉर्ड करता है। प्रोजेक्ट या संदर्भ मार्कर के बिना, क्विक कैप्चर `Inbox` का उपयोग करता है।

## कैप्चर सिंटैक्स

नेटिव कार्य पार्सर और Alfred कार्य कैप्चर इन मार्करों को पहचानते हैं। प्रदाता अडैप्टरों का अपना फ़ील्ड और रूटिंग समर्थन होता है।

| इनपुट | अर्थ | उदाहरण |
| --- | --- | --- |
| `!1`, `!2`, `!3` | उच्च, मध्यम या निम्न प्राथमिकता | `Fix login !1` |
| `today`, `tomorrow`, `next week` | सापेक्ष नियत दिनांक | `Call dentist tomorrow` |
| सप्ताह का दिन या `next weekday` | सप्ताह के दिन की नियत दिनांक | `Send report next monday` |
| `due:YYYY-MM-DD` | स्पष्ट नियत दिनांक | `Renew membership due:2027-03-15` |
| दिनांक के साथ समय | नियत समय | `Call Alex tomorrow at 3pm` |
| `@context` | संदर्भ मार्कर | `Buy milk @errands` |
| `+project` | प्रोजेक्ट/सूची रूटिंग | `Draft outline +website` |

`due:today` और `due:tomorrow` भी स्वीकार किए जाते हैं। संदर्भ और प्रोजेक्ट मार्करों में अक्षरों, अंकों, अंडरस्कोर या हाइफ़न का उपयोग करें। नेटिव क्विक कैप्चर संदर्भ रूटिंग की तुलना में प्रोजेक्ट रूटिंग को प्राथमिकता देता है।

Calendar कैप्चर ईवेंट स्थान के लिए `@` का उपयोग करता है और मिनटों या घंटों में अवधि स्वीकार करता है:

```text
Planning tomorrow 2pm 45m @Conference Room
```

स्पष्ट समय या अवधि के बिना, Calendar कैप्चर पहले लिखने योग्य कैलेंडर में सुबह 9:00 बजे और एक घंटे की अवधि का उपयोग करता है।

## वर्कफ़्लो चुनें

### नेटिव Apple वर्कफ़्लो

| वर्कफ़्लो | व्यवहार | बंडल |
| --- | --- | --- |
| क्विक कैप्चर | कार्य टेक्स्ट पार्स करें और रिमाइंडर बनाएँ | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| क्लिपबोर्ड कैप्चर | क्लिपबोर्ड टेक्स्ट से रिमाइंडर बनाएँ | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| बैच कैप्चर | एकाधिक पंक्तियों से रिमाइंडर बनाएँ | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| ईवेंट कैप्चर | एक Calendar ईवेंट बनाएँ | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| साप्ताहिक समीक्षा | निर्देशित समीक्षा और रिमाइंडर ब्रेन डंप | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

इसे आज़माने के लिए Automator में बंडल खोलें, या कीबोर्ड एक्सेस के लिए इसे `~/Library/Services` के अंतर्गत इंस्टॉल करें। Reminders और Calendar को उपयुक्त macOS Automation अनुमतियों की आवश्यकता होती है।

### Alfred

Powerpack के साथ Alfred आवश्यक है। वर्तमान स्रोत से पैकेज बनाएँ:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

आप [रिलीज़](https://github.com/somethingwithproof/MacGTD/releases) से भी पैकेज डाउनलोड कर सकते हैं। रिलीज़ पैकेज अपने टैग किए गए स्रोत को दर्शाते हैं; रिलीज़ के बाद `main` में जोड़ी गई सुविधाओं के लिए स्रोत बिल्ड की आवश्यकता होती है।

| कीवर्ड | क्रिया |
| --- | --- |
| `task` | दिनांक, संदर्भ, प्रोजेक्ट और प्राथमिकता पार्सिंग के साथ कार्य कैप्चर करें |
| `note` | Reminders में एक संदर्भ नोट सहेजें |
| `project` | एक Reminders सूची बनाएँ |
| `gtd process` | मानवीय समीक्षा के लिए Inbox खोलें |
| `clip` | क्लिपबोर्ड टेक्स्ट कैप्चर करें |
| `gtd focus` | फ़ोकस सत्र शुरू करें, स्थिति जाँचें या रोकें |
| `gtd analytics` | रिकॉर्ड की गई फ़ोकस अवधियों की जाँच करें |
| `gtd preferences` | वर्कफ़्लो प्राथमिकताएँ संपादित करें |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

प्राथमिकताएँ `~/Library/Preferences/com.alfredgtd.plist` में रहती हैं; फ़ोकस स्थिति और लॉग `~/.gtd` के अंतर्गत रहते हैं। प्राथमिकताओं में अंतर्निहित डिफ़ॉल्ट, प्रकार जाँच, मान्य आयात और एटॉमिक राइट्स शामिल हैं। फ़ोकस सत्र सिस्टम अधिसूचना सेटिंग्स को नहीं बदलते हैं। इनबॉक्स प्रोसेसिंग समीक्षा के लिए सूची खोलती है; यह कार्यों को स्वचालित रूप से स्थानांतरित या पूर्ण नहीं करती है।

[Alfred मार्गदर्शिका](../../../workflows/alfred/README.md) और [GTDLib लाइब्रेरी दस्तावेज़ीकरण](../../../workflows/alfred/GTDLib.scptd/README.md) देखें।

### बाहरी कैप्चर अडैप्टर

होस्ट किए गए E2E में चारों API कैप्चर वर्कफ़्लो को वास्तविक Automator डायलॉग और एक स्थानीय TLS फ़िक्स्चर के माध्यम से परखा जाता है। जब समर्पित खाते कॉन्फ़िगर किए जाते हैं, तो एक अलग मैनुअल सूट वास्तविक विक्रेता पर्सिस्टेंस का परीक्षण करता है। Things और OmniFocus के लिए लाइसेंस प्राप्त डेस्कटॉप एकीकरण सूट की आवश्यकता होती है।

| लक्ष्य | तंत्र | सेटअप / स्रोत |
| --- | --- | --- |
| Todoist | API कैप्चर | [वर्कफ़्लो और Keychain सेटअप](../../../workflows/todoist/) |
| Notion | डेटा स्रोत API कैप्चर | [वर्कफ़्लो और Keychain सेटअप](../../../workflows/notion/) |
| Things 3 | URL स्कीम | [वर्कफ़्लो](../../../workflows/things/) |
| OmniFocus | AppleScript / URL स्कीम | [वर्कफ़्लो](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [वर्कफ़्लो](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [वर्कफ़्लो](../../../workflows/google/) |

API अडैप्टरों के लिए क्रेडेंशियल सेटअप की आवश्यकता होती है; Microsoft को डेलिगेटेड OAuth प्राधिकरण की आवश्यकता होती है और Google Keep को पात्र Workspace एक्सेस की आवश्यकता होती है:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[API सेटअप, माइग्रेशन और प्राधिकरण आवश्यकताएँ](../../../workflows/api/README.md) देखें। मौजूदा Notion डेटाबेस ID तभी माइग्रेट होती हैं जब ठीक एक डेटा स्रोत मिलता है। Microsoft और Google कैप्चर अनडॉक्यूमेंटेड ब्राउज़र शॉर्टकट के बजाय API का उपयोग करते हैं। OAuth एक्सेस टोकन को आपके OAuth क्लाइंट के माध्यम से नवीनीकृत करने की आवश्यकता होती है। पेलोड स्पष्ट JSON कुंजियों, सीमित HTTPS अनुरोधों और प्रतिक्रिया पुष्टि का उपयोग करते हैं। त्रुटि संदेश कॉन्फ़िगर किए गए API टोकन को छिपाते हुए विफलता विवरण बनाए रखते हैं। सुरक्षा समस्याओं की रिपोर्ट करने के लिए [SECURITY.md](../../../SECURITY.md) देखें।

### मेनू बार और Shortcuts

[मेनू बार मार्गदर्शिका](../../../workflows/menubar/README.md) वैकल्पिक SwiftBar/xbar प्लगइन को कवर करती है। पहले Apple Services इंस्टॉल करें, फिर अपने मेनू बार ऐप में प्लगइन निर्देशिका कॉन्फ़िगर करें और उसमें `workflows/menubar/gtd-menubar.sh` को लिंक करें।

[Shortcuts मार्गदर्शिका](../../../workflows/shortcuts/README.md) macOS 12+ पर टेक्स्ट, क्लिपबोर्ड और Siri कैप्चर के लिए मैनुअल सेटअप प्रदान करती है। Shortcuts और Siri वॉइस सक्रियण होस्ट किए गए परीक्षण सूट के दायरे से बाहर हैं।

## आर्किटेक्चर

Automator बंडल AppleScript को एम्बेड करते हैं ताकि वे नेटिव Services के रूप में चल सकें। Alfred क्रिया स्क्रिप्ट को पैकेज करता है और उपयोगकर्ता इनपुट को आर्ग्यूमेंट के रूप में पास करता है। GTDLib संपादन योग्य AppleScript स्रोत और एक संकलित स्क्रिप्ट बंडल से साझा नेटिव Reminders संचालन उपलब्ध कराता है।

- **एक प्रोडक्शन पार्सर:** `scripts/sync-native-parser.py` साझा पार्सर को Quick Capture और Event Capture में एम्बेड करता है; सत्यापन स्रोत विचलन का पता लगाता है।
- **स्थायी फ़ोकस स्थिति:** अलग-अलग इनवोकेशन स्वामित्व वाले launchd जॉब्स और सीमित व्यतीत-समय गणना के साथ सत्र स्थिति साझा करते हैं।
- **पुनरुत्पादनीय पैकेज:** पैकेजिंग एक नया आर्काइव बनाती है, और परीक्षण उसकी सामग्री की तुलना स्रोत से करते हैं। लाइब्रेरी के पास एक अलग संकलन स्क्रिप्ट है।
- **अवलोकनीय परीक्षण:** GitHub Actions में JUnit रिपोर्ट, कमांड लॉग और परीक्षित बिल्ड आर्टिफैक्ट 14 दिनों के लिए सुरक्षित रखे जाते हैं।

| निर्देशिका | उत्तरदायित्व |
| --- | --- |
| [`workflows/`](../../../workflows/) | नेटिव बंडल, प्रदाता अडैप्टर, Alfred, Shortcuts और मेनू बार स्क्रिप्ट |
| [`scripts/`](../../../scripts/) | पैकेजिंग, लाइब्रेरी संकलन, पार्सर सिंक्रनाइज़ेशन और होस्ट किए गए परीक्षण की व्यवस्था |
| [`tests/`](../../../tests/) | सत्यापन, घटक जाँच और नेटिव डेस्कटॉप E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, रात्रिकालीन/मैनुअल E2E और रिपॉजिटरी रखरखाव |
| [`infra/`](../../../infra/) | वैकल्पिक स्थानीय और EC2 Mac रनर सेटअप; होस्ट किए गए CI को इसकी आवश्यकता नहीं है |

<a name="testing-and-compatibility"></a>

## परीक्षण और संगतता

| दायरा | परिवेश | क्या जाँचा जाता है |
| --- | --- | --- |
| सत्यापन | GitHub-होस्टेड macOS 15 और 26 | AppleScript संकलन, बंडल, प्रोडक्शन पार्सर, क्रिया लक्ष्य, प्राथमिकताएँ, फ़ोकस स्थिति, फ़िक्स्चर API ट्रांसपोर्ट और पैकेज राउंड ट्रिप |
| सुरक्षा जाँच | GitHub-होस्टेड Ubuntu और macOS 15 | संकलित प्रोडक्शन पार्सर की Python CodeQL, ShellCheck और सीमित Atheris फ़ज़िंग |
| प्रदाता अडैप्टर E2E | GitHub-होस्टेड `macos-15-intel` | चारों प्रोडक्शन API डायलॉग, TLS ट्रांसपोर्ट, फ़िक्स्चर पर्सिस्टेंस/रीडबैक, API विफलताएँ, रद्दीकरण और Notion स्रोत चयन |
| लाइव प्रदाता E2E | समर्पित सीक्रेट्स के साथ मैनुअल GitHub-होस्टेड Mac रन | वास्तविक Todoist, Notion, Microsoft और Google कैप्चर तथा विक्रेता रीडबैक; खाते न होने पर विफल होता है |
| लाइसेंस प्राप्त डेस्कटॉप एकीकरण | समर्पित स्थानीय खाता | Things 3, OmniFocus 4 और Alfred UI इनवोकेशन तथा पर्सिस्टेंस |
| नेटिव डेस्कटॉप E2E | GitHub-होस्टेड `macos-15-intel` | वास्तविक Automator डायलॉग; पर्सिस्टेड Reminders और Calendar डेटा; साप्ताहिक समीक्षा; मेनू गणना; संकलित GTDLib; पैकेज्ड Alfred नेटिव क्रियाएँ; वास्तविक launchd टाइमर समाप्ति और रद्दीकरण |
| वैकल्पिक Alfred UI | समर्पित स्थानीय खाता, Alfred 5 + Powerpack | लाइसेंस प्राप्त UI के माध्यम से वर्कफ़्लो आयात, कीवर्ड इनवोकेशन और रिमाइंडर रीडबैक |

[सत्यापित API आधुनिकीकरण रन](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ने बिना किसी विफलता, त्रुटि या स्किप के **प्रत्येक सत्यापन प्लेटफ़ॉर्म पर 35 सत्यापन परीक्षण और 26 डेस्कटॉप E2E परीक्षण** उत्तीर्ण किए। डेस्कटॉप कवरेज में 15 नेटिव परीक्षण और 11 प्रदाता अडैप्टर परीक्षण शामिल हैं, जिनमें वास्तविक ट्रांसपोर्ट टाइमआउट और अस्थायी Keychain जाँच शामिल हैं। सत्यापन रिपॉजिटरी संरचना जाँच भी चलाता है। ये परिणाम नेटिव व्यवहार और प्रदाता फ़िक्स्चर को कवर करते हैं; ये लाइव विक्रेता या लाइसेंस प्राप्त ऐप की संगतता स्थापित नहीं करते हैं। वर्तमान स्थिति ऊपर दिए गए बैज द्वारा दर्शाई गई है।

`main` पर पुल अनुरोध और पुश पहले सत्यापन और उसके बाद नेटिव E2E चलाते हैं। E2E वर्कफ़्लो रात्रिकालीन और मैनुअल डिस्पैच पर भी चलता है, जिसमें नियतात्मक प्रदाता अडैप्टर परीक्षण शामिल हैं। लाइव विक्रेता परीक्षण अलग मैनुअल `live-e2e.yml` वर्कफ़्लो का उपयोग करते हैं। डिफ़ॉल्ट CI डिस्पोज़ेबल GitHub-होस्टेड Mac, पृथक फ़िक्स्चर और सीमित उप-प्रक्रियाओं का उपयोग करता है; डिफ़ॉल्ट सूट के लिए किसी सेल्फ़-होस्टेड रनर या बाहरी खाता क्रेडेंशियल की आवश्यकता नहीं है। मैनुअल लाइव सूट के लिए समर्पित प्रदाता सीक्रेट्स की आवश्यकता होती है।

वर्तमान CI द्वारा पुराने macOS संस्करणों का सत्यापन नहीं किया जाता है। लाइव प्रदाता रन के लिए समर्पित सीक्रेट्स की आवश्यकता होती है और अभी तक उनका सत्यापन नहीं किया गया है। Shortcuts/Siri और लाइसेंस प्राप्त डेस्कटॉप ऐप्स डिफ़ॉल्ट होस्ट किए गए सूट से बाहर हैं। नेटिव क्रिया परीक्षण पैकेज की गई Alfred स्क्रिप्ट को सीधे चलाकर परखते हैं; वे पूर्ण Alfred UI संगतता स्थापित नहीं करते हैं। [परीक्षण सेटअप, पूर्वापेक्षाएँ और कवरेज](../../../tests/e2e/README.md) देखें।

## स्थानीयकरण

उपयोगकर्ता-सम्मुख CLI, परीक्षण रनर और मेनू बार स्ट्रिंग्स बिना किसी तृतीय-पक्ष निर्भरता के `scripts/i18n.py` के माध्यम से `locales/` के अंतर्गत 45 लोकेल (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) में उपलब्ध हैं। लोकेल रिज़ॉल्यूशन पहले `--lang`, फिर `LC_ALL`, `LC_MESSAGES` और `LANG` की जाँच करता है, और अंत में `en` पर फ़ॉलबैक करता है।

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## विकास

[mise](https://mise.jdx.dev/) इंस्टॉल करें और `.mise.toml` में पिन किए गए Python संस्करण का उपयोग करें:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

सत्यापन `test-results/` के अंतर्गत रिपोर्ट लिखता है; बिल्ड स्क्रिप्ट `dist/` में लिखती हैं। `main` पर होस्ट किया गया डेस्कटॉप सूट चलाने के लिए:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

स्थानीय डेस्कटॉप E2E के लिए एक समर्पित लॉग-इन परीक्षण खाते और [E2E मार्गदर्शिका](../../../tests/e2e/README.md) में वर्णित अनुमतियों की आवश्यकता होती है। होस्ट की गई अनुमति-प्रावधान स्क्रिप्ट डिस्पोज़ेबल GitHub-होस्टेड जॉब्स तक सीमित है।

[Conventional Commits](https://www.conventionalcommits.org/) का उपयोग करें और [CONTRIBUTING.md](../../../CONTRIBUTING.md) का पालन करें। हाल के परिवर्तन [CHANGELOG.md](../../../CHANGELOG.md) में दर्ज हैं।

सुरक्षा नियंत्रण, रिलीज़ हस्ताक्षर सत्यापन और शेष Scorecard सीमाएँ [सुरक्षा मूल्यांकन](../../../docs/security-assessment.md) में प्रलेखित हैं। रिलीज़ वर्कफ़्लो ड्राफ़्ट रिलीज़ बनाने से पहले पैकेज बनाता और प्रमाणित करता है, जिसमें स्रोत कमिट और ref के विरुद्ध सत्यापित हस्ताक्षरित in-toto प्रोवेनेंस और Sigstore बंडल शामिल हैं। नया प्रोवेनेंस केवल उन वर्कफ़्लो बिल्ड पर लागू होता है, पुराने डाउनलोड पर नहीं।

## परियोजना इतिहास और लाइसेंस

MacGTD पूर्व की MacGTD-Native, MacGTD-Microsoft, MacGTD-Google और AlfredGTD रिपॉजिटरी को समेकित करता है। यह [MIT License](../../../LICENSE) के अंतर्गत लाइसेंस प्राप्त है।
