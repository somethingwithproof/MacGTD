# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · **Kinyarwanda** · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD ni urusobe rw'inzira z'akazi za macOS zo kwinjiza inshingano, gutunganya ibyibutsa, no gukora ibihe byo kwibanda ku murimo bifite igihe gipimwe ukoresheje porogaramu usanzwe ukoresha.**

Yubakiye ku buryo bwa [Getting Things Done](https://gettingthingsdone.com/), izana uburyo bwo kwinjiza amakuru binyuze mu idirishya, muri clipboard, no mu kivunge muri Apple Reminders; kwinjiza ibikorwa muri Calendar; hamwe n'amabwiriza y'inshingano, inyandiko, imishinga, no kwibanda ku murimo muri Alfred. AppleScript na Automator bituma inzira z'akazi kavukire zikorana neza cyane na macOS. Ibikoresho bihuza API bikoresha Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, na Google Keep v1. Ibikoresho bihuza Things na OmniFocus na byo birimo. Isuzuma rikorerwa kuri seriveri rigenzura ibihuza API ryifashishije isuzumiro ry'imbere rya HTTPS; kugenzura imikoranire nyayo ku mirongo ikora biracyasaba konti zabugenewe z'abo batanga serivisi.

## Ibyo ushobora gukora

- **Kwinjiza inshingano udahinduye porogaramu.** Koresha Automator Service, ijambo ry'ibanze rya Alfred, cyangwa clipboard kugira ngo wongereho inshingano. Kwinjiza mu kivunge kurema icyibutsa kimwe kuri buri murongo utarimo ubusa.
- **Guhindura inyandiko mo inshingano zitunganyije.** Sesengura amatariki agereranywa n'aya ISO, amasaha, uburemere bw'ibyihutirwa, imiterere y'aho bikorerwa, n'imishinga ukoresheje umusesenguzi nyakuri wa AppleScript uhuriweho no kwinjiza vuba kavukire hamwe no kwinjiza muri Calendar.
- **Kwinjiza ibikorwa no gusuzuma agasanduku k'ibyinjiye.** Rema ibikorwa bya Calendar bifite isaha, igihe bimara, n'ahantu bibera; kora isuzuma rya buri cyumweru ry'intambwe eshanu hamwe no kwandika ibitekerezo byose muri Reminders.
- **Gukora mu bihe byo kwibanda bifite igihe gipimwe.** Tangira, genzura, kandi uhagarike ibihe byo kwibanda hagati y'imikorere itandukanye. Ibipimo by'igihe bya launchd bigengwa n'igihe cyo kwibanda ni byo bigenzura kurangira no guhagarika; inyandiko za JSONL zitanga isesengura ry'igihe cyakoreshejwe.
- **Koresha Alfred ku birenze inshingano.** Rema intonde za Reminders z'imishinga, bika inyandiko z'ifashisho, fungura agasanduku k'ibyinjiye ngo ukasuzume, injiza inyandiko iri muri clipboard, kandi uhindure igenamiterere rifite ubwoko bugenzuwe.
- **Reba agasanduku k'ibyinjiye uvuye ku murongo w'ibikoresho wo hejuru.** Umugereka utari itegeko wa SwiftBar/xbar werekana umubare w'ibitararangira mu gasanduku k'ibyinjiye kandi ukanahuza n'inzira zo kwinjiza inshingano.

Imikorere kavukire igenzurirwa kuri mudasobwa za Mac nyazo zicumbikiwe kuri GitHub: amasuzuma akoresha amadirishya ya Automator, hanyuma agasoma ibyabitswe muri Reminders na Calendar. Reba [isuzuma n'imikoranire](#testing-and-compatibility) kugira ngo umenye aho ibyo bimenyetso bigarukira.

## Gutangira vuba: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Fungura inzira y'akazi muri Automator maze uyikoreshe kugira ngo ugerageze kwinjiza inshingano. Kugira ngo iboneke nka Service, shyira umupfunyiko muri `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Shyiraho impinanyuguti muri **System Settings → Keyboard → Keyboard Shortcuts → Services**. Emerera Automation kugera kuri Reminders igihe macOS ibigusabye. Andika:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Inzira y'akazi kavukire irema icyibutsa cyihutirwa cyane gifite itariki ntarengwa y'ejo, ikakiyobora ku rutonde rwa `shopping`, kandi ikabika imiterere yacyo. Hatariho ikimenyetso cy'umushinga cyangwa imiterere, kwinjiza vuba gukoresha `Inbox`.

## Imyandikire yo kwinjiza inshingano

Umusesenguzi kavukire w'inshingano n'uburyo bwa Alfred bwo kwinjiza inshingano bimenya ibi bimenyetso. Ibikoresho bihuza abatanga serivisi bifite uburyo bwabyo bwihariye bwo gukoresha ibice no kuyobora amakuru.

| Icyinjizwa | Igisobanuro | Urugero |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Uburemere bwo hejuru, buringaniye, cyangwa bwo hasi | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Itariki ntarengwa igereranywa | `Call dentist tomorrow` |
| Umunsi w'icyumweru cyangwa `next weekday` | Itariki ntarengwa y'umunsi w'icyumweru | `Send report next monday` |
| `due:YYYY-MM-DD` | Itariki ntarengwa yeruye | `Renew membership due:2027-03-15` |
| Isaha ijyanye n'itariki | Isaha ntarengwa | `Call Alex tomorrow at 3pm` |
| `@context` | Ikimenyetso cy'imiterere | `Buy milk @errands` |
| `+project` | Kuyobora ku mushinga/urutonde | `Draft outline +website` |

`due:today` na `due:tomorrow` na byo biremerwa. Koresha inyuguti, imibare, uturongo two hasi, cyangwa uturongo tugabanya mu bimenyetso by'imiterere n'imishinga. Kwinjiza vuba kavukire guha umwanya wa mbere kuyobora ku mushinga kurusha kuyobora ku miterere.

Kwinjiza muri Calendar gukoresha `@` ku hantu igikorwa kibera kandi kukemera igihe igikorwa kimara mu minota cyangwa mu masaha:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Hatariho isaha cyangwa igihe kimara byeruye, kwinjiza muri Calendar gukoresha saa 9:00 za mu gitondo n'isaha imwe, muri kalendari ya mbere ishobora kwandikwamo.

## Hitamo inzira y'akazi

### Inzira z'akazi kavukire za Apple

| Inzira y'akazi | Imikorere | Umupfunyiko |
| --- | --- | --- |
| Kwinjiza vuba | Sesengura inyandiko y'inshingano maze ureme icyibutsa | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Kwinjiza uvuye muri clipboard | Rema icyibutsa uvuye ku nyandiko iri muri clipboard | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Kwinjiza mu kivunge | Rema ibyibutsa uvuye ku mirongo myinshi | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Kwinjiza igikorwa | Rema igikorwa muri Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Isuzuma rya buri cyumweru | Isuzuma riyobowe no kwandika ibitekerezo byose nk'ibyibutsa | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Fungura umupfunyiko muri Automator kugira ngo uwugerageze, cyangwa uwushyire muri `~/Library/Services` kugira ngo uwugereho ukoresheje mwandikisho. Reminders na Calendar bisaba uruhushya rukwiye rwa macOS Automation.

### Alfred

Bisaba Alfred ifite Powerpack. Kubaka umupfunyiko uvuye kuri kode y'isoko iriho ubu:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Ushobora kandi gukurura umupfunyiko kuri [verisiyo zasohotse](https://github.com/somethingwithproof/MacGTD/releases). Imipfunyiko ya verisiyo zasohotse igaragaza kode yazo yashyizweho ikirango; ibishya byongewe kuri `main` nyuma ya verisiyo yasohotse bisaba kubaka uvuye kuri kode y'isoko.

| Ijambo ry'ibanze | Igikorwa |
| --- | --- |
| `task` | Kwinjiza inshingano hamwe no gusesengura itariki, imiterere, umushinga, n'uburemere bw'icyihutirwa |
| `note` | Kubika inyandiko y'ifashisho muri Reminders |
| `project` | Kurema urutonde rwa Reminders |
| `gtd process` | Gufungura Inbox kugira ngo isuzumwe n'umuntu |
| `clip` | Kwinjiza inyandiko iri muri clipboard |
| `gtd focus` | Gutangira igihe cyo kwibanda, kugenzura uko gihagaze, cyangwa guhagarika |
| `gtd analytics` | Gusuzuma igihe cyo kwibanda cyabitswe |
| `gtd preferences` | Guhindura igenamiterere ry'inzira y'akazi |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Igenamiterere ribikwa muri `~/Library/Preferences/com.alfredgtd.plist`; uko igihe cyo kwibanda gihagaze n'inyandiko z'ibyakozwe bibikwa muri `~/.gtd`. Igenamiterere rifite ibisanzwe byashyizwemo, kugenzura ubwoko bw'amakuru, kwinjiza amakuru yagenzuwe, no kwandika mu buryo butagabanyijemo ibice. Ibihe byo kwibanda ntibihindura igenamiterere ry'ibimenyesha bya sisitemu. Gutunganya Inbox bifungura urutonde ngo rusuzumwe; ntibyimurira cyangwa ngo birangize inshingano mu buryo bwikora.

Reba [inyandiko y'ubufasha ya Alfred](../../../workflows/alfred/README.md) hamwe n'[inyandiko z'isomero rya GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Ibikoresho bihuza kwinjiza amakuru hanze

Inzira enye zose zo kwinjiza amakuru zikoresha API zisuzumwa binyuze mu madirishya nyayo ya Automator n'isuzumiro ry'imbere rya TLS mu isuzuma rya E2E ricumbikiwe. Itsinda ryihariye rikorwa n'intoki risuzuma kubika nyako ku batanga serivisi igihe konti zabugenewe zateguwe. Things na OmniFocus bisaba itsinda ryo guhuza porogaramu za mudasobwa zifite uruhushya.

| Aho byerekeza | Uburyo | Itegura / isoko |
| --- | --- | --- |
| Todoist | Kwinjiza binyuze kuri API | [Inzira y'akazi n'itegura rya Keychain](../../../workflows/todoist/) |
| Notion | Kwinjiza binyuze kuri API y'isoko y'amakuru | [Inzira y'akazi n'itegura rya Keychain](../../../workflows/notion/) |
| Things 3 | Uburyo bwa URL scheme | [Inzira y'akazi](../../../workflows/things/) |
| OmniFocus | AppleScript / URL scheme | [Inzira y'akazi](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Inzira y'akazi](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Inzira y'akazi](../../../workflows/google/) |

Ibikoresho bihuza API bisaba gutegura ibyangombwa byo kwinjira; Microsoft ikenera uruhushya rwa OAuth rwatanzwe kandi Google Keep ikenera uburenganzira bwemewe bwa Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Reba [itegura rya API, kwimurira amakuru, n'ibisabwa ku ruhushya](../../../workflows/api/README.md). Indangamubare z'ububiko bw'amakuru bwa Notion zisanzwe zimurirwa gusa igihe habonetse isoko imwe gusa y'amakuru. Kwinjiza muri Microsoft na Google bikoresha API aho gukoresha inzira z'ubusamo za mushakisha zitanditse mu nyandiko. Udupfunyika tw'uruhushya rwa OAuth dusaba kuvugururwa binyuze ku mukiriya wawe wa OAuth. Amakuru yoherezwa akoresha imfunguzo za JSON zeruye, ubusabe bwa HTTPS bufite imipaka, no kwemeza igisubizo. Ubutumwa bw'amakosa bugumana ibisobanuro by'icyatumye bidakunda ariko bugahisha akamenyetso ka API kateguwe. Reba [SECURITY.md](../../../SECURITY.md) ku buryo bwo kumenyesha ibibazo by'umutekano.

### Umurongo w'ibikoresho wo hejuru na Shortcuts

[Inyandiko y'ubufasha y'umurongo w'ibikoresho wo hejuru](../../../workflows/menubar/README.md) isobanura umugereka utari itegeko wa SwiftBar/xbar. Banza ushyiremo Apple Services, hanyuma utegure ububiko bw'imigereka muri porogaramu y'umurongo w'ibikoresho wo hejuru maze uhuze `workflows/menubar/gtd-menubar.sh` muri bwo.

[Inyandiko y'ubufasha ya Shortcuts](../../../workflows/shortcuts/README.md) itanga itegura rikorwa n'intoki ryo kwinjiza inyandiko, clipboard, na Siri kuri macOS 12+. Shortcuts n'ikoreshwa ry'ijwi rya Siri ntibiri mu itsinda ry'amasuzuma ricumbikiwe.

## Imyubakire

Imipfunyiko ya Automator ishyinguramo AppleScript kugira ngo ishobore gukora nka Services kavukire. Alfred ipfunyika inyandiko z'ibikorwa kandi igatanga ibyinjijwe n'ukoresha nk'ingingo z'amabwiriza. GTDLib itanga ibikorwa kavukire bihuriweho bya Reminders bivuye ku isoko ya AppleScript ishobora guhindurwa hamwe n'umupfunyiko w'inyandiko wahinduwe mo kode ikora.

- **Umusesenguzi umwe nyakuri:** `scripts/sync-native-parser.py` ishyingura umusesenguzi uhuriweho muri Quick Capture na Event Capture; igenzura ritahura itandukaniro hagati y'isoko n'ibyahujwe.
- **Imiterere ihoraho y'igihe cyo kwibanda:** ibikorwa bihamagawe ukwabyo bisangira uko igihe cyo kwibanda gihagaze, hamwe n'imirimo ya launchd yihariye n'ibarura ry'igihe cyashize rifite imipaka.
- **Imipfunyiko ishobora kongera kubakwa kimwe:** gupfunyika kubaka ububiko bushya, kandi amasuzuma akagereranya ibirimo n'isoko. Isomero rifite inyandiko yaryo yihariye yo kurihindura mo kode ikora.
- **Amasuzuma ashobora gukurikiranwa:** raporo za JUnit, inyandiko z'amabwiriza, n'ibikoresho byubatswe byasuzumwe bibikwa iminsi 14 muri GitHub Actions.

| Ububiko | Inshingano |
| --- | --- |
| [`workflows/`](../../../workflows/) | Imipfunyiko kavukire, ibihuza abatanga serivisi, Alfred, Shortcuts, n'inyandiko z'umurongo w'ibikoresho wo hejuru |
| [`scripts/`](../../../scripts/) | Gupfunyika, guhindura isomero mo kode ikora, guhuza umusesenguzi, no gutegura amasuzuma acumbikiwe |
| [`tests/`](../../../tests/) | Igenzura, isuzuma ry'ibice, na E2E kavukire ya mudasobwa |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E ya buri joro/y'intoki, no kwita ku bubiko bwa kode |
| [`infra/`](../../../infra/) | Itegura ritari itegeko rya mudasobwa ya Mac y'imbere n'iya EC2; CI icumbikiwe ntibisaba |

<a name="testing-and-compatibility"></a>

## Isuzuma n'imikoranire

| Urwego | Imiterere y'isuzuma | Ibigenzurwa |
| --- | --- | --- |
| Igenzura | macOS 15 na 26 zicumbikiwe kuri GitHub | Guhindura AppleScript mo kode ikora, imipfunyiko, umusesenguzi nyakuri, intego z'ibikorwa, igenamiterere, uko igihe cyo kwibanda gihagaze, itumanaho rya API ku isuzumiro, no gupfunyika no kongera kugenzura |
| Igenzura ry'umutekano | Ubuntu na macOS 15 zicumbikiwe kuri GitHub | Python CodeQL, ShellCheck, n'isuzuma rya fuzzing rya Atheris rifite imipaka ku musesenguzi nyakuri wahinduwe mo kode ikora |
| E2E y'ibihuza abatanga serivisi | `macos-15-intel` icumbikiwe kuri GitHub | Amadirishya ane yose nyakuri ya API, itumanaho rya TLS, kubika no gusoma ku isuzumiro, ibibazo bya API, guhagarika, no guhitamo isoko ya Notion |
| E2E nyayo ku batanga serivisi | Isuzuma rikorwa n'intoki kuri Mac icumbikiwe kuri GitHub rifite amabanga yabugenewe | Kwinjiza nyako no kongera gusoma kuri Todoist, Notion, Microsoft, na Google; riratsindwa igihe konti zibuze |
| Guhuza porogaramu za mudasobwa zifite uruhushya | Konti y'imbere yabugenewe | Guhamagara no kubika kuri Things 3, OmniFocus 4, na UI ya Alfred |
| E2E kavukire ya mudasobwa | `macos-15-intel` icumbikiwe kuri GitHub | Amadirishya nyayo ya Automator; amakuru yabitswe ya Reminders na Calendar; isuzuma rya buri cyumweru; imibare yo ku murongo w'ibikoresho; GTDLib yahinduwe mo kode ikora; ibikorwa kavukire bya Alfred bipfunyitse; kurangira no guhagarika nyako kw'ibipimo by'igihe bya launchd |
| UI ya Alfred itari itegeko | Konti y'imbere yabugenewe, Alfred 5 + Powerpack | Kwinjiza inzira y'akazi, guhamagara hakoreshejwe ijambo ry'ibanze, no kongera gusoma ibyibutsa binyuze kuri UI ifite uruhushya |

[Isuzuma ryagenzuwe ryo kuvugurura API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ryatsinze **amasuzuma 35 y'igenzura kuri buri rubuga rw'igenzura n'amasuzuma 26 ya E2E ya mudasobwa**, nta gutsindwa, amakosa, cyangwa ibyasimbutswe. Isuzuma rya mudasobwa ririmo amasuzuma 15 kavukire n'amasuzuma 11 y'ibihuza abatanga serivisi, harimo igenzura nyaryo ry'irangira ry'igihe cy'itumanaho n'ibibazo by'akanya gato bya Keychain. Igenzura rikora kandi isuzuma ry'imiterere y'ububiko bwa kode. Ibi bisubizo bireba imikorere kavukire n'amasuzumiro y'abatanga serivisi; ntibyemeza imikoranire nyayo ku mirongo y'abatanga serivisi cyangwa kuri porogaramu zifite uruhushya. Uko bihagaze ubu bigaragazwa n'ibirango biri haruguru.

Pull requests no kohereza impinduka kuri `main` bikora igenzura rigakurikirwa na E2E kavukire. Inzira y'akazi ya E2E ikora kandi buri joro n'igihe itangijwe n'intoki, harimo amasuzuma adahindagurika y'ibihuza abatanga serivisi. Amasuzuma nyayo ku batanga serivisi akoresha inzira y'akazi yihariye itangizwa n'intoki ya `live-e2e.yml`. CI isanzwe ikoresha mudasobwa za Mac zicumbikiwe kuri GitHub zikoreshwa rimwe, amasuzumiro atandukanyijwe, n'imikorere igengwa ifite imipaka; nta seriveri y'umukoresha bwite cyangwa ibyangombwa byo kwinjira bya konti zo hanze bikenewe ku itsinda risanzwe. Itsinda nyaryo ritangizwa n'intoki risaba amabanga yabugenewe y'abatanga serivisi.

Verisiyo za kera za macOS ntizigenzurwa na CI iriho ubu. Amasuzuma nyayo ku batanga serivisi asaba amabanga yabugenewe kandi ntaragenzurwa. Shortcuts/Siri na porogaramu za mudasobwa zifite uruhushya biri hanze y'itsinda risanzwe ricumbikiwe. Amasuzuma y'ibikorwa kavukire asuzuma inyandiko za Alfred zipfunyitse mu buryo butaziguye; ntiyemeza imikoranire yuzuye ya UI ya Alfred. Reba [itegura ry'isuzuma, ibisabwa mbere, n'ibigenzurwa](../../../tests/e2e/README.md).

## Indimi n'ihinduranyandiko

Inyandiko zigaragarira ukoresha muri CLI, mu gikoresho gikora isuzuma, no ku murongo w'ibikoresho wo hejuru ziboneka mu ndimi 45 (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) muri `locales/` binyuze kuri `scripts/i18n.py` hatagombye ibindi bikoresho by'abandi. Guhitamo ururimi kubanza kugenzura `--lang`, hagakurikiraho `LC_ALL`, `LC_MESSAGES`, na `LANG`, byabura hagakoreshwa `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Iterambere rya porogaramu

Shyiramo [mise](https://mise.jdx.dev/) kandi ukoreshe verisiyo ya Python yemejwe muri `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Igenzura ryandika raporo muri `test-results/`; inyandiko zo kubaka zandika muri `dist/`. Kugira ngo ukore itsinda ry'amasuzuma ya mudasobwa ricumbikiwe kuri `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

E2E ya mudasobwa y'imbere isaba konti y'isuzuma yabugenewe yinjiyemo hamwe n'uruhushya rusobanuwe mu [nyandiko y'ubufasha ya E2E](../../../tests/e2e/README.md). Inyandiko itegura uruhushya icumbikiwe igenewe gusa imirimo icumbikiwe kuri GitHub ikoreshwa rimwe.

Koresha [Conventional Commits](https://www.conventionalcommits.org/) kandi ukurikize [CONTRIBUTING.md](../../../CONTRIBUTING.md). Impinduka za vuba zanditswe muri [CHANGELOG.md](../../../CHANGELOG.md).

Ingamba z'umutekano, igenzura ry'imikono ya verisiyo zasohotse, n'imbogamizi za Scorecard zisigaye bisobanuwe mu [isuzuma ry'umutekano](../../../docs/security-assessment.md).
Inzira y'akazi yo gusohora verisiyo yubaka kandi ikemeza imipfunyiko mbere yo kurema inyandiko y'ibanze ya verisiyo,
harimo amakuru y'inkomoko ya in-toto yasinywe n'imipfunyiko ya Sigstore yagenzuwe ugereranyije na
commit y'isoko na ref. Amakuru mashya y'inkomoko areba izo nyubako z'inzira y'akazi gusa, ntabwo areba
ibyakuruwe mbere.

## Amateka y'umushinga n'uruhushya

MacGTD ihuriza hamwe ububiko bwa kera bwa MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, na AlfredGTD. Ifite uruhushya rwa [MIT License](../../../LICENSE).
