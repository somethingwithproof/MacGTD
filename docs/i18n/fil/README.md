# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · **Filipino** · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**Ang MacGTD ay isang koleksyon ng mga workflow sa macOS para sa pagkuha ng mga gawain, pag-oorganisa ng mga paalala, at pagpapatakbo ng mga naka-timer na focus session gamit ang mga app na ginagamit mo na.**

Binuo batay sa [Getting Things Done](https://gettingthingsdone.com/), nagdadala ito ng dialog, clipboard, at batch capture sa Apple Reminders; pagkuha ng event sa Calendar; at mga command para sa task, note, project, at focus sa Alfred. Pinananatili ng AppleScript at Automator na malapit sa macOS ang mga native na workflow. Gumagamit ang mga API adapter ng Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, at Google Keep v1. Kasama rin ang mga adapter para sa Things at OmniFocus. Sinusuri ng mga hosted test ang mga API adapter laban sa isang lokal na HTTPS fixture; kailangan pa rin ng mga nakalaang provider account para sa live na compatibility.

## Ang mga magagawa mo

- **Kumuha ng gawain nang hindi nagpapalit ng app.** Gumamit ng Automator Service, isang keyword sa Alfred, o ng clipboard para magdagdag ng gawain. Gumagawa ang batch capture ng isang paalala sa bawat linyang hindi blangko.
- **Gawing nakaayos na mga gawain ang teksto.** I-parse ang mga relative at ISO na petsa, oras, priyoridad, konteksto, at proyekto gamit ang production AppleScript parser na ibinabahagi ng native quick capture at Calendar capture.
- **Kumuha ng mga event at suriin ang iyong inbox.** Gumawa ng mga event sa Calendar na may oras, tagal, at lokasyon; magpatakbo ng limang hakbang na lingguhang pagsusuri na may brain dump papunta sa Reminders.
- **Magtrabaho sa mga naka-timer na focus session.** Magsimula, magsuri, at magpahinto ng mga session sa iba't ibang proseso. Ang mga timer ng launchd na pagmamay-ari ng session ang humahawak sa pag-expire at pagkansela; ang mga log ng JSONL ang nagbibigay ng analytics sa tagal.
- **Gamitin ang Alfred nang higit pa sa mga gawain.** Gumawa ng mga listahan sa Reminders para sa mga proyekto, mag-save ng mga reference note, buksan ang inbox para sa pagsusuri, kumuha ng teksto mula sa clipboard, at mag-edit ng mga naka-type na kagustuhan.
- **Tingnan ang iyong inbox mula sa menu bar.** Ipinapakita ng opsyonal na plugin ng SwiftBar/xbar ang bilang ng mga hindi pa tapos sa inbox at mga link sa mga workflow ng pagkuha.

Sinusuri ang native na gawi sa mga totoong Mac na naka-host sa GitHub: pinapagana ng mga test ang mga dialog ng Automator, pagkatapos ay binabasa muli ang mga rekord ng Reminders at Calendar. Tingnan ang [pagsubok at compatibility](#testing-and-compatibility) para sa saklaw ng ebidensyang iyon.

## Mabilisang pagsisimula: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Buksan ang workflow sa Automator at patakbuhin ito upang subukan ang pagkuha. Upang maging available ito bilang isang Service, i-install ang bundle sa ilalim ng `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Magtalaga ng shortcut sa **System Settings → Keyboard → Keyboard Shortcuts → Services**. Payagan ang access ng Automation sa Reminders kapag nagtanong ang macOS. Ilagay ang:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Gumagawa ang native na workflow ng isang paalalang may mataas na priyoridad na nakatakda bukas, ipinapasa ito sa listahang `shopping`, at itinatala ang konteksto. Kung walang marker ng proyekto o konteksto, ginagamit ng quick capture ang `Inbox`.

## Syntax ng pagkuha

Kinikilala ng native na task parser at ng Alfred task capture ang mga marker na ito. Ang mga provider adapter ay may sariling suporta sa field at pagruruta.

| Input | Kahulugan | Halimbawa |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Mataas, katamtaman, o mababang priyoridad | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Relative na takdang petsa | `Call dentist tomorrow` |
| Araw ng linggo o `next weekday` | Takdang petsa sa araw ng linggo | `Send report next monday` |
| `due:YYYY-MM-DD` | Tiyak na takdang petsa | `Renew membership due:2027-03-15` |
| Oras kasama ng isang petsa | Takdang oras | `Call Alex tomorrow at 3pm` |
| `@context` | Marker ng konteksto | `Buy milk @errands` |
| `+project` | Pagruruta ng proyekto/listahan | `Draft outline +website` |

Tinatanggap din ang `due:today` at `due:tomorrow`. Gumamit ng mga titik, numero, underscore, o gitling sa mga marker ng konteksto at proyekto. Binibigyan ng native quick capture ng prayoridad ang pagruruta ng proyekto kaysa sa pagruruta ng konteksto.

Ginagamit ng Calendar capture ang `@` para sa lokasyon ng event at tumatanggap ng tagal sa minuto o oras:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Kung walang tiyak na oras o tagal, ginagamit ng Calendar capture ang 9:00 AM at isang oras, sa unang calendar na maaaring sulatan.

## Pumili ng workflow

### Mga native na Apple workflow

| Workflow | Gawi | Bundle |
| --- | --- | --- |
| Quick capture | I-parse ang teksto ng gawain at gumawa ng paalala | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Clipboard capture | Gumawa ng paalala mula sa teksto sa clipboard | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Batch capture | Gumawa ng mga paalala mula sa maraming linya | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Event capture | Gumawa ng event sa Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Weekly review | Ginabayang pagsusuri at brain dump sa paalala | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Buksan ang isang bundle sa Automator upang subukan ito, o i-install ito sa ilalim ng `~/Library/Services` para sa access gamit ang keyboard. Kailangan ng Reminders at Calendar ang mga naaangkop na pahintulot sa macOS Automation.

### Alfred

Kinakailangan ang Alfred na may Powerpack. I-build ang package mula sa kasalukuyang source:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Maaari mo ring i-download ang package mula sa [mga release](https://github.com/somethingwithproof/MacGTD/releases). Sinasalamin ng mga release package ang kanilang naka-tag na source; ang mga feature na idinagdag sa `main` pagkatapos ng isang release ay nangangailangan ng source build.

| Keyword | Aksyon |
| --- | --- |
| `task` | Kumuha ng gawain na may pag-parse ng petsa, konteksto, proyekto, at priyoridad |
| `note` | Mag-imbak ng reference note sa Reminders |
| `project` | Gumawa ng listahan sa Reminders |
| `gtd process` | Buksan ang Inbox para sa pagsusuri ng tao |
| `clip` | Kumuha ng teksto mula sa clipboard |
| `gtd focus` | Magsimula ng focus session, suriin ang status, o ihinto |
| `gtd analytics` | Suriin ang mga naitalang tagal ng focus |
| `gtd preferences` | I-edit ang mga kagustuhan ng workflow |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Nakatira ang mga kagustuhan sa `~/Library/Preferences/com.alfredgtd.plist`; nakatira naman ang estado ng focus at mga log sa ilalim ng `~/.gtd`. Ang mga kagustuhan ay may mga built-in na default, pagsusuri ng uri, na-validate na pag-import, at mga atomic write. Hindi binabago ng mga focus session ang mga setting ng notification ng system. Binubuksan ng pagproseso ng inbox ang listahan para sa pagsusuri; hindi nito awtomatikong inililipat o tinatapos ang mga gawain.

Tingnan ang [gabay sa Alfred](../../../workflows/alfred/README.md) at [dokumentasyon ng library ng GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Mga panlabas na adapter ng pagkuha

Sinusubukan ang lahat ng apat na API capture workflow sa pamamagitan ng mga totoong dialog ng Automator at isang lokal na TLS fixture sa hosted E2E. Isang hiwalay na manual na suite ang sumusubok sa totoong pag-save sa vendor kapag may naka-configure na mga nakalaang account. Kinakailangan ng Things at OmniFocus ang lisensyadong desktop integration suite.

| Target | Mekanismo | Pag-setup / source |
| --- | --- | --- |
| Todoist | Pagkuha gamit ang API | [Pag-setup ng Workflow at Keychain](../../../workflows/todoist/) |
| Notion | Pagkuha gamit ang data source API | [Pag-setup ng Workflow at Keychain](../../../workflows/notion/) |
| Things 3 | URL scheme | [Workflow](../../../workflows/things/) |
| OmniFocus | AppleScript / URL scheme | [Workflow](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Workflow](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Workflow](../../../workflows/google/) |

Nangangailangan ng pag-setup ng credential ang mga API adapter; kailangan ng Microsoft ang delegated na pahintulot ng OAuth at kailangan ng Google Keep ang kwalipikadong access sa Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Tingnan ang [mga kinakailangan sa pag-setup ng API, paglipat, at pagpapahintulot](../../../workflows/api/README.md). Nag-migrate lamang ang mga kasalukuyang Notion database ID kapag eksaktong isang data source ang nahanap. Gumagamit ang pagkuha ng Microsoft at Google ng mga API sa halip na mga hindi dokumentadong shortcut sa browser. Nangangailangan ng pag-renew ang mga OAuth access token sa pamamagitan ng iyong OAuth client. Gumagamit ang mga payload ng mga tiyak na JSON key, may hangganang mga HTTPS request, at kumpirmasyon ng tugon. Pinapanatili ng mga mensahe ng error ang mga detalye ng pagkabigo habang tinatakpan ang naka-configure na API token. Tingnan ang [SECURITY.md](../../../SECURITY.md) para sa pag-uulat ng mga isyu sa seguridad.

### Menu bar at Shortcuts

Sinasaklaw ng [gabay sa menu bar](../../../workflows/menubar/README.md) ang opsyonal na plugin ng SwiftBar/xbar. I-install muna ang mga Apple Service, pagkatapos ay i-configure ang direktoryo ng plugin sa iyong menu bar app at i-link dito ang `workflows/menubar/gtd-menubar.sh`.

Nagbibigay ang [gabay sa Shortcuts](../../../workflows/shortcuts/README.md) ng manual na pag-setup para sa pagkuha ng teksto, clipboard, at Siri sa macOS 12+. Ang Shortcuts at pag-activate gamit ang boses sa Siri ay nasa labas ng hosted test suite.

## Arkitektura

Naka-embed ang AppleScript sa mga bundle ng Automator upang makapagpatakbo ang mga ito bilang mga native na Service. Pina-package ng Alfred ang mga action script at ipinapasa ang input ng user bilang mga argumento. Inilalantad ng GTDLib ang mga ibinabahaging native na operasyon ng Reminders mula sa nae-edit na source ng AppleScript at isang na-compile na script bundle.

- **Isang production parser:** Ini-embed ng `scripts/sync-native-parser.py` ang ibinabahaging parser sa Quick Capture at Event Capture; natutukoy ng pag-validate ang hindi pagtutugma sa source.
- **Nananatiling estado ng focus:** nagbabahagi ng estado ng session ang mga magkakahiwalay na pagtawag, na may sariling mga trabaho sa launchd at may hangganang pagsubaybay sa lumipas na oras.
- **Mga package na maaaring ulitin ang pag-build:** gumagawa ng bagong archive ang pag-package, at ikinukumpara ng mga test ang mga nilalaman nito sa source. May hiwalay na script ng pag-compile ang library.
- **Mga naoobserbahang test:** itinatago ang mga ulat ng JUnit, mga log ng command, at mga nasubukang artifact ng build nang 14 na araw sa GitHub Actions.

| Direktoryo | Responsibilidad |
| --- | --- |
| [`workflows/`](../../../workflows/) | Mga native na bundle, mga provider adapter, Alfred, Shortcuts, at mga script sa menu bar |
| [`scripts/`](../../../scripts/) | Pag-package, pag-compile ng library, pag-sync ng parser, at pag-provision ng hosted test |
| [`tests/`](../../../tests/) | Pag-validate, mga pagsusuri ng bahagi, at native na desktop E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, panggabi/manual na E2E, at pagpapanatili ng repository |
| [`infra/`](../../../infra/) | Opsyonal na pag-setup ng lokal at EC2 Mac runner; hindi ito kailangan ng hosted CI |

<a name="testing-and-compatibility"></a>

## Pagsubok at compatibility

| Saklaw | Environment | Ano ang sinusuri |
| --- | --- | --- |
| Pag-validate | macOS 15 at 26 na naka-host sa GitHub | Pag-compile ng AppleScript, mga bundle, production parser, mga action target, mga kagustuhan, estado ng focus, fixture API transport, at mga package round trip |
| Mga pagsusuri sa seguridad | Ubuntu at macOS 15 na naka-host sa GitHub | Python CodeQL, ShellCheck, at may hangganang Atheris fuzzing ng na-compile na production parser |
| Provider adapter E2E | `macos-15-intel` na naka-host sa GitHub | Lahat ng apat na production API dialog, TLS transport, pag-save/muling pagbasa sa fixture, mga pagkabigo ng API, pagkansela, at pagpili ng source sa Notion |
| Live provider E2E | Manual na pagpapatakbo sa Mac na naka-host sa GitHub na may nakalaang mga secret | Totoong pagkuha at muling pagbasa sa vendor ng Todoist, Notion, Microsoft, at Google; nabibigo kung kulang ang mga account |
| Mga lisensyadong integrasyon sa desktop | Nakalaang lokal na account | Pagtawag at pag-save sa UI ng Things 3, OmniFocus 4, at Alfred |
| Native na desktop E2E | `macos-15-intel` na naka-host sa GitHub | Mga totoong dialog ng Automator; naka-save na data ng Reminders at Calendar; lingguhang pagsusuri; bilang sa menu; na-compile na GTDLib; naka-package na mga native na aksyon ng Alfred; totoong pag-expire at pagkansela ng timer ng launchd |
| Opsyonal na Alfred UI | Nakalaang lokal na account, Alfred 5 + Powerpack | Pag-import ng workflow, pagtawag gamit ang keyword, at muling pagbasa ng paalala sa pamamagitan ng lisensyadong UI |

Ang [na-verify na pagpapatakbo ng modernisasyon ng API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ay nakapasa sa **35 validation test sa bawat validation platform at 26 na desktop E2E test**, na walang mga pagkabigo, error, o nilaktawan. Kasama sa saklaw ng desktop ang 15 native test at 11 provider adapter test, kabilang ang aktwal na transport timeout at pansamantalang mga pagsusuri ng Keychain. Nagpapatakbo rin ang pag-validate ng mga pagsusuri sa istruktura ng repository. Sinasaklaw ng mga resultang ito ang native na gawi at mga provider fixture; hindi nito pinapatunayan ang live na compatibility sa vendor o sa mga lisensyadong app. Ipinapakita ng mga badge sa itaas ang kasalukuyang status.

Ang mga pull request at pag-push sa `main` ay nagpapatakbo ng pag-validate na sinusundan ng native E2E. Tumatakbo rin gabi-gabi at sa manual dispatch ang E2E workflow, kabilang ang mga deterministic na provider adapter test. Gumagamit ang mga live vendor test ng hiwalay at manual na `live-e2e.yml` workflow. Gumagamit ang default na CI ng mga disposable na Mac na naka-host sa GitHub, mga nakahiwalay na fixture, at may hangganang mga subprocess; walang self-hosted runner o mga panlabas na credential ng account ang kailangan para sa default na suite. Nangangailangan ng mga nakalaang provider secret ang manual na live suite.

Hindi na-validate ng kasalukuyang CI ang mga mas lumang bersyon ng macOS. Nangangailangan ng mga nakalaang secret ang mga live provider run at hindi pa ito na-verify. Ang Shortcuts/Siri at mga lisensyadong desktop app ay nasa labas ng default na hosted suite. Direktang sinusubukan ng mga native action test ang mga naka-package na script ng Alfred; hindi nito pinapatunayan ang buong compatibility sa Alfred UI. Tingnan ang [pag-setup ng test, mga kinakailangan, at saklaw](../../../tests/e2e/README.md).

## Lokalisasyon

Ang mga string sa CLI na nakikita ng user, test runner, at menu bar ay ipinapadala sa 45 locale (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) sa ilalim ng `locales/` sa pamamagitan ng `scripts/i18n.py` nang walang anumang third-party na dependency. Sinusuri ng paglutas ng locale ang `--lang`, pagkatapos ay `LC_ALL`, `LC_MESSAGES`, at `LANG`, at babalik sa `en` kung wala.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Pag-develop

I-install ang [mise](https://mise.jdx.dev/) at gamitin ang bersyon ng Python na naka-pin sa `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Sumusulat ang pag-validate ng mga ulat sa ilalim ng `test-results/`; sumusulat naman ang mga build script sa `dist/`. Upang patakbuhin ang hosted desktop suite sa `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Nangangailangan ang lokal na desktop E2E ng isang nakalaang naka-log in na test account at ng mga pahintulot na inilarawan sa [gabay sa E2E](../../../tests/e2e/README.md). Limitado lamang sa mga disposable na trabahong naka-host sa GitHub ang hosted permission-provisioning script.

Gumamit ng [Conventional Commits](https://www.conventionalcommits.org/) at sundin ang [CONTRIBUTING.md](../../../CONTRIBUTING.md). Nakatala ang mga kamakailang pagbabago sa [CHANGELOG.md](../../../CHANGELOG.md).

Nakadokumento ang mga kontrol sa seguridad, pag-verify ng lagda ng release, at mga natitirang limitasyon sa Scorecard sa [pagsusuri ng seguridad](../../../docs/security-assessment.md). Binuo at pinatutunayan ng release workflow ang mga package bago gumawa ng draft release, kabilang ang nilagdaang in-toto provenance at mga Sigstore bundle na na-verify laban sa source commit at ref. Nalalapat ang bagong provenance sa mga workflow build na iyon, hindi sa mga mas lumang download.

## Kasaysayan ng proyekto at lisensya

Pinag-iisa ng MacGTD ang mga dating repository na MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, at AlfredGTD. Ito ay lisensyado sa ilalim ng [MIT License](../../../LICENSE).
