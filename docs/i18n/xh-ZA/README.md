# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · **isiXhosa** · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**I-MacGTD yingqokelela yeenkqubo zomsebenzi ze-macOS zokubamba imisebenzi, ukucwangcisa izikhumbuzo, kunye nokuqhuba iiseshoni zokugxila ezinexesha elimisiweyo usebenzisa ii-app osele uzisebenzisa.**

Yakhelwe kumgaqo we-[Getting Things Done](https://gettingthingsdone.com/), izisa ukubamba ngebhokisi yencoko, i-clipboard, kunye nokubamba ngobuninzi kwi-Apple Reminders; ukubamba iziganeko kwi-Calendar; kunye nemiyalelo yemisebenzi, amanqaku, iiprojekthi, nokugxila kwi-Alfred. I-AppleScript kunye ne-Automator zigcina iinkqubo zomsebenzi zomthonyama zisondele kwi-macOS. Iiadaptha ze-API zisebenzisa i-Todoist API v1, i-Notion API 2026-03-11, i-Microsoft Graph v1.0, kunye ne-Google Keep v1. Iiadaptha ze-Things kunye ne-OmniFocus nazo zibandakanyiwe. Iimvavanyo ezikwi-host ziqinisekisa iiadaptha ze-API ngokusebenzisa i-fixture ye-HTTPS yasekhaya; ukuhambelana kwenene kusafuna iiakhawunti ezizodwa zababoneleli.

## Onokukwenza

- **Bamba imisebenzi ngaphandle kokutshintsha ii-app.** Sebenzisa i-Automator Service, igama elingundoqo le-Alfred, okanye i-clipboard ukongeza umsebenzi. Ukubamba ngobuninzi kudala isikhumbuzo esinye kumgca ngamnye onombhalo.
- **Guqula isicatshulwa sibe yimisebenzi ecwangcisiweyo.** Hlalutya imihla enxulumeneyo neye-ISO, amaxesha, izinto eziphambili, iimeko zomsebenzi, kunye neeprojekthi usebenzisa isihlalutyi se-AppleScript sokuvelisa esisetyenziswa kunye kukubamba okukhawulezayo komthonyama nokubamba kwe-Calendar.
- **Bamba iziganeko kwaye uhlole i-inbox yakho.** Dala iziganeko ze-Calendar ezinexesha, ubude bexesha, kunye nendawo; qhuba uphononongo lweveki lwamanyathelo amahlanu lokukhupha zonke iingcinga kwizikhumbuzo ze-Reminders.
- **Sebenza ngeeseshoni zokugxila ezinexesha elimisiweyo.** Qalisa, hlola, kwaye umise iiseshoni kwiinkqubo ezahlukeneyo. Izibali-xesha ze-launchd eziphantsi kweseshoni zilawula ukuphela kwexesha nokurhoxiswa; iilogi ze-JSONL zibonelela ngohlalutyo lobude bexesha.
- **Sebenzisa i-Alfred kwizinto ezingaphezulu kwemisebenzi.** Dala uluhlu lwe-Reminders lweeprojekthi, gcina amanqaku okubhekisela, vula i-inbox ukuze uyiphonononge, bamba isicatshulwa esikwi-clipboard, kwaye uhlele izikhethwa ezineentlobo zedatha eziqinisekisiweyo.
- **Jonga i-inbox yakho kwibha yemenyu.** Iplagini yokuzikhethela ye-SwiftBar/xbar ibonisa inani lezinto ezingagqitywanga kwi-inbox kwaye inamakhonkco aya kwiinkqubo zokubamba.

Indlela yokusebenza yomthonyama ihlolwa kwiikhompyutha ze-Mac zokwenene ezigcinwe kwi-GitHub: iimvavanyo zisebenzisa iibhokisi zencoko ze-Automator, zize zifunde kwakhona iirekhodi ze-Reminders kunye ne-Calendar. Jonga [uvavanyo nokuhambelana](#testing-and-compatibility) ukuze ubone umda wobungqina obukhoyo.

## Ukuqalisa ngokukhawuleza: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Vula inkqubo yomsebenzi kwi-Automator uyisebenzise ukuze uzame ukubamba. Ukuze ifumaneke njenge-Service, faka ibhandile phantsi kwe-`~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Yabela indlela emfutshane ku-**System Settings → Keyboard → Keyboard Shortcuts → Services**. Vumela ufikelelo lwe-Automation kwi-Reminders xa i-macOS icela. Faka:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Inkqubo yomsebenzi yomthonyama idala isikhumbuzo esiphambili kakhulu esifuneka ngomso, isithumele kuluhlu lwe-`shopping`, kwaye irekhode imeko yomsebenzi. Ngaphandle kophawu lweprojekthi okanye lwemeko, ukubamba okukhawulezayo kusebenzisa i-`Inbox`.

## Isintaksi yokubamba

Isihlalutyi somsebenzi somthonyama kunye nokubamba imisebenzi kwe-Alfred ziyaqonda ezi mpawu. Iiadaptha zababoneleli zinenkxaso yazo yeendawo zokufaka idatha kunye nokuhambisa.

| Okufakiweyo | Intsingiselo | Umzekelo |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Ukubaluleka okuphezulu, okuphakathi, okanye okusezantsi | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Umhla wokugqibela onxulumeneyo | `Call dentist tomorrow` |
| Usuku lweveki okanye `next weekday` | Umhla wokugqibela wosuku lweveki | `Send report next monday` |
| `due:YYYY-MM-DD` | Umhla wokugqibela ocacileyo | `Renew membership due:2027-03-15` |
| Ixesha elikunye nomhla | Ixesha lokugqibela | `Call Alex tomorrow at 3pm` |
| `@context` | Uphawu lwemeko | `Buy milk @errands` |
| `+project` | Ukuthunyelwa kwiprojekthi/kuluhlu | `Draft outline +website` |

I-`due:today` kunye ne-`due:tomorrow` nazo ziyamkelwa. Sebenzisa oonobumba, amanani, ii-underscore, okanye iihayifeni kwiimpawu zemeko nezeeprojekthi. Ukubamba okukhawulezayo komthonyama kunika ukuthunyelwa kweprojekthi indawo yokuqala ngaphambi kokuthunyelwa kwemeko.

Ukubamba kwe-Calendar kusebenzisa u-`@` kwindawo yesiganeko kwaye kwamkela ubude bexesha ngemizuzu okanye ngeeyure:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Ngaphandle kwexesha okanye ubude bexesha obucacisiweyo, ukubamba kwe-Calendar kusebenzisa u-9:00 AM kunye neyure enye, kwikhalenda yokuqala ekwazi ukubhalwa kuyo.

## Khetha inkqubo yomsebenzi

### Iinkqubo zomsebenzi zomthonyama ze-Apple

| Inkqubo yomsebenzi | Indlela yokusebenza | Ibhandile |
| --- | --- | --- |
| Ukubamba okukhawulezayo | Hlalutya isicatshulwa somsebenzi uze udale isikhumbuzo | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Ukubamba kwi-clipboard | Dala isikhumbuzo kwisicatshulwa esikwi-clipboard | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Ukubamba ngobuninzi | Dala izikhumbuzo kwimigca emininzi | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Ukubamba isiganeko | Dala isiganeko se-Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Uphononongo lweveki | Uphononongo olukhokelwayo kunye nokukhupha iingcinga zezikhumbuzo | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Vula ibhandile kwi-Automator ukuze uyizame, okanye uyifake phantsi kwe-`~/Library/Services` ukuze ukwazi ukuyisebenzisa ngebhodi yezitshixo. I-Reminders kunye ne-Calendar zifuna iimvume ezifanelekileyo ze-macOS Automation.

### Alfred

Ifuna i-Alfred ene-Powerpack. Yakha ipakethe ukusuka kwikhowudi yomthombo yangoku:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Ungakhuphela kwakhona ipakethe ku-[ukhupho](https://github.com/somethingwithproof/MacGTD/releases). Iipakethe zokhupho zibonisa ikhowudi yomthombo ephawuliweyo; iimpawu ezongezwe ku-`main` emva kokhupho zifuna ukwakhiwa kwakhona kwikhowudi yomthombo.

| Igama elingundoqo | Isenzo |
| --- | --- |
| `task` | Bamba umsebenzi ngohlalutyo lomhla, imeko, iprojekthi, kunye nokubaluleka |
| `note` | Gcina inqaku lokubhekisela kwi-Reminders |
| `project` | Dala uluhlu lwe-Reminders |
| `gtd process` | Vula i-Inbox ukuze iphononongwe ngumntu |
| `clip` | Bamba isicatshulwa esikwi-clipboard |
| `gtd focus` | Qalisa iseshoni yokugxila, hlola imeko, okanye umise |
| `gtd analytics` | Hlola ubude bexesha lokugxila oburekhodiweyo |
| `gtd preferences` | Hlela izikhethwa zenkqubo yomsebenzi |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Izikhethwa zigcinwe kwi-`~/Library/Preferences/com.alfredgtd.plist`; imeko yokugxila kunye neelogi zigcinwe phantsi kwe-`~/.gtd`. Izikhethwa zinezicwangciso ezingagqibekanga ezakhelwe ngaphakathi, uhlolo lweentlobo zedatha, ukungeniswa okuqinisekisiweyo, kunye nokubhala okungenakwahlulwa. Iiseshoni zokugxila azitshintshi izicwangciso zezaziso zesistim. Ukucubungula i-Inbox kuvula uluhlu ukuze luphononongwe; akususi okanye akugqibi imisebenzi ngokuzenzekelayo.

Jonga [isikhokelo se-Alfred](../../../workflows/alfred/README.md) kunye [namaxwebhu elayibrari ye-GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Iiadaptha zokubamba zangaphandle

Zonke iinkqubo ezine zokubamba ze-API zivavanywa ngeebhokisi zencoko zokwenene ze-Automator kunye ne-fixture ye-TLS yasekhaya kwi-E2E ekwi-host. Uluhlu lwemvavanyo olwenziwa ngesandla olwahlukileyo luvavanya ukugcinwa kwedatha kwababoneleli bokwenene xa iiakhawunti ezizodwa zicwangcisiwe. I-Things kunye ne-OmniFocus zifuna uluhlu lovavanyo lwe-desktop olunelayisensi.

| Ekujoliswe kuko | Indlela yokusebenza | Ukusetwa / umthombo |
| --- | --- | --- |
| Todoist | Ukubamba nge-API | [Ukusetwa kwenkqubo yomsebenzi ne-Keychain](../../../workflows/todoist/) |
| Notion | Ukubamba nge-API yomthombo wedatha | [Ukusetwa kwenkqubo yomsebenzi ne-Keychain](../../../workflows/notion/) |
| Things 3 | Isikimu se-URL | [Inkqubo yomsebenzi](../../../workflows/things/) |
| OmniFocus | I-AppleScript / isikimu se-URL | [Inkqubo yomsebenzi](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Inkqubo yomsebenzi](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Inkqubo yomsebenzi](../../../workflows/google/) |

Iiadaptha ze-API zifuna ukusetwa kweziqinisekiso zokungena; i-Microsoft ifuna imvume ye-OAuth enikezelweyo kwaye i-Google Keep ifuna ufikelelo olufanelekileyo lwe-Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Jonga [iimfuno zokusetwa kwe-API, ukufuduswa, kunye nemvume](../../../workflows/api/README.md). Ii-ID zeziseko zedatha ze-Notion ezikhoyo zifuduswa kuphela xa kufunyenwe umthombo wedatha omnye kanye. Ukubamba kwe-Microsoft kunye ne-Google kusebenzisa ii-API endaweni yeendlela ezimfutshane zesikhangeli ezingabhalwanga. Iithokheni zokufikelela ze-OAuth zifuna ukuhlaziywa ngomxhasi wakho we-OAuth. Imithwalo yedatha isebenzisa izitshixo ze-JSON ezicacileyo, izicelo ze-HTTPS ezinomda, kunye nokuqinisekiswa kwempendulo. Imiyalezo yeempazamo igcina iinkcukacha zokusilela ngelixa ifihla ithokheni ye-API ecwangcisiweyo. Jonga i-[SECURITY.md](../../../SECURITY.md) ukuze uxele imiba yokhuseleko.

### Ibha yemenyu kunye ne-Shortcuts

[Isikhokelo sebha yemenyu](../../../workflows/menubar/README.md) sichaza iplagini yokuzikhethela ye-SwiftBar/xbar. Faka ii-Apple Services kuqala, uze ucwangcise uvimba weeplagini kwi-app yakho yebha yemenyu kwaye uqhagamshele i-`workflows/menubar/gtd-menubar.sh` kuyo.

[Isikhokelo se-Shortcuts](../../../workflows/shortcuts/README.md) sibonelela ngokusetwa ngesandla kokubamba isicatshulwa, i-clipboard, kunye ne-Siri kwi-macOS 12+. I-Shortcuts kunye nokuvulwa ngelizwi nge-Siri zingaphandle koluhlu lweemvavanyo olukwi-host.

## Uyilo lwenkqubo

Iibhandile ze-Automator zifaka i-AppleScript ngaphakathi ukuze zikwazi ukusebenza njengee-Services zomthonyama. I-Alfred ipakisha izikripthi zezenzo kwaye idlulisele okufakwe ngumsebenzisi njengamaxabiso. I-GTDLib ibonelela ngemisebenzi yomthonyama ekwabelwana ngayo ye-Reminders ukusuka kwikhowudi ye-AppleScript ehlelekayo kunye nebhandile yesikripthi ehlanganisiweyo.

- **Isihlalutyi esinye sokuvelisa:** I-`scripts/sync-native-parser.py` ifaka isihlalutyi ekwabelwana ngaso kwi-Quick Capture nakwi-Event Capture; ukuqinisekisa kufumanisa ukutenxa kwikhowudi yomthombo.
- **Imeko yokugxila ehlala ikhona:** iinkqubo ezibizwe ngokwahlukeneyo zabelana ngemeko yeseshoni, zinemisebenzi ye-launchd ezilawula yona kunye nokubalwa kwexesha elidlulileyo okunomda.
- **Iipakethe ezinokuphindwa ngokufanayo:** ukupakisha kwakha uvimba omtsha, kwaye iimvavanyo zithelekisa okukuwo nekhowudi yomthombo. Ilayibrari inesikripthi sayo sokuhlanganisa esahlukileyo.
- **Iimvavanyo ezibonakalayo:** iingxelo ze-JUnit, iilogi zemiyalelo, kunye nezinto ezakhiweyo ezivavanyiweyo zigcinwa iintsuku ezili-14 kwi-GitHub Actions.

| Uvimba weefayile | Uxanduva |
| --- | --- |
| [`workflows/`](../../../workflows/) | Iibhandile zomthonyama, iiadaptha zababoneleli, i-Alfred, i-Shortcuts, kunye nezikripthi zebha yemenyu |
| [`scripts/`](../../../scripts/) | Ukupakisha, ukuhlanganisa ilayibrari, ungqamaniso lwesihlalutyi, kunye nokulungiselela uvavanyo olukwi-host |
| [`tests/`](../../../tests/) | Ukuqinisekisa, uhlolo lwamacandelo, kunye ne-E2E yedesktop yomthonyama |
| [`.github/workflows/`](../../../.github/workflows/) | I-CI, i-E2E yasebusuku/yesandla, kunye nokugcinwa kwindawo yokugcina ikhowudi |
| [`infra/`](../../../infra/) | Ukusetwa kokuzikhethela kwe-runner ye-Mac yasekhaya neye-EC2; i-CI ekwi-host ayikudingi oku |

## Uvavanyo nokuhambelana

| Umda | Imeko yokusebenza | Okuhlolwayo |
| --- | --- | --- |
| Ukuqinisekisa | I-macOS 15 ne-26 egcinwe kwi-GitHub | Ukuhlanganiswa kwe-AppleScript, iibhandile, isihlalutyi sokuvelisa, iithagethi zezenzo, izikhethwa, imeko yokugxila, uthutho lwe-API ye-fixture, kunye nokupakishwa nokuphindwa kweepakethe |
| Uhlolo lokhuseleko | I-Ubuntu ne-macOS 15 egcinwe kwi-GitHub | I-Python CodeQL, i-ShellCheck, kunye novavanyo lwe-fuzzing ye-Atheris olunomda kwisihlalutyi sokuvelisa esihlanganisiweyo |
| I-E2E yeadaptha yomboneleli | I-`macos-15-intel` egcinwe kwi-GitHub | Zonke iibhokisi zencoko ezine ze-API yokuvelisa, uthutho lwe-TLS, ukugcinwa/ukufundwa kwakhona kwi-fixture, ukusilela kwe-API, ukurhoxisa, kunye nokukhethwa komthombo we-Notion |
| I-E2E yomboneleli wokwenene | Uqhutywo lwe-Mac egcinwe kwi-GitHub ngesandla ngeemfihlo ezizodwa | Ukubamba kokwenene kwe-Todoist, i-Notion, i-Microsoft, ne-Google kunye nokufundwa kwakhona kumboneleli; iyasilela ukuba iiakhawunti azikho |
| Udibaniso lwedesktop olunelayisensi | Iakhawunti yasekhaya eyodwa | Ukubizwa nokugcinwa kwe-Things 3, i-OmniFocus 4, kunye ne-UI ye-Alfred |
| I-E2E yedesktop yomthonyama | I-`macos-15-intel` egcinwe kwi-GitHub | Iibhokisi zencoko zokwenene ze-Automator; idatha egciniweyo ye-Reminders ne-Calendar; uphononongo lweveki; amanani emenyu; i-GTDLib ehlanganisiweyo; izenzo zomthonyama ze-Alfred ezipakishiweyo; ukuphela nokurhoxiswa kwesibali-xesha sokwenene se-launchd |
| I-UI yokuzikhethela ye-Alfred | Iakhawunti yasekhaya eyodwa, i-Alfred 5 + Powerpack | Ukungeniswa kwenkqubo yomsebenzi, ukubizwa ngegama elingundoqo, kunye nokufundwa kwakhona kwesikhumbuzo nge-UI enelayisensi |

[Uqhutywo oluqinisekisiweyo lokuhlaziywa kwe-API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) luphumelele **iimvavanyo zokuqinisekisa ezingama-35 kwiqonga ngalinye lokuqinisekisa kunye neemvavanyo ze-E2E zedesktop ezingama-26**, ngaphandle kokusilela, iimpazamo, okanye ukutsitywa. Ukugubungela kwedesktop kubandakanya iimvavanyo zomthonyama ezili-15 kunye neemvavanyo zeadaptha yomboneleli ezili-11, kubandakanya ukuphela kwexesha lothutho lokwenene kunye nohlolo lwe-Keychain olwexeshana. Ukuqinisekisa kuqhuba kwakhona uhlolo lwesakhiwo sendawo yokugcina ikhowudi. Ezi ziphumo zigubungela indlela yokusebenza yomthonyama kunye nee-fixture zababoneleli; aziqinisekisi ukuhambelana kwababoneleli bokwenene okanye ii-app ezinelayisensi. Imeko yangoku iboniswa ziibheji ezingentla.

Izicelo zokutsala kunye nokutyhala ku-`main` ziqhuba ukuqinisekisa kulandelwe yi-E2E yomthonyama. Inkqubo yomsebenzi ye-E2E nayo isebenza qho ebusuku naxa iqaliswe ngesandla, kubandakanya iimvavanyo zeadaptha yomboneleli ezizinzileyo. Iimvavanyo zababoneleli bokwenene zisebenzisa inkqubo yomsebenzi eyahlukileyo yesandla i-`live-e2e.yml`. I-CI esisiseko isebenzisa ii-Mac ezilahlwayo ezigcinwe kwi-GitHub, ii-fixture ezizodwa, kunye neenkqubo ezincinci ezinomda; akukho mfuneko ye-runner ezihostelweyo okanye iziqinisekiso zeakhawunti yangaphandle kuluhlu olusisiseko. Uluhlu lwemvavanyo yokwenene yesandla lufuna iimfihlo ezizodwa zababoneleli.

Iinguqulelo ezindala ze-macOS aziqinisekiswa yi-CI yangoku. Uqhutywo lwababoneleli bokwenene lufuna iimfihlo ezizodwa kwaye alukaqinisekiswa okwangoku. I-Shortcuts/Siri kunye nee-app zedesktop ezinelayisensi zingaphandle koluhlu olusisiseko olukwi-host. Iimvavanyo zezenzo zomthonyama zivavanya izikripthi ze-Alfred ezipakishiweyo ngqo; aziqinisekisi ukuhambelana okupheleleyo kwe-UI ye-Alfred. Jonga [ukusetwa kovavanyo, izinto ezifunekayo kuqala, kunye nomda wokugubungela](../../../tests/e2e/README.md).

## Uguqulelo lwasekhaya

Imiyalezo ejolise kumsebenzisi ye-CLI, umqhubi wemvavanyo, kunye nebha yemenyu ifumaneka kwiilwimi zeendawo ezingama-45 (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) phantsi kwe-`locales/` nge-`scripts/i18n.py` ngaphandle kokuxhomekeka kwiilayibrari zangaphandle. Ukukhetha ulwimi lwendawo kuhlola u-`--lang`, kulandele u-`LC_ALL`, u-`LC_MESSAGES`, kunye no-`LANG`, kubuyele ku-`en` xa zingekho.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Uphuhliso

Faka i-[mise](https://mise.jdx.dev/) kwaye usebenzise inguqulelo ye-Python echazwe kwi-`.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Ukuqinisekisa kubhala iingxelo phantsi kwe-`test-results/`; izikripthi zokwakha zibhala kwi-`dist/`. Ukuqhuba uluhlu lwedesktop olukwi-host ku-`main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

I-E2E yedesktop yasekhaya ifuna iakhawunti yovavanyo eyodwa engenileyo kunye neemvume ezichazwe [kwisikhokelo se-E2E](../../../tests/e2e/README.md). Isikripthi sokulungiselela iimvume esikwi-host sisikelwe umda kwimisebenzi elahlwayo egcinwe kwi-GitHub.

Sebenzisa i-[Conventional Commits](https://www.conventionalcommits.org/) kwaye ulandele i-[CONTRIBUTING.md](../../../CONTRIBUTING.md). Utshintsho lwakutshanje lurekhodwe kwi-[CHANGELOG.md](../../../CHANGELOG.md).

Ulawulo lokhuseleko, ukuqinisekiswa kwetyikityo yokhupho, kunye nemida eseleyo ye-Scorecard kubhalwe [kuhlolo lokhuseleko](../../../docs/security-assessment.md). Inkqubo yomsebenzi yokhupho iyakha kwaye iqinisekise iipakethe phambi kokudala uyilo lokhupho, kubandakanya ubungqina bemvelaphi obusayiniweyo be-in-toto kunye neebhandile ze-Sigstore eziqinisekiswe ngokuchasene ne-commit yomthombo ne-ref. Ubungqina obutsha bemvelaphi busebenza kwizakhiwo zaloo nkqubo yomsebenzi, hayi kukhuphelo oludala.

## Imbali yeprojekthi nelayisensi

I-MacGTD idibanisa iindawo zokugcina ikhowudi ezazisakuba yi-MacGTD-Native, i-MacGTD-Microsoft, i-MacGTD-Google, kunye ne-AlfredGTD. Inelayisensi phantsi kwe-[MIT License](../../../LICENSE).
