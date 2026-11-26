# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · **isiZulu**

</details>

**I-MacGTD iqoqo lemizila yomsebenzi ye-macOS yokuthwebula imisebenzi, ukuhlela izikhumbuzo, nokusebenzisa amaseshini okugxila anesikhathi esibekiwe ngezinhlelo zokusebenza osuvele uzisebenzisa.**

Yakhelwe phezu kwe-[Getting Things Done](https://gettingthingsdone.com/), iletha ukuthwebula ngamabhokisi ezingxoxo, ibhodi lokunamathisela, nokuthwebula ngenqwaba ku-Apple Reminders; ukuthwebula imicimbi ku-Calendar; kanye nemiyalo yemisebenzi, amanothi, amaphrojekthi, nokugxila ku-Alfred. I-AppleScript ne-Automator zigcina imizila yomsebenzi yendabuko isondelene ne-macOS. Ama-adapter e-API asebenzisa i-Todoist API v1, i-Notion API 2026-03-11, i-Microsoft Graph v1.0, kanye ne-Google Keep v1. Ama-adapter e-Things ne-OmniFocus nawo afakiwe. Ukuhlolwa okusingathiwe kuqinisekisa ama-adapter e-API ngokubhekisela ku-fixture ye-HTTPS yendawo; ukuhambisana kwangempela kusadinga ama-akhawunti abahlinzeki azinikezele.

## Ongakwenza

- **Thwebula ngaphandle kokushintsha izinhlelo zokusebenza.** Sebenzisa i-Automator Service, igama elingukhiye le-Alfred, noma ibhodi lokunamathisela ukwengeza umsebenzi. Ukuthwebula ngenqwaba kudala isikhumbuzo esisodwa kulayini ngamunye onombhalo.
- **Guqula umbhalo ube yimisebenzi ehlelekile.** Hlaziya izinsuku ezihlobene nezinsuku ze-ISO, izikhathi, okubalulekile, izimo, namaphrojekthi usebenzisa isihlaziya se-AppleScript sokukhiqiza esabiwa ukuthwebula okusheshayo kwendabuko nokuthwebula kwe-Calendar.
- **Thwebula imicimbi futhi ubuyekeze ibhokisi lakho lokungenayo.** Dala imicimbi ye-Calendar enesikhathi, ubude besikhathi, nendawo; sebenzisa ukubuyekezwa kwamasonto onke kwezinyathelo ezinhlanu okunokuqongelela imicabango ku-Reminders.
- **Sebenza emaseshinini okugxila anesikhathi esibekiwe.** Qala, hlola, futhi umise amaseshini phakathi kwezinqubo ezahlukene. Izibali-sikhathi ze-launchd eziphethwe yiseshini ziphatha ukuphela kwesikhathi nokukhanselwa; amalogi e-JSONL ahlinzeka ngokuhlaziywa kobude besikhathi.
- **Sebenzisa i-Alfred kokungaphezu kwemisebenzi.** Dala izinhlu ze-Reminders zamaphrojekthi, gcina amanothi okubhekisela kuwo, vula ibhokisi lokungenayo ukuze ulibuyekeze, thwebula umbhalo webhodi lokunamathisela, futhi uhlele izintandokazi ezinezinhlobo eziqinisekisiwe.
- **Bona ibhokisi lakho lokungenayo kusuka kubha yemenyu.** I-plugin ye-SwiftBar/xbar yokuzikhethela ibonisa izibalo zezinto ezingakaqedwa ebhokisini lokungenayo nezixhumanisi eziya emizileni yomsebenzi yokuthwebula.

Ukuziphatha kwendabuko kuhlolwa kuma-Mac angempela asingathwe ku-GitHub: ukuhlolwa kusebenzisa amabhokisi ezingxoxo e-Automator, bese kufunda emuva amarekhodi e-Reminders ne-Calendar. Bona [ukuhlolwa nokuhambisana](#testing-and-compatibility) ukuze uthole ububanzi balobo bufakazi.

## Ukuqala ngokushesha: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Vula umzila womsebenzi ku-Automator bese uwusebenzisa ukuze uzame ukuthwebula. Ukuze uwenze utholakale njenge-Service, faka iphakheji ngaphansi kwe-`~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Yabela isinqamuleli kokuthi **System Settings → Keyboard → Keyboard Shortcuts → Services**. Vumela ukufinyelela kwe-Automation ku-Reminders lapho i-macOS icela. Faka lokhu:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Umzila womsebenzi wendabuko udala isikhumbuzo esibaluleke kakhulu okufanele senziwe kusasa, usiqondise ohlwini lwe-`shopping`, futhi urekhode isimo. Ngaphandle kwemaka yephrojekthi noma yesimo, ukuthwebula okusheshayo kusebenzisa i-`Inbox`.

## I-syntax yokuthwebula

Isihlaziya semisebenzi sendabuko nokuthwebula imisebenzi kwe-Alfred kuyawazi lawa mamaka. Ama-adapter abahlinzeki anokusekelwa kwawo kwezinkambu nokuqondisa.

| Okufakwayo | Incazelo | Isibonelo |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Ukubaluleka okuphezulu, okumaphakathi, noma okuphansi | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Usuku lokugcina oluhlobene | `Call dentist tomorrow` |
| Usuku lwesonto noma `next weekday` | Usuku lokugcina lwangosuku lwesonto | `Send report next monday` |
| `due:YYYY-MM-DD` | Usuku lokugcina olucacisiwe | `Renew membership due:2027-03-15` |
| Isikhathi kanye nosuku | Isikhathi sokugcina | `Call Alex tomorrow at 3pm` |
| `@context` | Imaka yesimo | `Buy milk @errands` |
| `+project` | Ukuqondiswa kwephrojekthi/kohlu | `Draft outline +website` |

Okuthi `due:today` nokuthi `due:tomorrow` nakho kuyamukelwa. Sebenzisa izinhlamvu, izinombolo, ama-underscore, noma odwi emamakeni ezimo namaphrojekthi. Ukuthwebula okusheshayo kwendabuko kunika ukuqondiswa kwephrojekthi ukuqala ngaphambi kokuqondiswa kwesimo.

Ukuthwebula kwe-Calendar kusebenzisa u-`@` endaweni yomcimbi futhi kwamukela ubude besikhathi ngamaminithi noma ngamahora:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Ngaphandle kwesikhathi esicacisiwe noma ubude besikhathi, ukuthwebula kwe-Calendar kusebenzisa u-9:00 AM nehora elilodwa, kukhalenda yokuqala ebhalekayo.

## Khetha umzila womsebenzi

### Imizila yomsebenzi yendabuko ye-Apple

| Umzila womsebenzi | Ukuziphatha | Iphakheji |
| --- | --- | --- |
| Ukuthwebula okusheshayo | Hlaziya umbhalo womsebenzi bese udala isikhumbuzo | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Ukuthwebula kwebhodi lokunamathisela | Dala isikhumbuzo kusuka kumbhalo webhodi lokunamathisela | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Ukuthwebula ngenqwaba | Dala izikhumbuzo kusuka emilayinini eminingi | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Ukuthwebula imicimbi | Dala umcimbi we-Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Ukubuyekezwa kwamasonto onke | Ukubuyekezwa okuqondiswayo nokuqongelela imicabango yezikhumbuzo | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Vula iphakheji ku-Automator ukuze ulizame, noma ulifake ngaphansi kwe-`~/Library/Services` ukuze ufinyelele kukhibhodi. I-Reminders ne-Calendar zidinga izimvume ezifanele ze-macOS Automation.

### Alfred

Idinga i-Alfred ene-Powerpack. Yakha iphakheji kusuka kumthombo wamanje:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Ungaphinda ulande iphakheji kokuthi [ukukhishwa](https://github.com/somethingwithproof/MacGTD/releases). Amaphakheji okukhishwa abonisa umthombo wawo omakiwe; izici ezingezwe ku-`main` ngemva kokukhishwa zidinga ukwakhiwa kusuka kumthombo.

| Igama elingukhiye | Isenzo |
| --- | --- |
| `task` | Thwebula umsebenzi ngokuhlaziya usuku, isimo, iphrojekthi, nokubaluleka |
| `note` | Gcina inothi lokubhekisela kulo ku-Reminders |
| `project` | Dala uhlu lwe-Reminders |
| `gtd process` | Vula i-Inbox ukuze ibuyekezwe ngumuntu |
| `clip` | Thwebula umbhalo webhodi lokunamathisela |
| `gtd focus` | Qala iseshini yokugxila, hlola isimo, noma umise |
| `gtd analytics` | Hlola ubude besikhathi bokugxila oburekhodiwe |
| `gtd preferences` | Hlela izintandokazi zomzila womsebenzi |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Izintandokazi zigcinwa ku-`~/Library/Preferences/com.alfredgtd.plist`; isimo sokugxila namalogi kugcinwa ngaphansi kwe-`~/.gtd`. Izintandokazi zinamanani azenzakalelayo akhelwe ngaphakathi, ukuhlolwa kwezinhlobo, ukungeniswa okuqinisekisiwe, nokubhala kwe-atomic. Amaseshini okugxila awazishintshi izilungiselelo zezaziso zesistimu. Ukucubungula ibhokisi lokungenayo kuvula uhlu ukuze lubuyekezwe; akuhambisi noma kuqede imisebenzi ngokuzenzakalela.

Bona [umhlahlandlela we-Alfred](../../../workflows/alfred/README.md) kanye [nemibhalo yelabhulali ye-GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Ama-adapter okuthwebula angaphandle

Yomine imizila yomsebenzi yokuthwebula ye-API ihlolwa ngamabhokisi ezingxoxo e-Automator angempela ne-fixture ye-TLS yendawo ku-E2E esingathiwe. Iqoqo lokuhlola okwenziwa ngesandla elihlukile lihlola ukugcinwa kwedatha komhlinzeki wangempela lapho ama-akhawunti azinikezele elungisiwe. I-Things ne-OmniFocus zidinga iqoqo lokuhlanganiswa kwedeskithophu elinelayisensi.

| Okuhlosiwe | Indlela yokusebenza | Ukusetha / umthombo |
| --- | --- | --- |
| Todoist | Ukuthwebula nge-API | [Ukusetha umzila womsebenzi ne-Keychain](../../../workflows/todoist/) |
| Notion | Ukuthwebula nge-API yomthombo wedatha | [Ukusetha umzila womsebenzi ne-Keychain](../../../workflows/notion/) |
| Things 3 | Uhlelo lwe-URL | [Umzila womsebenzi](../../../workflows/things/) |
| OmniFocus | I-AppleScript / uhlelo lwe-URL | [Umzila womsebenzi](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Umzila womsebenzi](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Umzila womsebenzi](../../../workflows/google/) |

Ama-adapter e-API adinga ukusethwa kweziqinisekiso zokungena; i-Microsoft idinga ukugunyazwa kwe-OAuth okudluliselwe kanti i-Google Keep idinga ukufinyelela kwe-Workspace okufanelekayo:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Bona [ukusetha kwe-API, ukuthuthwa, nezidingo zokugunyazwa](../../../workflows/api/README.md). Ama-ID esizindalwazi se-Notion akhona athuthwa kuphela uma kutholakala umthombo wedatha owodwa qede. Ukuthwebula kwe-Microsoft ne-Google kusebenzisa ama-API esikhundleni sezinqamuleli zesiphequluli ezingabhalwanga. Amathokheni okufinyelela e-OAuth adinga ukuvuselelwa ngeklayenti lakho le-OAuth. Ama-payload asebenzisa okhiye be-JSON abacacisiwe, izicelo ze-HTTPS ezinemingcele, nokuqinisekiswa kwempendulo. Imilayezo yamaphutha igcina imininingwane yokwehluleka ngenkathi ifihla ithokheni ye-API elungisiwe. Bona [SECURITY.md](../../../SECURITY.md) ukuze ubike izinkinga zokuphepha.

### Ibha yemenyu ne-Shortcuts

[Umhlahlandlela webha yemenyu](../../../workflows/menubar/README.md) ukhuluma nge-plugin ye-SwiftBar/xbar yokuzikhethela. Faka ama-Apple Services kuqala, bese ulungisa uhla lwemibhalo lwe-plugin kuhlelo lwakho lwebha yemenyu bese uxhuma i-`workflows/menubar/gtd-menubar.sh` kulo.

[Umhlahlandlela we-Shortcuts](../../../workflows/shortcuts/README.md) uhlinzeka ngokusetha ngesandla kokuthwebula umbhalo, ibhodi lokunamathisela, ne-Siri ku-macOS 12+. I-Shortcuts nokusebenzisa izwi nge-Siri kungaphandle kweqoqo lokuhlola elisingathiwe.

## Ukwakheka kohlelo

Amaphakheji e-Automator afaka i-AppleScript ngaphakathi ukuze akwazi ukusebenza njengama-Service endabuko. I-Alfred ipakisha izikripthi zezenzo futhi idlulise okufakwe ngumsebenzisi njengama-argument. I-GTDLib iveza imisebenzi ye-Reminders yendabuko eyabiwe kusuka kumthombo we-AppleScript ohlelekayo nephakheji lesikripthi elihlanganisiwe.

- **Isihlaziya sokukhiqiza esisodwa:** I-`scripts/sync-native-parser.py` ifaka isihlaziya esabiwe ku-Quick Capture naku-Event Capture; ukuqinisekisa kuthola ukuphambuka komthombo.
- **Isimo sokugxila esiqhubekayo:** ukusetshenziswa okuhlukene kwabelana ngesimo seseshini, ngemisebenzi ye-launchd ephethwe nokubalwa kwesikhathi esidlulile okunemingcele.
- **Amaphakheji aphindelelekayo:** ukupakisha kwakha ingobo yomlando entsha, futhi ukuhlolwa kuqhathanisa okuqukethwe kwayo nomthombo. Ilabhulali inesikripthi sayo sokuhlanganisa esihlukile.
- **Ukuhlolwa okubonakalayo:** imibiko ye-JUnit, amalogi emiyalo, nama-artifact okwakha ahloliwe kugcinwa izinsuku ezingu-14 ku-GitHub Actions.

| Uhla lwemibhalo | Umsebenzi |
| --- | --- |
| [`workflows/`](../../../workflows/) | Amaphakheji endabuko, ama-adapter abahlinzeki, i-Alfred, i-Shortcuts, nezikripthi zebha yemenyu |
| [`scripts/`](../../../scripts/) | Ukupakisha, ukuhlanganisa ilabhulali, ukuvumelanisa isihlaziya, nokuhlinzeka ngokuhlolwa okusingathiwe |
| [`tests/`](../../../tests/) | Ukuqinisekisa, ukuhlolwa kwezingxenye, kanye ne-E2E yedeskithophu yendabuko |
| [`.github/workflows/`](../../../.github/workflows/) | I-CI, i-E2E yasebusuku/yesandla, nokunakekelwa kwenqolobane |
| [`infra/`](../../../infra/) | Ukusetha kwe-runner ye-Mac yendawo neye-EC2 yokuzikhethela; i-CI esingathiwe ayikudingi |

## Ukuhlolwa nokuhambisana

| Ububanzi | Indawo | Okuhlolwayo |
| --- | --- | --- |
| Ukuqinisekisa | I-macOS 15 ne-26 esingathwe ku-GitHub | Ukuhlanganiswa kwe-AppleScript, amaphakheji, isihlaziya sokukhiqiza, okuhloswe ngezenzo, izintandokazi, isimo sokugxila, ukuthuthwa kwe-API ye-fixture, nokupakisha nokuvulwa kwamaphakheji |
| Ukuhlolwa kokuphepha | I-Ubuntu ne-macOS 15 esingathwe ku-GitHub | I-Python CodeQL, i-ShellCheck, kanye ne-Atheris fuzzing enemingcele yesihlaziya sokukhiqiza esihlanganisiwe |
| I-E2E yama-adapter abahlinzeki | I-`macos-15-intel` esingathwe ku-GitHub | Wonke amabhokisi ezingxoxo e-API okukhiqiza amane, ukuthuthwa kwe-TLS, ukugcinwa/ukufundwa emuva kwe-fixture, ukwehluleka kwe-API, ukukhanselwa, nokukhethwa komthombo we-Notion |
| I-E2E yabahlinzeki bangempela | Ukugijima kwe-Mac okusingathwe ku-GitHub okwenziwa ngesandla okunezimfihlo ezizinikezele | Ukuthwebula kwangempela kwe-Todoist, Notion, Microsoft, ne-Google nokufundwa emuva komhlinzeki; kuyehluleka uma ama-akhawunti engekho |
| Ukuhlanganiswa kwedeskithophu okunelayisensi | I-akhawunti yendawo ezinikezele | Ukubizwa kwe-UI nokugcinwa kwedatha kwe-Things 3, OmniFocus 4, ne-Alfred |
| I-E2E yedeskithophu yendabuko | I-`macos-15-intel` esingathwe ku-GitHub | Amabhokisi ezingxoxo e-Automator angempela; idatha ye-Reminders ne-Calendar egciniwe; ukubuyekezwa kwamasonto onke; izibalo zemenyu; i-GTDLib ehlanganisiwe; izenzo zendabuko ze-Alfred ezipakishiwe; ukuphela nokukhanselwa kwesibali-sikhathi se-launchd sangempela |
| I-UI ye-Alfred yokuzikhethela | I-akhawunti yendawo ezinikezele, Alfred 5 + Powerpack | Ukungeniswa komzila womsebenzi, ukubizwa kwamagama angukhiye, nokufundwa emuva kwezikhumbuzo nge-UI enelayisensi |

[Ukugijima okuqinisekisiwe kokwenziwa kwesimanjemanje kwe-API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) kuphumelele **ukuhlolwa kokuqinisekisa okungu-35 kupulatifomu ngayinye yokuqinisekisa nokuhlolwa kwe-E2E yedeskithophu okungu-26**, ngaphandle kokwehluleka, amaphutha, noma okweqiwe. Ukuhlanganiswa kwedeskithophu kufaka ukuhlolwa kwendabuko okungu-15 nokuhlolwa kwama-adapter abahlinzeki okungu-11, okuhlanganisa ukuphela kwesikhathi kokuthuthwa kwangempela nokuhlolwa kwe-Keychain kwesikhashana. Ukuqinisekisa kuphinde kuqhube ukuhlolwa kwesakhiwo senqolobane. Le miphumela ihlanganisa ukuziphatha kwendabuko nama-fixture abahlinzeki; ayiqinisekisi ukuhambisana kwangempela komhlinzeki noma kwezinhlelo zokusebenza ezinelayisensi. Isimo samanje siboniswa ngamabheji angenhla.

Ama-pull request nokuphusha okuya ku-`main` kuqhuba ukuqinisekisa kulandelwe yi-E2E yendabuko. Umzila womsebenzi we-E2E uphinde usebenze njalo ebusuku nasekuthunyelweni okwenziwa ngesandla, okuhlanganisa ukuhlolwa kwama-adapter abahlinzeki okuqondile. Ukuhlolwa kwabahlinzeki bangempela kusebenzisa umzila womsebenzi ohlukile we-`live-e2e.yml` owenziwa ngesandla. I-CI ezenzakalelayo isebenzisa ama-Mac alahlwayo asingathwe ku-GitHub, ama-fixture ahlukanisiwe, nezinqubo ezingaphansi ezinemingcele; akudingeki i-runner ozisingathele yona noma iziqinisekiso ze-akhawunti yangaphandle eqoqweni elizenzakalelayo. Iqoqo langempela elenziwa ngesandla lidinga izimfihlo zabahlinzeki ezizinikezele.

Izinguqulo zangaphambilini ze-macOS aziqinisekisiwe yi-CI yamanje. Ukugijima kwabahlinzeki bangempela kudinga izimfihlo ezizinikezele futhi akukaqinisekiswa okwamanje. I-Shortcuts/Siri nezinhlelo zokusebenza zedeskithophu ezinelayisensi zingaphandle kweqoqo elisingathiwe elizenzakalelayo. Ukuhlolwa kwezenzo zendabuko kusebenzisa izikripthi ze-Alfred ezipakishiwe ngokuqondile; akuqinisekisi ukuhambisana okugcwele kwe-UI ye-Alfred. Bona [ukusetha kokuhlolwa, okudingekayo kuqala, nobubanzi bokuhlolwa](../../../tests/e2e/README.md).

## Ukuhumusha ngezilimi zendawo

Izintambo zombhalo ze-CLI ezibonwa ngumsebenzisi, ze-test runner, nezebha yemenyu zitholakala ngezilimi zendawo ezingu-45 (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) ngaphansi kwe-`locales/` nge-`scripts/i18n.py` ngaphandle kokuncika ezinhlelweni zangaphandle. Ukuxazulula ulimi lwendawo kuhlola i-`--lang`, bese kuba yi-`LC_ALL`, `LC_MESSAGES`, ne-`LANG`, kubuyele ku-`en` uma kungatholakali.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Ukuthuthukisa

Faka i-[mise](https://mise.jdx.dev/) bese usebenzisa inguqulo ye-Python enamatheliswe ku-`.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Ukuqinisekisa kubhala imibiko ngaphansi kwe-`test-results/`; izikripthi zokwakha zibhala ku-`dist/`. Ukuze uqhube iqoqo ledeskithophu elisingathiwe ku-`main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

I-E2E yedeskithophu yendawo idinga i-akhawunti yokuhlola ezinikezele engenile kanye nezimvume ezichazwe [kumhlahlandlela we-E2E](../../../tests/e2e/README.md). Isikripthi sokuhlinzeka ngezimvume esisingathiwe silinganiselwe emisebenzini elahlwayo esingathwe ku-GitHub.

Sebenzisa i-[Conventional Commits](https://www.conventionalcommits.org/) bese ulandela i-[CONTRIBUTING.md](../../../CONTRIBUTING.md). Izinguquko zakamuva zirekhodwe ku-[CHANGELOG.md](../../../CHANGELOG.md).

Izilawuli zokuphepha, ukuqinisekiswa kwesiginesha yokukhishwa, nemikhawulo ye-Scorecard esele kubhalwe [ekuhlolweni kokuphepha](../../../docs/security-assessment.md). Umzila womsebenzi wokukhishwa wakha futhi uqinisekise amaphakheji ngaphambi kokudala ukukhishwa okusalungiswa, okuhlanganisa imvelaphi ye-in-toto esayiniwe namaphakheji e-Sigstore aqinisekiswe ngokubhekisela ku-commit yomthombo ne-ref. Imvelaphi entsha isebenza kulezo zakhiwo zomzila womsebenzi, hhayi kokulandiwe okudala.

## Umlando wephrojekthi nelayisensi

I-MacGTD ihlanganisa izinqolobane zangaphambilini ze-MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, ne-AlfredGTD. Inelayisensi ngaphansi kwe-[MIT License](../../../LICENSE).
