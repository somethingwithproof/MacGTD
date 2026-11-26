# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · **Soomaali** · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD waa ururin hab-shaqooyin macOS ah oo loogu talagalay diiwaangelinta hawlaha, habaynta xasuusiyeyaasha, iyo socodsiinta fadhiyo diirad-saar oo waqtiyaysan iyadoo la adeegsanayo barnaamijyada aad hore u isticmaasho.**

Waxaa lagu dhisay habka [Getting Things Done](https://gettingthingsdone.com/), isagoo ku soo kordhinaya Apple Reminders diiwaangelin daaqad-wadahadal, clipboard, iyo mid wadareed; Calendar diiwaangelin dhacdooyin; iyo Alfred amarrada hawlaha, qoraallada, mashaariicda, iyo diirad-saarka. AppleScript iyo Automator ayaa hab-shaqooyinka gudaha ah ku haya inay si dhow ula jaanqaadaan macOS. Ku-xireyaasha API waxay adeegsadaan Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, iyo Google Keep v1. Ku-xireyaasha Things iyo OmniFocus iyaguna waa ku jiraan. Tijaabooyinka martigashan waxay ku-xireyaasha API ku xaqiijiyaan adeeg-tijaabo HTTPS oo maxalli ah; la-jaanqaadka tooska ah wuxuu weli u baahan yahay akoonno gaar u ah adeeg-bixiyeyaasha.

## Waxa aad samayn karto

- **Diiwaangeli adigoon barnaamijyada ka bixin.** Isticmaal Automator Service, eray-fure Alfred, ama clipboard si aad hawl ugu darto. Diiwaangelinta wadareed waxay xariiq kasta oo aan bannaanayn u samaysaa hal xasuusiye.
- **Qoraalka u beddel hawlo habaysan.** Falanqee taariikhaha is-barbardhigga ah iyo kuwa ISO, waqtiyada, mudnaanta, xaaladaha, iyo mashaariicda adigoo adeegsanaya falanqeeyaha AppleScript ee wax-soo-saarka ee ay wadaagaan diiwaangelinta degdegga ah ee gudaha iyo diiwaangelinta Calendar.
- **Diiwaangeli dhacdooyin oo dib u eeg sanduuqaaga (inbox).** Samee dhacdooyin Calendar oo leh waqti, muddo, iyo goob; socodsii dib-u-eegis toddobaadle ah oo shan tallaabo ka kooban lehna xog-shubis (brain dump) ku dhacda Reminders.
- **Ku shaqee fadhiyo diirad-saar oo waqtiyaysan.** Bilow, baar, oo jooji fadhiyada hannaanada kala duwan dhexdeeda. Saacadaha launchd ee fadhigu leeyahay ayaa maamula dhammaadka iyo joojinta; diiwaannada JSONL waxay bixiyaan falanqaynta muddada.
- **Alfred u adeegso wax ka badan hawlo.** U samee liisas Reminders ah mashaariicda, kaydi qoraallo tixraac ah, fur sanduuqa si dib loogu eego, diiwaangeli qoraalka clipboard, oo wax ka beddel dookhyada leh nooc-xog sugan.
- **Ka arag sanduuqaaga barta menu-ga.** Qalabka dheeraadka ah ee SwiftBar/xbar wuxuu muujiyaa tirada hawlaha aan dhammaan ee sanduuqa ku jira iyo xiriiriyeyaal u gudba hab-shaqooyinka diiwaangelinta.

Dhaqanka gudaha ah waxaa lagu hubiyaa kombiyuutarrada Mac ee dhabta ah ee uu martigeliyo GitHub: tijaabooyinku waxay maamulaan daaqadaha wadahadalka ee Automator, ka dibna dib ayay u akhriyaan diiwaannada Reminders iyo Calendar. Eeg [tijaabinta iyo la-jaanqaadka](#testing-and-compatibility) si aad u ogaato baaxadda caddayntaas.

## Bilow degdeg ah: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Ku fur hab-shaqada barnaamijka Automator oo socodsii si aad u tijaabiso diiwaangelinta. Si aad uga dhigto Service la heli karo, ku rakib xirmada galka `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

U qoondee furaha degdegga ah gudaha **System Settings → Keyboard → Keyboard Shortcuts → Services**. U oggolow Automation inuu galo Reminders marka macOS ku weydiiyo. Geli:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Hab-shaqada gudaha ahi waxay abuurtaa xasuusiye mudnaan sare leh oo waqtigiisu ku eg yahay berri, waxay u weecisaa liiska `shopping`, waxayna diiwaangelisaa xaaladda. Haddii aanay jirin calaamad mashruuc ama xaalad, diiwaangelinta degdegga ahi waxay adeegsataa `Inbox`.

## Qaab-qoraalka diiwaangelinta

Falanqeeyaha hawlaha ee gudaha iyo diiwaangelinta hawlaha ee Alfred waxay aqoonsadaan calaamadahan. Ku-xireyaasha adeeg-bixiyeyaashu waxay leeyihiin taageero u gaar ah oo xog-goobaha iyo u-weecinta ah.

| Gelinta | Macnaha | Tusaale |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Mudnaan sare, dhexe, ama hoose | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Taariikhda qabashada ee is-barbardhigga ah | `Call dentist tomorrow` |
| Maalin toddobaad ama `next weekday` | Taariikhda qabashada ee maalinta toddobaadka | `Send report next monday` |
| `due:YYYY-MM-DD` | Taariikhda qabashada ee cad | `Renew membership due:2027-03-15` |
| Waqti la socda taariikh | Waqtiga qabashada | `Call Alex tomorrow at 3pm` |
| `@context` | Calaamadda xaaladda | `Buy milk @errands` |
| `+project` | U-weecinta mashruuca/liiska | `Draft outline +website` |

`due:today` iyo `due:tomorrow` iyaguna waa la aqbalaa. Ku isticmaal xarfo, tirooyin, xariiqo hoose (underscores), ama xariiqo dhex-joog ah (hyphens) calaamadaha xaaladda iyo mashruuca. Diiwaangelinta degdegga ah ee guduhu waxay mudnaan siisaa u-weecinta mashruuca iyadoo ka horreysiinaysa u-weecinta xaaladda.

Diiwaangelinta Calendar waxay `@` u adeegsataa goobta dhacdada waxayna aqbashaa muddo daqiiqado ama saacado ah:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Haddii aan la sheegin waqti ama muddo cad, diiwaangelinta Calendar waxay adeegsataa 9:00 subaxnimo iyo hal saac, iyadoo ku kaydinaysa kalandarka ugu horreeya ee wax lagu qori karo.

## Dooro hab-shaqo

### Hab-shaqooyinka rasmiga ah ee Apple

| Hab-shaqada | Dhaqanka | Xirmada |
| --- | --- | --- |
| Diiwaangelin degdeg ah | Falanqee qoraalka hawsha oo abuur xasuusiye | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Diiwaangelinta clipboard | Ka abuur xasuusiye qoraalka clipboard | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Diiwaangelin wadareed | Ka abuur xasuusiyeyaal xariiqo badan | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Diiwaangelinta dhacdooyinka | Abuur dhacdo Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Dib-u-eegis toddobaadle ah | Dib-u-eegis la hagayo iyo xog-shubis xasuusiyeyaal ah | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Ku fur xirmo gudaha Automator si aad u tijaabiso, ama ku rakib galka `~/Library/Services` si aad uga gasho kiiboodka. Reminders iyo Calendar waxay u baahan yihiin oggolaanshaha ku habboon ee macOS Automation.

### Alfred

Waxaa loo baahan yahay Alfred leh Powerpack. Ka dhis xirmada koodka isha ee hadda jira:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Waxaad sidoo kale ka soo dejisan kartaa xirmada bogga [siideynta](https://github.com/somethingwithproof/MacGTD/releases). Xirmooyinka la sii daayay waxay ka tarjumayaan isha loo calaamadeeyay; astaamaha lagu daro `main` ka dib siideyn waxay u baahan yihiin in laga dhiso isha.

| Eray-fure | Fal |
| --- | --- |
| `task` | Diiwaangeli hawl leh falanqaynta taariikhda, xaaladda, mashruuca, iyo mudnaanta |
| `note` | Ku kaydi qoraal tixraac ah Reminders |
| `project` | Abuur liis Reminders ah |
| `gtd process` | Fur Inbox si qof ahaan dib loogu eego |
| `clip` | Diiwaangeli qoraalka clipboard |
| `gtd focus` | Bilow fadhi diirad-saar, baar xaaladda, ama jooji |
| `gtd analytics` | Baar muddooyinka diirad-saarka ee la diiwaangeliyay |
| `gtd preferences` | Wax ka beddel dookhyada hab-shaqada |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Dookhyadu waxay ku jiraan `~/Library/Preferences/com.alfredgtd.plist`; xaaladda diirad-saarka iyo diiwaannaduna waxay ku hoos jiraan `~/.gtd`. Dookhyadu waxay leeyihiin qiimayaal aasaasi ah oo ku dhex dhisan, hubinta noocyada xogta, soo-dejinta la xaqiijiyay, iyo qoraallo hal-mar ah (atomic writes). Fadhiyada diirad-saarku ma beddelaan dejinta ogeysiisyada nidaamka. Habaynta sanduuqa (Inbox) waxay furtaa liiska si dib loogu eego; si toos ah uma rarto mana dhammaystirto hawlaha.

Eeg [tilmaamaha Alfred](../../../workflows/alfred/README.md) iyo [dukumentiyada maktabadda GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Ku-xireyaasha diiwaangelinta dibadda

Dhammaan afarta hab-shaqo ee diiwaangelinta API waxaa lagu tijaabiyaa daaqadaha wadahadalka ee dhabta ah ee Automator iyo adeeg-tijaabo TLS oo maxalli ah gudaha E2E martigashan. Qayb tijaabo ah oo gacanta lagu socodsiiyo oo gooni ah ayaa tijaabisa kaydinta dhabta ah ee adeeg-bixiyaha marka la habeeyo akoonno gaar ah. Things iyo OmniFocus waxay u baahan yihiin qaybta is-dhexgalka desktop ee shatiga leh.

| Bartilmaameedka | Habka | Habaynta / isha |
| --- | --- | --- |
| Todoist | Diiwaangelin API | [Habaynta hab-shaqada iyo Keychain](../../../workflows/todoist/) |
| Notion | Diiwaangelin API il-xogeed | [Habaynta hab-shaqada iyo Keychain](../../../workflows/notion/) |
| Things 3 | Nidaamka URL | [Hab-shaqada](../../../workflows/things/) |
| OmniFocus | AppleScript / Nidaamka URL | [Hab-shaqada](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Hab-shaqada](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Hab-shaqada](../../../workflows/google/) |

Ku-xireyaasha API waxay u baahan yihiin dejinta aqoonsiga gelitaanka; Microsoft wuxuu u baahan yahay oggolaansho OAuth oo loo wakiishay halka Google Keep uu u baahan yahay marin Workspace oo u qalma:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Eeg [shuruudaha habaynta API, u-guurista, iyo oggolaanshaha](../../../workflows/api/README.md). Aqoonsiyada database ee Notion ee jira waxay guuraan oo keliya marka la helo hal il-xogeed oo sax ah. Diiwaangelinta Microsoft iyo Google waxay adeegsadaan API halkii ay ka adeegsan lahaayeen furayaal degdeg ah oo biraawsar oo aan la diiwaangelin. Calaamadaha gelitaanka (access tokens) ee OAuth waxay u baahan yihiin cusboonaysiin iyada oo loo marayo macmiilkaaga OAuth. Xirmooyinka xogtu waxay adeegsadaan furayaal JSON oo cad, codsiyo HTTPS oo xaddidan, iyo xaqiijinta jawaabta. Farriimaha khaladka waxay hayaan faahfaahinta fashilka iyadoo la qarinayo calaamadda API ee la habeeyay. Eeg [SECURITY.md](../../../SECURITY.md) si aad u soo sheegto arrimaha amniga.

### Barta menu-ga iyo Shortcuts

[Tilmaamaha barta menu-ga](../../../workflows/menubar/README.md) waxay daboolayaan qalabka dheeraadka ah ee SwiftBar/xbar. Marka hore rakib Apple Services, ka dibna ku habeey galka qalabka dheeraadka ah barnaamijka barta menu-gaaga oo ku xir `workflows/menubar/gtd-menubar.sh`.

[Tilmaamaha Shortcuts](../../../workflows/shortcuts/README.md) waxay bixiyaan habayn gacan ah oo loogu talagalay diiwaangelinta qoraalka, clipboard, iyo Siri ee macOS 12+. Shortcuts iyo hawlgelinta codka Siri waxay ka baxsan yihiin qaybta tijaabada ee martigashan.

## Qaab-dhismeedka

Xirmooyinka Automator waxay ku dhex daraan AppleScript si ay ugu shaqeeyaan sida Services gudaha ah. Alfred wuxuu xirmo u sameeyaa qoraallada falka (action scripts) wuxuuna gelinta isticmaalaha u gudbiyaa sidii qiimayaal gelin ah (arguments). GTDLib waxay bixisaa hawlgallada la wadaago ee Reminders gudaha ah iyadoo laga helayo isha AppleScript ee la tafatiri karo iyo xirmo qoraal-amar ah oo la isku dubbariday.

- **Hal falanqeeye wax-soo-saar:** `scripts/sync-native-parser.py` wuxuu ku dhex daraa falanqeeyaha la wadaago gudaha Quick Capture iyo Event Capture; xaqiijintu waxay ogaataa kala-leexashada isha.
- **Xaalad diirad-saar oo waaraysa:** wicitaannada kala duwani waxay wadaagaan xaaladda fadhiga, iyagoo leh hawlo launchd oo ay leeyihiin iyo xisaabinta waqtiga dhaafay oo xaddidan.
- **Xirmooyin dib loo soo saari karo:** xirmo-samayntu waxay dhisaysaa kayd cusub, tijaabooyinkuna waxay isbarbardhigaan waxa ku jira iyo isha. Maktabaddu waxay leedahay qoraal-amar isku-dubbarid oo u gaar ah.
- **Tijaabooyin la kormeeri karo:** warbixinnada JUnit, diiwaannada amarrada, iyo wax-soo-saarka dhismaha ee la tijaabiyay waxaa lagu hayaa 14 maalmood gudaha GitHub Actions.

| Galka | Mas'uuliyadda |
| --- | --- |
| [`workflows/`](../../../workflows/) | Xirmooyinka gudaha, ku-xireyaasha adeeg-bixiyeyaasha, Alfred, Shortcuts, iyo qoraallada barta menu-ga |
| [`scripts/`](../../../scripts/) | Xirmo-samaynta, isku-dubbaridka maktabadda, isku-waafajinta falanqeeyaha, iyo diyaarinta tijaabada martigashan |
| [`tests/`](../../../tests/) | Xaqiijinta, hubinta qaybaha, iyo E2E desktop ee gudaha |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E habeenle/gacan ah, iyo dayactirka kaydka |
| [`infra/`](../../../infra/) | Habaynta ikhtiyaariga ah ee Mac runner maxalli iyo EC2 ah; CI martigashan uma baahna |

## Tijaabinta iyo la-jaanqaadka

| Baaxadda | Deegaanka | Waxa la hubiyo |
| --- | --- | --- |
| Xaqiijinta | macOS 15 iyo 26 oo uu martigeliyo GitHub | Isku-dubbaridka AppleScript, xirmooyinka, falanqeeyaha wax-soo-saarka, bartilmaameedyada falka, dookhyada, xaaladda diirad-saarka, gudbinta adeeg-tijaabada API, iyo wareegyada dhammaystiran ee xirmooyinka |
| Hubinta amniga | Ubuntu iyo macOS 15 oo uu martigeliyo GitHub | Python CodeQL, ShellCheck, iyo tijaabinta fuzzing ee Atheris oo xaddidan ee falanqeeyaha wax-soo-saarka ee la isku dubbariday |
| E2E ku-xireyaasha adeeg-bixiyaha | `macos-15-intel` oo uu martigeliyo GitHub | Dhammaan afarta daaqadood ee wadahadalka API ee wax-soo-saarka, gudbinta TLS, kaydinta/dib-u-akhrinta adeeg-tijaabada, fashilka API, joojinta, iyo doorashada isha Notion |
| E2E tooska ah ee adeeg-bixiyaha | Socodsiin gacan ah oo Mac uu martigeliyo GitHub lehna siraha gaarka ah | Diiwaangelinta dhabta ah ee Todoist, Notion, Microsoft, iyo Google iyo dib-u-akhrinta adeeg-bixiyaha; wuu fashilmaa haddii akoonnadu maqan yihiin |
| Is-dhexgalka desktop ee shatiga leh | Akoon maxalli ah oo gaar ah | Wicitaanka iyo kaydinta Things 3, OmniFocus 4, iyo UI-ga Alfred |
| E2E desktop ee gudaha | `macos-15-intel` oo uu martigeliyo GitHub | Daaqadaha wadahadalka ee dhabta ah ee Automator; xogta kaydsan ee Reminders iyo Calendar; dib-u-eegista toddobaadlaha ah; tirada menu-ga; GTDLib la isku dubbariday; falalka gudaha ee Alfred ee xirmaysan; dhammaadka iyo joojinta dhabta ah ee saacadda launchd |
| UI-ga Alfred ee ikhtiyaariga ah | Akoon maxalli ah oo gaar ah, Alfred 5 + Powerpack | Soo-dejinta hab-shaqada, ku-wicitaanka eray-furaha, iyo dib-u-akhrinta xasuusiyaha iyadoo loo marayo UI-ga shatiga leh |

[Socodsiinta la xaqiijiyay ee casriyeynta API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) waxay ku guulaysatay **35 tijaabo oo xaqiijin ah madal kasta oo xaqiijin ah iyo 26 tijaabo oo desktop E2E ah**, iyadoo aanay jirin wax fashil ah, khalad ah, ama laga booday. Daboolidda desktop waxaa ku jira 15 tijaabo oo gudaha ah iyo 11 tijaabo oo ku-xireyaasha adeeg-bixiyaha ah, oo ay ku jiraan waqti-dhammaadka gudbinta dhabta ah iyo hubinta ku-meel-gaarka ah ee Keychain. Xaqiijintu waxay sidoo kale socodsiisaa hubinta qaab-dhismeedka kaydka. Natiijooyinkani waxay daboolayaan dhaqanka gudaha iyo adeeg-tijaabooyinka adeeg-bixiyaha; ma caddaynayaan la-jaanqaadka tooska ah ee adeeg-bixiyaha ama barnaamijyada shatiga leh. Xaaladda hadda jirta waxaa lagu muujiyay calaamadaha (badges) kore.

Pull requests iyo riixitaanka (pushes) ku socda `main` waxay socodsiiyaan xaqiijinta oo ay ku xigto E2E gudaha ah. Hab-shaqada E2E waxay sidoo kale socotaa habeen kasta iyo marka gacanta lagu diro, iyadoo ay ku jiraan tijaabooyinka la saadaalin karo ee ku-xireyaasha adeeg-bixiyaha. Tijaabooyinka tooska ah ee adeeg-bixiyuhu waxay adeegsadaan hab-shaqada gacanta ee goonida ah ee `live-e2e.yml`. CI-ga caadiga ahi wuxuu adeegsadaa kombiyuutarro Mac ah oo la tuuri karo oo uu martigeliyo GitHub, adeeg-tijaabooyin go'doonsan, iyo hannaan-hoosaadyo xaddidan; looma baahna runner aad adigu martigeliso ama aqoonsiyo akoon dibadda ah qaybta caadiga ah. Qaybta tooska ah ee gacanta lagu socodsiiyo waxay u baahan tahay siraha gaarka ah ee adeeg-bixiyaha.

Noocyadii hore ee macOS laguma xaqiijin CI-ga hadda jira. Socodsiinta tooska ah ee adeeg-bixiyuhu waxay u baahan tahay siraha gaarka ah welina lama xaqiijin. Shortcuts/Siri iyo barnaamijyada desktop ee shatiga leh waxay ka baxsan yihiin qaybta caadiga ah ee martigashan. Tijaabooyinka falka gudaha ahi waxay si toos ah u tijaabiyaan qoraallada xirmaysan ee Alfred; ma caddaynayaan la-jaanqaad buuxa oo UI-ga Alfred ah. Eeg [habaynta tijaabada, shuruudaha horudhaca ah, iyo daboolidda](../../../tests/e2e/README.md).

## Deegaamaynta luqadda

Qoraallada CLI ee u muuqda isticmaalaha, socodsiiyaha tijaabada, iyo barta menu-ga waxay ku yimaadaan 45 deegaan-luqadeed (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) oo ku hoos jira `locales/` iyadoo loo marayo `scripts/i18n.py` iyada oo aan lahayn wax ku-tiirsanaan dhinac saddexaad ah. Go'aaminta deegaan-luqadeedku waxay hubisaa `--lang`, ka dibna `LC_ALL`, `LC_MESSAGES`, iyo `LANG`, iyadoo ugu dambayn ku noqonaysa `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Horumarinta

Rakib [mise](https://mise.jdx.dev/) oo isticmaal nooca Python ee ku xiran `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Xaqiijintu waxay warbixinnada ku qortaa `test-results/`; qoraallada dhismuhu waxay wax ku qoraan `dist/`. Si aad ugu socodsiiso qaybta desktop ee martigashan laanta `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Desktop E2E ee maxalliga ahi wuxuu u baahan yahay akoon tijaabo oo gaar ah oo ku jira iyo oggolaanshaha lagu qeexay [tilmaamaha E2E](../../../tests/e2e/README.md). Qoraal-amarka diyaarinta oggolaanshaha ee martigashan wuxuu ku kooban yahay shaqooyinka la tuuri karo ee uu martigeliyo GitHub.

Isticmaal [Conventional Commits](https://www.conventionalcommits.org/) oo raac [CONTRIBUTING.md](../../../CONTRIBUTING.md). Isbeddelladii u dambeeyay waxay ku diiwaangashan yihiin [CHANGELOG.md](../../../CHANGELOG.md).

Xakamaynta amniga, xaqiijinta saxeexa siideynta, iyo xaddidaadaha haray ee Scorecard
waxay ku diiwaangashan yihiin [qiimaynta amniga](../../../docs/security-assessment.md).
Hab-shaqada siideyntu waxay dhisaysaa oo caddeysaa xirmooyinka ka hor inta aanay abuurin qabyo-qoraal siideyn ah,
oo ay ku jiraan caddaynta asalka in-toto ee saxeexan iyo xirmooyinka Sigstore ee lagu xaqiijiyay
commit-ka iyo ref-ka isha. Caddaynta asalka ee cusub waxay khusaysaa dhismayaashaas hab-shaqada, ma aha
soo-dejintii hore.

## Taariikhda mashruuca iyo shatiga

MacGTD wuxuu mideeyaa kaydadkii hore ee MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, iyo AlfredGTD. Waxaa lagu siiyay shatiga [MIT License](../../../LICENSE).
