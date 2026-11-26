# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · **Nederlands** · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD is een verzameling macOS-workflows voor het vastleggen van taken, het ordenen van herinneringen en het uitvoeren van getimede focussessies met de apps die je al gebruikt.**

Gebouwd rond [Getting Things Done](https://gettingthingsdone.com/) brengt het dialoog-, klembord- en batchvastlegging naar Apple Reminders, het vastleggen van gebeurtenissen naar Calendar en opdrachten voor taken, notities, projecten en focus naar Alfred. AppleScript en Automator houden de native workflows dicht bij macOS. API-adapters maken gebruik van Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 en Google Keep v1. Adapters voor Things en OmniFocus zijn ook inbegrepen. Gehoste tests verifiëren de API-adapters tegen een lokale HTTPS-fixture; voor live compatibiliteit zijn nog steeds aparte provideraccounts vereist.

## Wat je kunt doen

- **Leg vast zonder van app te wisselen.** Gebruik een Automator Service, een Alfred-trefwoord of het klembord om een taak toe te voegen. Batchvastlegging maakt één herinnering aan per niet-lege regel.
- **Zet tekst om in gestructureerde taken.** Parseer relatieve en ISO-datums, tijden, prioriteiten, contexten en projecten met de productieparser in AppleScript, gedeeld door native snelle vastlegging en Calendar-vastlegging.
- **Leg gebeurtenissen vast en loop je inbox door.** Maak Calendar-gebeurtenissen aan met een tijdstip, duur en locatie; voer een wekelijkse review in vijf stappen uit met een braindump in Reminders.
- **Werk in getimede focussessies.** Start, bekijk en stop sessies over verschillende processen heen. Timers die aan de sessie zijn gekoppeld via launchd verzorgen afloop en annulering; JSONL-logboeken bieden duuranalyses.
- **Gebruik Alfred voor meer dan alleen taken.** Maak Reminders-lijsten aan voor projecten, sla referentienotities op, open de inbox voor verwerking, leg klembordtekst vast en bewerk getypeerde voorkeuren.
- **Bekijk je inbox vanaf de menubalk.** De optionele SwiftBar/xbar-plug-in toont het aantal onvoltooide inboxitems en linkt naar vastlegworkflows.

Native gedrag wordt gecontroleerd op echte door GitHub gehoste Macs: tests bedienen Automator-dialoogvensters en lezen daarna de gegevens uit Reminders en Calendar terug. Zie [testen en compatibiliteit](#testen-en-compatibiliteit) voor de reikwijdte van dit bewijs.

## Snelstart: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Open de workflow in Automator en voer deze uit om het vastleggen uit te proberen. Om de workflow beschikbaar te maken als een Service, installeer je de bundel onder `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Wijs een sneltoets toe in **Systeeminstellingen → Toetsenbord → Toetscombinaties → Voorzieningen**. Sta automatiseringstoegang tot Reminders toe wanneer macOS hierom vraagt. Voer in:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

De native workflow maakt een herinnering met hoge prioriteit voor morgen, stuurt deze door naar de lijst `shopping` en legt de context vast. Zonder project- of contextmarkering gebruikt snelle vastlegging `Inbox`.

## Vastlegsyntaxis

De native taakparser en Alfred-taakvastlegging herkennen deze markeringen. Provideradapters hebben hun eigen ondersteuning voor velden en routering.

| Invoer | Betekenis | Voorbeeld |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Hoge, gemiddelde of lage prioriteit | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Relatieve vervaldatum | `Call dentist tomorrow` |
| Weekdag of `next weekday` | Vervaldatum op weekdag | `Send report next monday` |
| `due:YYYY-MM-DD` | Expliciete vervaldatum | `Renew membership due:2027-03-15` |
| Tijd naast een datum | Vervaltijdstip | `Call Alex tomorrow at 3pm` |
| `@context` | Contextmarkering | `Buy milk @errands` |
| `+project` | Project-/lijstroutering | `Draft outline +website` |

`due:today` en `due:tomorrow` worden ook geaccepteerd. Gebruik letters, cijfers, underscores of koppeltekens in context- en projectmarkeringen. Native snelle vastlegging geeft projectroutering voorrang boven contextroutering.

Calendar-vastlegging gebruikt `@` voor de locatie van de gebeurtenis en accepteert een duur in minuten of uren:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Zonder expliciet tijdstip of expliciete duur gebruikt Calendar-vastlegging 9:00 AM en één uur, in de eerste beschrijfbare agenda.

## Kies een workflow

### Native Apple-workflows

| Workflow | Gedrag | Bundel |
| --- | --- | --- |
| Snelle vastlegging | Parseer taaktekst en maak een herinnering | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Klembordvastlegging | Maak een herinnering van klembordtekst | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Batchvastlegging | Maak herinneringen van meerdere regels | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Gebeurtenisvastlegging | Maak een Calendar-gebeurtenis | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Wekelijkse review | Begeleide review en braindump naar herinneringen | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Open een bundel in Automator om deze uit te proberen, of installeer deze onder `~/Library/Services` voor toegang via het toetsenbord. Reminders en Calendar hebben de bijbehorende macOS-machtigingen voor automatisering nodig.

### Alfred

Vereist Alfred met Powerpack. Bouw het pakket vanuit de huidige broncode:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Je kunt het pakket ook downloaden via [releases](https://github.com/somethingwithproof/MacGTD/releases). Releasepakketten weerspiegelen de getagde broncode; voor functies die na een release aan `main` zijn toegevoegd, is een build vanuit de broncode nodig.

| Trefwoord | Actie |
| --- | --- |
| `task` | Leg een taak vast met parsing van datum, context, project en prioriteit |
| `note` | Sla een referentienotitie op in Reminders |
| `project` | Maak een Reminders-lijst aan |
| `gtd process` | Open Inbox voor handmatige verwerking |
| `clip` | Leg klembordtekst vast |
| `gtd focus` | Start een focussessie, bekijk de status of stop |
| `gtd analytics` | Bekijk vastgelegde focusduren |
| `gtd preferences` | Bewerk workflowvoorkeuren |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Voorkeuren staan in `~/Library/Preferences/com.alfredgtd.plist`; focusstatus en logboeken staan onder `~/.gtd`. Voorkeuren hebben ingebouwde standaardwaarden, typecontroles, gevalideerde imports en atomaire schrijfbewerkingen. Focussessies wijzigen de meldingsinstellingen van het systeem niet. Het verwerken van de inbox opent de lijst ter beoordeling; taken worden niet automatisch verplaatst of voltooid.

Zie de [Alfred-handleiding](../../../workflows/alfred/README.md) en de [GTDLib-bibliotheekdocumentatie](../../../workflows/alfred/GTDLib.scptd/README.md).

### Externe vastlegadapters

Alle vier de API-vastlegworkflows worden in de gehoste E2E-tests getest via echte Automator-dialoogvensters en een lokale TLS-fixture. Een aparte handmatige suite test echte persistentie bij de provider wanneer er speciale accounts zijn geconfigureerd. Things en OmniFocus vereisen de gelicentieerde desktopintegratiesuite.

| Doel | Mechanisme | Installatie / bron |
| --- | --- | --- |
| Todoist | API-vastlegging | [Workflow- en Keychain-configuratie](../../../workflows/todoist/) |
| Notion | Data source API-vastlegging | [Workflow- en Keychain-configuratie](../../../workflows/notion/) |
| Things 3 | URL-schema | [Workflow](../../../workflows/things/) |
| OmniFocus | AppleScript / URL-schema | [Workflow](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Workflow](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Workflow](../../../workflows/google/) |

API-adapters vereisen configuratie van referenties; Microsoft vereist gedelegeerde OAuth-autorisatie en Google Keep vereist geschikte Workspace-toegang:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Zie [API-configuratie, migratie en autorisatievereisten](../../../workflows/api/README.md). Bestaande Notion-database-ID's worden alleen gemigreerd wanneer er precies één gegevensbron wordt gevonden. Vastleggen via Microsoft en Google gebruikt API's in plaats van ongedocumenteerde browsersnelkoppelingen. OAuth-toegangstokens moeten worden vernieuwd via je OAuth-client. Payloads gebruiken expliciete JSON-sleutels, begrensde HTTPS-verzoeken en responsbevestiging. Foutmeldingen behouden foutdetails terwijl het geconfigureerde API-token wordt geredigeerd. Zie [SECURITY.md](../../../SECURITY.md) voor het melden van beveiligingsproblemen.

### Menubalk en Shortcuts

De [menubalkhandleiding](../../../workflows/menubar/README.md) behandelt de optionele SwiftBar/xbar-plug-in. Installeer eerst de Apple Services, configureer daarna de plug-inmap in je menubalk-app en koppel `workflows/menubar/gtd-menubar.sh` daarin.

De [Shortcuts-handleiding](../../../workflows/shortcuts/README.md) biedt handmatige installatie-instructies voor tekst-, klembord- en Siri-vastlegging op macOS 12+. Shortcuts en spraakactivatie via Siri vallen buiten de gehoste testsuite.

## Architectuur

Automator-bundels sluiten AppleScript in zodat ze als native Services kunnen draaien. Alfred verpakt de actiescripts en geeft gebruikersinvoer door als argumenten. GTDLib stelt gedeelde native Reminders-bewerkingen beschikbaar vanuit bewerkbare AppleScript-broncode en een gecompileerde scriptbundel.

- **Eén productieparser:** `scripts/sync-native-parser.py` sluit de gedeelde parser in Quick Capture en Event Capture in; validatie detecteert afwijkingen in de broncode.
- **Persistente focusstatus:** afzonderlijke aanroepen delen de sessiestatus, met beheerde launchd-taken en begrensde meting van verstreken tijd.
- **Reproduceerbare pakketten:** de verpakkingsstap bouwt een nieuw archief en tests vergelijken de inhoud ervan met de broncode. De bibliotheek heeft een apart compilatiescript.
- **Waarneembare tests:** JUnit-rapporten, opdrachtlogboeken en geteste build-artefacten worden 14 dagen bewaard in GitHub Actions.

| Map | Verantwoordelijkheid |
| --- | --- |
| [`workflows/`](../../../workflows/) | Native bundels, provideradapters, Alfred, Shortcuts en menubalkscripts |
| [`scripts/`](../../../scripts/) | Verpakking, bibliotheekcompilatie, parsersynchronisatie en inrichting van gehoste tests |
| [`tests/`](../../../tests/) | Validatie, componentcontroles en native desktop-E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, nachtelijke/handmatige E2E en onderhoud van de repository |
| [`infra/`](../../../infra/) | Optionele lokale en EC2-Mac-runnerconfiguratie; gehoste CI heeft dit niet nodig |

## Testen en compatibiliteit

| Reikwijdte | Omgeving | Wat wordt gecontroleerd |
| --- | --- | --- |
| Validatie | Door GitHub gehoste macOS 15 en 26 | AppleScript-compilatie, bundels, productieparser, actiedoelen, voorkeuren, focusstatus, fixture-API-transport en round-trips van pakketten |
| Beveiligingscontroles | Door GitHub gehoste Ubuntu en macOS 15 | Python CodeQL, ShellCheck en begrensde Atheris-fuzzing van de gecompileerde productieparser |
| E2E voor provideradapters | Door GitHub gehoste `macos-15-intel` | Alle vier de productie-API-dialoogvensters, TLS-transport, fixture-persistentie/teruglezing, API-fouten, annulering en Notion-bronselectie |
| Live E2E voor providers | Handmatige door GitHub gehoste Mac-run met aparte geheimen | Echte vastlegging en teruglezing bij de provider voor Todoist, Notion, Microsoft en Google; mislukt als accounts ontbreken |
| Gelicentieerde desktopintegraties | Apart lokaal account | Aanroep en persistentie in Things 3, OmniFocus 4 en Alfred UI |
| Native desktop-E2E | Door GitHub gehoste `macos-15-intel` | Echte Automator-dialoogvensters; gepersisteerde Reminders- en Calendar-gegevens; wekelijkse review; menubalktellingen; gecompileerde GTDLib; verpakte native Alfred-acties; echte launchd-timerafloop en -annulering |
| Optionele Alfred UI | Apart lokaal account, Alfred 5 + Powerpack | Workflow-import, aanroep via trefwoord en teruglezing van herinneringen via de gelicentieerde UI |

De [geverifieerde run voor API-modernisering](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) slaagde voor **35 validatietests op elk validatieplatform en 26 desktop-E2E-tests**, zonder mislukkingen, fouten of overgeslagen tests. De desktopdekking omvat 15 native tests en 11 tests voor provideradapters, inclusief daadwerkelijke transporttime-out- en tijdelijke Keychain-controles. Validatie voert ook structuurcontroles van de repository uit. Deze resultaten dekken native gedrag en providerfixtures; ze tonen geen compatibiliteit met live providers of gelicentieerde apps aan. De actuele status wordt weergegeven door de badges hierboven.

Pull requests en pushes naar `main` voeren validatie uit, gevolgd door native E2E. De E2E-workflow draait ook 's nachts en bij handmatige start, inclusief deterministische tests voor provideradapters. Live providertests gebruiken de aparte handmatige workflow `live-e2e.yml`. Standaard-CI gebruikt wegwerpbare door GitHub gehoste Macs, geïsoleerde fixtures en begrensde subprocessen; voor de standaardsuite zijn geen self-hosted runner of externe accountreferenties nodig. De handmatige livesuite vereist aparte providergeheimen.

Eerdere macOS-versies worden niet gevalideerd door de huidige CI. Live providerruns vereisen aparte geheimen en zijn nog niet geverifieerd. Shortcuts/Siri en gelicentieerde desktop-apps vallen buiten de standaard gehoste suite. Tests voor native acties testen verpakte Alfred-scripts rechtstreeks; ze tonen geen volledige compatibiliteit met de Alfred UI aan. Zie [testconfiguratie, vereisten en dekking](../../../tests/e2e/README.md).

## Lokalisatie

Gebruikersgerichte strings voor CLI, testrunner en menubalk worden meegeleverd in 45 talen (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) onder `locales/` via `scripts/i18n.py` zonder afhankelijkheden van derden. Taalresolutie controleert achtereenvolgens `--lang`, `LC_ALL`, `LC_MESSAGES` en `LANG`, en valt terug op `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Ontwikkeling

Installeer [mise](https://mise.jdx.dev/) en gebruik de Python-versie die is vastgelegd in `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Validatie schrijft rapporten weg onder `test-results/`; buildscripts schrijven naar `dist/`. Om de gehoste desktopsuite op `main` uit te voeren:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Lokale desktop-E2E vereist een apart ingelogd testaccount en de machtigingen die zijn beschreven in de [E2E-handleiding](../../../tests/e2e/README.md). Het gehoste script voor het inrichten van machtigingen is beperkt tot wegwerpbare door GitHub gehoste jobs.

Gebruik [Conventional Commits](https://www.conventionalcommits.org/) en volg [CONTRIBUTING.md](../../../CONTRIBUTING.md). Recente wijzigingen zijn vastgelegd in [CHANGELOG.md](../../../CHANGELOG.md).

Beveiligingscontroles, verificatie van releasehandtekeningen en resterende Scorecard-beperkingen zijn gedocumenteerd in de [beveiligingsbeoordeling](../../../docs/security-assessment.md). De releaseworkflow bouwt en attesteert pakketten voordat een conceptrelease wordt aangemaakt, inclusief ondertekende in-toto-herkomst en Sigstore-bundels die zijn geverifieerd tegen de broncommit en ref. Nieuwe herkomst geldt voor die workflowbuilds, niet voor oudere downloads.

## Projectgeschiedenis en licentie

MacGTD voegt de voormalige repositories MacGTD-Native, MacGTD-Microsoft, MacGTD-Google en AlfredGTD samen. Het is gelicentieerd onder de [MIT-licentie](../../../LICENSE).
