# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · **Hausa** · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD tarin hanyoyin aiki ne na macOS don ɗaukar ayyuka, tsara tunatarwa, da gudanar da zaman mai da hankali mai ƙayyadadden lokaci tare da manhajojin da kuke amfani da su tuni.**

An gina shi a kan tsarin [Getting Things Done](https://gettingthingsdone.com/), inda yake kawo ɗaukar bayanai ta hanyar tagar tattaunawa, allon kwafi, da ɗaukar rukuni zuwa Apple Reminders; ɗaukar al'amura zuwa Calendar; da kuma umarnin ayyuka, bayanan kula, shirye-shirye, da mai da hankali zuwa Alfred. AppleScript da Automator suna sa hanyoyin aikin asali su yi aiki kusa da tsarin macOS. Masu haɗin API suna amfani da Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, da Google Keep v1. An kuma haɗa da masu haɗin Things da OmniFocus. Gwajin da aka gudanar a sabar yana tabbatar da masu haɗin API da wani samfurin gwajin HTTPS na gida; dacewa kai tsaye a zahiri har yanzu tana buƙatar keɓaɓɓun asusun masu samar da sabis.

## Abin da za ku iya yi

- **Ɗauki ayyuka ba tare da canza manhaja ba.** Yi amfani da Automator Service, kalmar umarnin Alfred, ko allon kwafi don ƙara aiki. Ɗaukar rukuni tana ƙirƙirar tunatarwa ɗaya ga kowane layin da ba fanko ba.
- **Mayar da rubutu ya zama ayyuka masu tsari.** Fitar da kwanakin wata na dangi da na ISO, lokuta, fifiko, yanayi, da shirye-shirye ta amfani da mai tantance rubutu na AppleScript da ɗaukar gaggawa ta asali da ɗaukar Calendar ke amfani da shi tare.
- **Ɗauki al'amura kuma ku duba akwatin saƙonku.** Ƙirƙiri al'amuran Calendar masu lokaci, tsawon lokaci, da wuri; gudanar da bitar mako-mako mai matakai biyar tare da zube tunani kai tsaye zuwa cikin Reminders.
- **Yi aiki a cikin zaman mai da hankali mai ƙayyadadden lokaci.** Fara, duba, kuma ku dakatar da zama a tsakanin matakai daban-daban. Masu ƙidayar lokaci na launchd da zama ya mallaka suna kula da ƙarewar lokaci da sokewa; rajistar JSONL tana ba da ƙididdigar tsawon lokaci.
- **Yi amfani da Alfred fiye da ayyuka kawai.** Ƙirƙiri jerin Reminders don shirye-shirye, adana bayanan kula na tunani, buɗe akwatin saƙo don bita, ɗauki rubutun allon kwafi, kuma ku gyara zaɓuɓɓukan da aka tsara nau'insu.
- **Duba akwatin saƙonku daga sandar menu.** Ƙarin manhajar SwiftBar/xbar na zaɓi yana nuna adadin ayyukan da ba a kammala ba a akwatin saƙo tare da hanyoyin shiga ayyukan ɗauka.

Ana tabbatar da aikin asali a kan ainihin kwamfutocin Mac da GitHub ke ɗaukar nauyinsu: gwaje-gwaje suna sarrafa tagogin tattaunawa na Automator, sannan su sake karanta bayanan Reminders da Calendar. Duba [gwaji da dacewa](#testing-and-compatibility) don faɗin wannan shaidar.

## Farawa cikin sauri: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Buɗe hanyar aikin a cikin Automator kuma ku gudanar da ita don gwada ɗauka. Don ta zama samuwa a matsayin Service, shigar da kunshin a ƙarƙashin `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Saita gajeriyar hanya a **System Settings → Keyboard → Keyboard Shortcuts → Services**. Ba da izinin Automation ga Reminders lokacin da macOS ya tambaya. Shigar da:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Hanyar aikin asali tana ƙirƙirar tunatarwa mai babban fifiko wadda wa'adinta yake gobe, ta tura ta zuwa jerin `shopping`, sannan ta adana yanayin. Ba tare da alamar shiri ko yanayi ba, ɗaukar gaggawa tana amfani da `Inbox`.

## Tsarin rubutun ɗauka

Mai tantance ayyuka na asali da ɗaukar ayyuka ta Alfred suna gane waɗannan alamomin. Masu haɗin masu samar da sabis suna da nasu goyon bayan filaye da tura bayanai.

| Shigarwa | Ma'ana | Misali |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Babban fifiko, matsakaici, ko ƙarami | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Ranar ƙarshe ta dangi | `Call dentist tomorrow` |
| Ranar mako ko `next weekday` | Ranar ƙarshe ta ranar mako | `Send report next monday` |
| `due:YYYY-MM-DD` | Takamaiman ranar ƙarshe | `Renew membership due:2027-03-15` |
| Lokaci tare da rana | Lokacin ƙarshe | `Call Alex tomorrow at 3pm` |
| `@context` | Alamar yanayi | `Buy milk @errands` |
| `+project` | Tura zuwa shiri/jeri | `Draft outline +website` |

Ana kuma karɓar `due:today` da `due:tomorrow`. Yi amfani da haruffa, lambobi, layin ƙasa, ko gajeriyar alamar haɗi a cikin alamomin yanayi da shiri. Ɗaukar gaggawa ta asali tana ba da fifiko ga tura bayanai ta shiri fiye da tura bayanai ta yanayi.

Ɗaukar Calendar tana amfani da `@` don wurin al'amari kuma tana karɓar tsawon lokaci a mintuna ko sa'o'i:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Ba tare da takamaiman lokaci ko tsawon lokaci ba, ɗaukar Calendar tana amfani da ƙarfe 9:00 na safe da awa ɗaya, a cikin kalandar farko da za a iya rubutu a cikinta.

## Zaɓi hanyar aiki

### Hanyoyin aikin Apple na asali

| Hanyar aiki | Ayyuka | Kunshi |
| --- | --- | --- |
| Ɗaukar gaggawa | Tantance rubutun aiki kuma a ƙirƙiri tunatarwa | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Ɗaukar allon kwafi | Ƙirƙiri tunatarwa daga rubutun allon kwafi | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Ɗaukar rukuni | Ƙirƙiri tunatarwa daga layuka masu yawa | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Ɗaukar al'amari | Ƙirƙiri al'amarin Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Bitar mako-mako | Bita mai jagora da zube tunani a cikin tunatarwa | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Buɗe kunshi a cikin Automator don gwada shi, ko shigar da shi a ƙarƙashin `~/Library/Services` don amfani ta hanyar madannai. Reminders da Calendar suna buƙatar izinin Automation na macOS da ya dace.

### Alfred

Yana buƙatar Alfred tare da Powerpack. Gina fakitin daga lambar tushe ta yanzu:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Haka kuma za ku iya sauke fakitin daga [fitarwa (releases)](https://github.com/somethingwithproof/MacGTD/releases). Fakitocin da aka fitar suna nuna lambar tushe mai alama; fasalolin da aka ƙara zuwa `main` bayan fitarwa suna buƙatar ginawa daga lambar tushe.

| Kalmar umarni | Aiki |
| --- | --- |
| `task` | Ɗauki aiki tare da tantance kwanan wata, yanayi, shiri, da fifiko |
| `note` | Adana bayanin kula na tunani a cikin Reminders |
| `project` | Ƙirƙiri jerin Reminders |
| `gtd process` | Buɗe Inbox don bitar ɗan'adam |
| `clip` | Ɗauki rubutun allon kwafi |
| `gtd focus` | Fara zaman mai da hankali, duba matsayi, ko dakatarwa |
| `gtd analytics` | Duba tsawon lokutan mai da hankali da aka adana |
| `gtd preferences` | Gyara zaɓuɓɓukan hanyar aiki |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Zaɓuɓɓuka suna zaune a `~/Library/Preferences/com.alfredgtd.plist`; yanayin mai da hankali da rajista suna ƙarƙashin `~/.gtd`. Zaɓuɓɓuka suna da tsoffin ƙimomi na asali, binciken nau'i, shigarwa mai inganci, da rubutu gaba ɗaya ba tare da rabi ba. Zaman mai da hankali ba ya canza saitunan sanarwar tsarin. Sarrafa Inbox yana buɗe jerin don bita; ba ya matsar da ayyuka ko kammala su ta atomatik.

Duba [jagorar Alfred](../../../workflows/alfred/README.md) da [takardun ɗakin karatu na GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Masu haɗin ɗauka na waje

Ana gwada duka hanyoyin aikin ɗaukar API guda huɗu ta hanyar ainihin tagogin tattaunawa na Automator da samfurin TLS na gida a cikin gwajin E2E na sabar. Wani keɓaɓɓen rukunin gwaji na hannu yana gwada ainihin adanawa a wurin mai samar da sabis lokacin da aka saita keɓaɓɓun asusu. Things da OmniFocus suna buƙatar rukunin gwajin haɗin kwamfutar tebur mai lasisi.

| Manufa | Tsari | Saiti / lambar tushe |
| --- | --- | --- |
| Todoist | Ɗaukar API | [Saitin hanyar aiki da Keychain](../../../workflows/todoist/) |
| Notion | Ɗaukar API na tushen bayanai | [Saitin hanyar aiki da Keychain](../../../workflows/notion/) |
| Things 3 | Tsarin URL | [Hanyar aiki](../../../workflows/things/) |
| OmniFocus | AppleScript / Tsarin URL | [Hanyar aiki](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Hanyar aiki](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Hanyar aiki](../../../workflows/google/) |

Masu haɗin API suna buƙatar saitin takardun shaidar shiga; Microsoft yana buƙatar izinin OAuth da aka wakilta, Google Keep kuma yana buƙatar damar shiga Workspace da ta cancanta:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Duba [saitin API, ƙaura, da buƙatun izini](../../../workflows/api/README.md). Lambobin shaidar rumbun adana bayanai na Notion da ke akwai suna ƙaura ne kawai lokacin da aka sami tushen bayanai ɗaya tak. Ɗaukar Microsoft da Google suna amfani da API maimakon gajerun hanyoyin burauza da ba a rubuta su ba. Alamar shiga ta OAuth tana buƙatar sabuntawa ta hanyar abokin hulɗar OAuth ɗinku. Bayanan da ake turawa suna amfani da maɓallan JSON bayyanannu, buƙatun HTTPS masu iyaka, da tabbatar da amsa. Saƙonnin kuskure suna riƙe bayanan gazawa yayin da suke ɓoye alamar API da aka saita. Duba [SECURITY.md](../../../SECURITY.md) don bayar da rahoton matsalolin tsaro.

### Sandar menu da Shortcuts

[Jagorar sandar menu](../../../workflows/menubar/README.md) tana bayanin ƙarin manhajar SwiftBar/xbar na zaɓi. Fara shigar da Apple Services tukuna, sannan ku saita kundin ƙarin manhajar a cikin manhajar sandar menu ɗinku kuma ku haɗa `workflows/menubar/gtd-menubar.sh` zuwa cikinsa.

[Jagorar Shortcuts](../../../workflows/shortcuts/README.md) tana ba da saiti na hannu don ɗaukar rubutu, allon kwafi, da Siri a kan macOS 12+. Shortcuts da kunna Siri da murya suna wajen rukunin gwajin sabar.

## Tsarin gini

Kunshin Automator suna haɗa AppleScript a cikinsu domin su iya yin aiki a matsayin Services na asali. Alfred yana haɗa rubutun ayyuka a cikin fakiti kuma yana tura shigarwar mai amfani a matsayin sigogi. GTDLib tana bayar da ayyukan Reminders na asali na gama-gari daga lambar tushe ta AppleScript da za a iya gyarawa da kuma kunshin rubutu da aka haɗa.

- **Mai tantancewa ɗaya na aiki:** `scripts/sync-native-parser.py` yana sanya mai tantancewa na gama-gari a cikin Ɗaukar Gaggawa da Ɗaukar Al'amari; tantancewa tana gano karkacewar lambar tushe.
- **Dorewar yanayin mai da hankali:** kiraye-kiraye daban-daban suna raba yanayin zama, tare da ayyukan launchd da aka mallaka da ƙididdigar lokacin da ya wuce mai iyaka.
- **Fakitoci masu iya sake ginawa iri ɗaya:** haɗa fakiti yana gina sabon rumbun adanawa, kuma gwaje-gwaje suna kwatanta abin da ke cikinsa da lambar tushe. Ɗakin karatun yana da keɓaɓɓen rubutun haɗawa.
- **Gwaje-gwaje masu sauƙin dubawa:** ana adana rahotannin JUnit, rajistar umarni, da kayayyakin ginawa da aka gwada na tsawon kwanaki 14 a cikin GitHub Actions.

| Kundi | Nauyi |
| --- | --- |
| [`workflows/`](../../../workflows/) | Kunshin asali, masu haɗin masu samar da sabis, Alfred, Shortcuts, da rubutun sandar menu |
| [`scripts/`](../../../scripts/) | Haɗa fakiti, haɗa ɗakin karatu, daidaita mai tantancewa, da tanadin gwajin sabar |
| [`tests/`](../../../tests/) | Tabbatarwa, binciken sassa, da gwajin E2E na kwamfutar tebur ta asali |
| [`.github/workflows/`](../../../.github/workflows/) | CI, gwajin E2E na dare/hannu, da kula da ma'ajiyar lamba |
| [`infra/`](../../../infra/) | Saitin mai gudanar da Mac na gida da EC2 na zaɓi; CI na sabar ba ya buƙatarsa |

## Gwaji da dacewa

| Faɗi | Yanayi | Abin da ake dubawa |
| --- | --- | --- |
| Tabbatarwa | macOS 15 da 26 na sabar GitHub | Haɗa AppleScript, kunshi, mai tantancewa na aiki, manufofin ayyuka, zaɓuɓɓuka, yanayin mai da hankali, isar da API na samfurin gwaji, da gwajin zagayowar fakiti |
| Binciken tsaro | Ubuntu da macOS 15 na sabar GitHub | Python CodeQL, ShellCheck, da gwajin binciken kurakurai na Atheris mai iyaka a kan mai tantancewa da aka haɗa |
| E2E na masu haɗin sabis | `macos-15-intel` na sabar GitHub | Duka tagogin tattaunawa na API guda huɗu, isar da TLS, adanawa/sake karantawa a samfurin gwaji, gazawar API, sokewa, da zaɓin tushen bayanai na Notion |
| E2E na masu samar da sabis kai tsaye | Gudanar da Mac na sabar GitHub da hannu tare da keɓaɓɓun sirri | Ainihin ɗauka da sake karantawa a Todoist, Notion, Microsoft, da Google; yana gazawa idan babu asusu |
| Haɗin kwamfutar tebur mai lasisi | Keɓaɓɓen asusun gida | Kira da adanawa ta UI na Things 3, OmniFocus 4, da Alfred |
| E2E na kwamfutar tebur ta asali | `macos-15-intel` na sabar GitHub | Ainihin tagogin tattaunawa na Automator; bayanan Reminders da Calendar da aka adana; bitar mako-mako; adadin menu; GTDLib da aka haɗa; ayyukan asali na Alfred da aka haɗa a fakiti; ainihin ƙarewar lokaci da soke mai ƙidayar lokaci na launchd |
| UI na Alfred na zaɓi | Keɓaɓɓen asusun gida, Alfred 5 + Powerpack | Shigar da hanyar aiki, kira da kalmar umarni, da sake karanta tunatarwa ta hanyar UI mai lasisi |

[Gudanarwar sabunta API da aka tabbatar](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ta wuce **gwaje-gwajen tabbatarwa 35 a kowane dandalin tabbatarwa da gwaje-gwajen E2E na kwamfutar tebur 26**, ba tare da wata gazawa, kuskure, ko tsallakewa ba. Rufe kwamfutar tebur ya ƙunshi gwaje-gwajen asali 15 da gwaje-gwajen masu haɗin sabis 11, gami da ainihin ƙarewar lokacin isar da saƙo da binciken Keychain na wucin gadi. Tabbatarwa tana kuma gudanar da binciken tsarin ma'ajiyar lamba. Waɗannan sakamakon suna rufe aikin asali da samfuran gwajin masu samar da sabis; ba su tabbatar da dacewa kai tsaye da masu samar da sabis ko manhajojin lasisi ba. Alamomin da ke sama suna nuna halin da ake ciki yanzu.

Buƙatun jawo gyare-gyare da tura canje-canje zuwa `main` suna gudanar da tabbatarwa sannan sai E2E na asali. Hanyar aikin E2E tana kuma aiki kowane dare da kuma lokacin da aka kunna ta da hannu, gami da gwaje-gwajen masu haɗin sabis masu tsayayyen sakamako. Gwaje-gwajen masu samar da sabis kai tsaye suna amfani da keɓaɓɓiyar hanyar aikin hannu ta `live-e2e.yml`. Tsohon CI yana amfani da kwamfutocin Mac na sabar GitHub na wucin gadi, samfuran gwaji keɓaɓɓu, da ƙananan matakai masu iyaka; ba a buƙatar mai gudanarwa na kai ko takardun shaidar asusun waje don rukunin gwajin asali. Rukunin gwajin kai tsaye na hannu yana buƙatar keɓaɓɓun sirrin masu samar da sabis.

Tsoffin nau'ikan macOS ba a tabbatar da su ta hanyar CI na yanzu ba. Gudanarwar masu samar da sabis kai tsaye suna buƙatar keɓaɓɓun sirri kuma har yanzu ba a tabbatar da su ba. Shortcuts/Siri da manhajojin kwamfutar tebur masu lasisi suna wajen rukunin gwajin sabar na asali. Gwaje-gwajen ayyukan asali suna gwada rubutun Alfred da aka haɗa a fakiti kai tsaye; ba su tabbatar da cikakkiyar dacewar UI na Alfred ba. Duba [saitin gwaji, sharuɗɗan farko, da faɗin rufewa](../../../tests/e2e/README.md).

## Fassarar harsuna

Rubutun CLI na mai amfani, mai gudanar da gwaji, da sandar menu suna zuwa cikin harsuna da yankuna 45 (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) a ƙarƙashin `locales/` ta hanyar `scripts/i18n.py` ba tare da wata dogara ga ɗakunan karatu na waje ba. Zaɓin harshe yana duba `--lang`, sannan `LC_ALL`, `LC_MESSAGES`, da `LANG`, tare da komawa zuwa `en` idan ba a saita ba.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Haɓakawa

Shigar da [mise](https://mise.jdx.dev/) kuma ku yi amfani da nau'in Python da aka ƙayyade a cikin `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Tabbatarwa tana rubuta rahotanni a ƙarƙashin `test-results/`; rubutun ginawa suna rubutawa zuwa `dist/`. Don gudanar da rukunin gwajin kwamfutar tebur na sabar a kan `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Gwajin E2E na kwamfutar tebur ta gida yana buƙatar keɓaɓɓen asusun gwaji da aka shiga da shi da kuma izinin da aka bayyana a cikin [jagorar E2E](../../../tests/e2e/README.md). Rubutun bayar da izini na sabar an taƙaita shi ne ga ayyukan sabar GitHub na wucin gadi kawai.

Yi amfani da [Conventional Commits](https://www.conventionalcommits.org/) kuma ku bi [CONTRIBUTING.md](../../../CONTRIBUTING.md). An rubuta canje-canjen baya-bayan nan a cikin [CHANGELOG.md](../../../CHANGELOG.md).

An rubuta matakan tsaro, tabbatar da sa hannun fitarwa, da sauran iyakokin Scorecard
a cikin [ƙimar tsaro](../../../docs/security-assessment.md).
Hanyar aikin fitarwa tana ginawa da tabbatar da fakitoci kafin ƙirƙirar daftarin fitarwa,
gami da shaidar asali ta in-toto mai sa hannu da kunshin Sigstore da aka tabbatar da su a kan
lambar commit da ref na asali. Sabuwar shaidar asali tana aiki ne ga waɗannan ginin hanyar aiki, ba
tsoffin sauke-sauke ba.

## Tarihin aikin da lasisi

MacGTD yana haɗa tsoffin ma'ajiyar lamba na MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, da AlfredGTD wuri guda. Yana da lasisi a ƙarƙashin [MIT License](../../../LICENSE).
