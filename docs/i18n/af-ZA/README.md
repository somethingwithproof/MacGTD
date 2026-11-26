# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

**Afrikaans** · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD is 'n versameling macOS-werkstrome om take vas te lê, herinneringe te organiseer en getymde fokussessies uit te voer met die toepassings wat jy reeds gebruik.**

Dit is gebou rondom [Getting Things Done](https://gettingthingsdone.com/) en bring dialoog-, knipbord- en bondelvaslegging na Apple Reminders; gebeurtenisvaslegging na Calendar; en taak-, nota-, projek- en fokusopdragte na Alfred. AppleScript en Automator hou die inheemse werkstrome naby aan macOS. API-adapters gebruik Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 en Google Keep v1. Things- en OmniFocus-adapters word ook ingesluit. Gehuisveste toetse verifieer die API-adapters teen 'n plaaslike HTTPS-toetsopstelling; lewendige versoenbaarheid vereis steeds toegewyde verskafferrekeninge.

## Wat jy kan doen

- **Lê vas sonder om van toepassing te wissel.** Gebruik 'n Automator-diens, 'n Alfred-sleutelwoord of die knipbord om 'n taak by te voeg. Bondelvaslegging skep een herinnering per nie-blanko reël.
- **Skakel teks om in gestruktureerde take.** Ontleed relatiewe en ISO-datums, tye, prioriteite, kontekste en projekte met die produksie-AppleScript-ontleder wat deur inheemse vinnige vaslegging en Calendar-vaslegging gedeel word.
- **Lê gebeurtenisse vas en hersien jou inkassie.** Skep Calendar-gebeurtenisse met 'n tyd, duur en ligging; voer 'n weeklikse hersiening in vyf stappe uit met 'n breinstorting na Reminders.
- **Werk in getymde fokussessies.** Begin, inspekteer en stop sessies oor prosesse heen. Sessie-eie launchd-tydhouers hanteer verval en kansellasie; JSONL-loglêers verskaf duuranalise.
- **Gebruik Alfred vir meer as net take.** Skep Reminders-lyste vir projekte, stoor verwysingsnotas, maak die inkassie oop vir hersiening, lê knipbordteks vas en wysig getipeerde voorkeure.
- **Sien jou inkassie vanaf die kieslysbalk.** Die opsionele SwiftBar/xbar-inprop wys onvolledige inkassietellings en skakel na vasleggingswerkstrome.

Inheemse gedrag word op regte GitHub-gehuisveste Macs nagegaan: toetse bedryf Automator-dialoë en lees dan Reminders- en Calendar-rekords terug. Sien [toetsing en versoenbaarheid](#toetsing-en-versoenbaarheid) vir die omvang van daardie bewyse.

## Vinnige begin: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Maak die werkstroom in Automator oop en voer dit uit om vaslegging te probeer. Om dit as 'n diens beskikbaar te maak, installeer die bundel onder `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Ken 'n kortpad toe in **System Settings → Keyboard → Keyboard Shortcuts → Services**. Laat Automation-toegang tot Reminders toe wanneer macOS vra. Voer in:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Die inheemse werkstroom skep 'n hoë-prioriteit-herinnering wat môre verval, stuur dit na die `shopping`-lys, en teken die konteks aan. Sonder 'n projek- of konteksmerker gebruik vinnige vaslegging `Inbox`.

## Vasleggingsintaks

Die inheemse taakontleder en Alfred-taakvaslegging herken hierdie merkers. Verskafferadapters het hul eie veld- en roeteringsondersteuning.

| Invoer | Betekenis | Voorbeeld |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Hoë, medium of lae prioriteit | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Relatiewe sperdatum | `Call dentist tomorrow` |
| Weekdag of `next weekday` | Weekdag-sperdatum | `Send report next monday` |
| `due:YYYY-MM-DD` | Eksplisiete sperdatum | `Renew membership due:2027-03-15` |
| Tyd saam met 'n datum | Spertyd | `Call Alex tomorrow at 3pm` |
| `@context` | Konteksmerker | `Buy milk @errands` |
| `+project` | Projek-/lysroetering | `Draft outline +website` |

`due:today` en `due:tomorrow` word ook aanvaar. Gebruik letters, syfers, onderstrepe of koppeltekens in konteks- en projekmerkers. Inheemse vinnige vaslegging gee projekroetering voorrang bo konteksroetering.

Calendar-vaslegging gebruik `@` vir die gebeurtenisligging en aanvaar 'n duur in minute of ure:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Sonder 'n eksplisiete tyd of duur gebruik Calendar-vaslegging 9:00 vm. en een uur in die eerste skryfbare kalender.

## Kies 'n werkstroom

### Inheemse Apple-werkstrome

| Werkstroom | Gedrag | Bundel |
| --- | --- | --- |
| Vinnige vaslegging | Ontleed taakteks en skep 'n herinnering | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Knipbordvaslegging | Skep 'n herinnering vanaf knipbordteks | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Bondelvaslegging | Skep herinneringe vanaf veelvuldige reëls | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Gebeurtenisvaslegging | Skep 'n Calendar-gebeurtenis | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Weeklikse hersiening | Begeleide hersiening en herinnering-breinstorting | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Maak 'n bundel in Automator oop om dit te probeer, of installeer dit onder `~/Library/Services` vir sleutelbordtoegang. Reminders en Calendar benodig die toepaslike macOS Automation-toestemmings.

### Alfred

Vereis Alfred met Powerpack. Bou die pakket vanaf die huidige bronkode:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Jy kan ook die pakket aflaai vanaf [vrystellings](https://github.com/somethingwithproof/MacGTD/releases). Vrystellingspakkette weerspieël hul gemerkte bronkode; funksies wat na 'n vrystelling tot `main` bygevoeg word, vereis 'n bronbou.

| Sleutelwoord | Aksie |
| --- | --- |
| `task` | Lê 'n taak vas met datum-, konteks-, projek- en prioriteitsontleding |
| `note` | Stoor 'n verwysingsnota in Reminders |
| `project` | Skep 'n Reminders-lys |
| `gtd process` | Maak Inbox oop vir menslike hersiening |
| `clip` | Lê knipbordteks vas |
| `gtd focus` | Begin 'n fokussessie, inspekteer status of stop |
| `gtd analytics` | Inspekteer aangetekende fokusdure |
| `gtd preferences` | Wysig werkstroomvoorkeure |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Voorkeure word in `~/Library/Preferences/com.alfredgtd.plist` gestoor; fokusstatus en loglêers word onder `~/.gtd` gestoor. Voorkeure het ingeboude verstekwaardes, tipekontroles, gevalideerde invoere en atomiese skryfbewerkings. Fokussessies verander nie stelselkennisgewinginstellings nie. Inkassieverwerking maak die lys oop vir hersiening; dit skuif of voltooi nie take outomaties nie.

Sien die [Alfred-gids](../../../workflows/alfred/README.md) en [GTDLib-biblioteekdokumentasie](../../../workflows/alfred/GTDLib.scptd/README.md).

### Eksterne vasleggingsadapters

Al vier API-vasleggingswerkstrome word deur regte Automator-dialoë en 'n plaaslike TLS-toetsopstelling in gehuisveste E2E getoets. 'n Afsonderlike handmatige reeks toets werklike verskafferberging wanneer toegewyde rekeninge gekonfigureer is. Things en OmniFocus vereis die gelisensieerde werkskerm-integrasiereeks.

| Teiken | Meganisme | Opstelling / bron |
| --- | --- | --- |
| Todoist | API-vaslegging | [Werkstroom en Keychain-opstelling](../../../workflows/todoist/) |
| Notion | Databron-API-vaslegging | [Werkstroom en Keychain-opstelling](../../../workflows/notion/) |
| Things 3 | URL-skema | [Werkstroom](../../../workflows/things/) |
| OmniFocus | AppleScript / URL-skema | [Werkstroom](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Werkstroom](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Werkstroom](../../../workflows/google/) |

API-adapters vereis geloofsbriefopstelling; Microsoft benodig gedelegeerde OAuth-magtiging en Google Keep benodig kwalifiserende Workspace-toegang:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Sien [API-opstelling, migrasie en magtigingsvereistes](../../../workflows/api/README.md). Bestaande Notion-databasis-ID's migreer slegs wanneer presies een databron gevind word. Microsoft- en Google-vaslegging gebruik API's in plaas van ongedokumenteerde blaaierkortpaaie. OAuth-toegangstokens vereis hernuwing deur jou OAuth-kliënt. Ladings gebruik eksplisiete JSON-sleutels, begrensde HTTPS-versoeke en reaksiebevestiging. Foutboodskappe behou mislukkingsbesonderhede terwyl die gekonfigureerde API-token versteek word. Sien [SECURITY.md](../../../SECURITY.md) om sekuriteitsprobleme aan te meld.

### Kieslysbalk en Shortcuts

Die [kieslysbalkgids](../../../workflows/menubar/README.md) dek die opsionele SwiftBar/xbar-inprop. Installeer eers die Apple-dienste, konfigureer dan die inpropgids in jou kieslysbalktoepassing en skakel `workflows/menubar/gtd-menubar.sh` daarin.

Die [Shortcuts-gids](../../../workflows/shortcuts/README.md) verskaf handmatige opstelling vir teks-, knipbord- en Siri-vaslegging op macOS 12+. Shortcuts en Siri-stemaktivering val buite die gehuisveste toetsreeks.

## Argitektuur

Automator-bundels bed AppleScript in sodat hulle as inheemse dienste kan loop. Alfred verpak die aksieskripte en gee gebruikersinvoer as argumente deur. GTDLib stel gedeelde inheemse Reminders-bewerkings beskikbaar vanuit redigeerbare AppleScript-bronkode en 'n saamgestelde skripbundel.

- **Een produksie-ontleder:** `scripts/sync-native-parser.py` bed die gedeelde ontleder in Quick Capture en Event Capture in; validering bespeur bronafwyking.
- **Volgehoue fokusstatus:** afsonderlike aanroepe deel sessiestatus, met eie launchd-take en begrensde verstreke-tyd-boekhouding.
- **Herproduseerbare pakkette:** verpakking bou 'n vars argief, en toetse vergelyk die inhoud daarvan met die bronkode. Die biblioteek het 'n afsonderlike samestellingskrip.
- **Waarneembare toetse:** JUnit-verslae, opdragloglêers en getoetste bou-artefakte word vir 14 dae in GitHub Actions behou.

| Gids | Verantwoordelikheid |
| --- | --- |
| [`workflows/`](../../../workflows/) | Inheemse bundels, verskafferadapters, Alfred, Shortcuts en kieslysbalkskripte |
| [`scripts/`](../../../scripts/) | Verpakking, biblioteeksamestelling, ontledersinkronisering en voorsiening van gehuisveste toetse |
| [`tests/`](../../../tests/) | Validering, komponentkontroles en inheemse werkskerm-E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, nagtelike/handmatige E2E en bewaarplek-instandhouding |
| [`infra/`](../../../infra/) | Opsionele plaaslike en EC2 Mac-uitvoerder-opstelling; gehuisveste CI vereis dit nie |

## Toetsing en versoenbaarheid

| Omvang | Omgewing | Wat nagegaan word |
| --- | --- | --- |
| Validering | GitHub-gehuisveste macOS 15 en 26 | AppleScript-samestelling, bundels, produksie-ontleder, aksieteikens, voorkeure, fokusstatus, toetsopstelling-API-vervoer en pakket-heen-en-weer-toetse |
| Sekuriteitskontroles | GitHub-gehuisveste Ubuntu en macOS 15 | Python CodeQL, ShellCheck en begrensde Atheris-fuzzing van die saamgestelde produksie-ontleder |
| Verskafferadapter-E2E | GitHub-gehuisveste `macos-15-intel` | Al vier produksie-API-dialoë, TLS-vervoer, toetsopstelling-berging/teruglesing, API-foute, kansellasie en Notion-bronseleksie |
| Lewendige verskaffer-E2E | Handmatige GitHub-gehuisveste Mac-uitvoering met toegewyde geheime | Regte Todoist-, Notion-, Microsoft- en Google-vaslegging en verskaffer-teruglesing; misluk as rekeninge ontbreek |
| Gelisensieerde werkskerm-integrasies | Toegewyde plaaslike rekening | Things 3-, OmniFocus 4- en Alfred-UI-aanroep en -berging |
| Inheemse werkskerm-E2E | GitHub-gehuisveste `macos-15-intel` | Regte Automator-dialoë; gestoorde Reminders- en Calendar-data; weeklikse hersiening; kieslystellings; saamgestelde GTDLib; verpakte inheemse Alfred-aksies; regte launchd-tydhouerverval en -kansellasie |
| Opsionele Alfred-UI | Toegewyde plaaslike rekening, Alfred 5 + Powerpack | Werkstroom-invoer, sleutelwoord-aanroep en herinnering-teruglesing deur die gelisensieerde UI |

Die [geverifieerde API-moderniseringsuitvoering](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) het **35 valideringstoetse op elke valideringsplatform en 26 werkskerm-E2E-toetse** geslaag, met geen mislukkings, foute of oorgeslane toetse nie. Werkskermdekking sluit 15 inheemse toetse en 11 verskafferadaptertoetse in, insluitend werklike vervoertydverstreke en tydelike Keychain-kontroles. Validering voer ook bewaarplekstruktuurkontroles uit. Hierdie resultate dek inheemse gedrag en verskaffer-toetsopstellings; dit bewys nie lewendige verskaffer- of gelisensieerde-toepassing-versoenbaarheid nie. Die huidige status word deur die kentekens hierbo gewys.

Trekversoeke en stote na `main` voer validering uit, gevolg deur inheemse E2E. Die E2E-werkstroom loop ook nagtelik en op handmatige versending, insluitend deterministiese verskafferadaptertoetse. Lewendige verskaffertoetse gebruik die afsonderlike handmatige `live-e2e.yml`-werkstroom. Verstek-CI gebruik weggooibare GitHub-gehuisveste Macs, geïsoleerde toetsopstellings en begrensde subprosesse; geen self-gehuisveste uitvoerder of eksterne rekeninggeloofsbriewe word vir die verstekreeks benodig nie. Die handmatige lewendige reeks vereis toegewyde verskaffergeheime.

Vroeëre macOS-weergawes word nie deur die huidige CI gevalideer nie. Lewendige verskafferuitvoerings vereis toegewyde geheime en is nog nie geverifieer nie. Shortcuts/Siri en gelisensieerde werkskermtoepassings val buite die verstek-gehuisveste reeks. Inheemse aksietoetse oefen verpakte Alfred-skripte direk; dit bewys nie volledige Alfred-UI-versoenbaarheid nie. Sien [toetsopstelling, voorvereistes en dekking](../../../tests/e2e/README.md).

## Lokalisering

Gebruikersgerigte CLI-, toetsloper- en kieslysbalkstringe word in 45 lokale (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) onder `locales/` via `scripts/i18n.py` met nul derdeparty-afhanklikhede verskeep. Lokaaloplossing gaan `--lang` na, dan `LC_ALL`, `LC_MESSAGES` en `LANG`, en val terug na `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Ontwikkeling

Installeer [mise](https://mise.jdx.dev/) en gebruik die Python-weergawe wat in `.mise.toml` vasgepen is:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Validering skryf verslae onder `test-results/`; bouskripte skryf na `dist/`. Om die gehuisveste werkskermreeks op `main` uit te voer:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Plaaslike werkskerm-E2E vereis 'n toegewyde aangemelde toetsrekening en die toestemmings wat in die [E2E-gids](../../../tests/e2e/README.md) beskryf word. Die gehuisveste toestemmingsvoorsieningskrip is beperk tot weggooibare GitHub-gehuisveste take.

Gebruik [Conventional Commits](https://www.conventionalcommits.org/) en volg [CONTRIBUTING.md](../../../CONTRIBUTING.md). Onlangse veranderinge word in [CHANGELOG.md](../../../CHANGELOG.md) aangeteken.

Sekuriteitskontroles, vrystellingshandtekeningverifikasie en oorblywende Scorecard-beperkings word in die [sekuriteitsbeoordeling](../../../docs/security-assessment.md) gedokumenteer. Die vrystellingswerkstroom bou en attesteer pakkette voordat 'n konsepvrystelling geskep word, insluitend ondertekende in-toto-herkoms en Sigstore-bundels wat teen die bron-commit en -verwysing geverifieer word. Nuwe herkoms geld vir daardie werkstroomboue, nie vir ouer aflaaie nie.

## Projekgeskiedenis en lisensie

MacGTD konsolideer die voormalige MacGTD-Native-, MacGTD-Microsoft-, MacGTD-Google- en AlfredGTD-bewaarplekke. Dit is gelisensieer onder die [MIT-lisensie](../../../LICENSE).
