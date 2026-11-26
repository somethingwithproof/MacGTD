# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · **Svenska** · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD är en samling macOS-arbetsflöden för att fånga uppgifter, organisera påminnelser och köra tidsbestämda fokussessioner med de appar du redan använder.**

Byggd kring [Getting Things Done](https://gettingthingsdone.com/) ger den dialog-, urklipps- och batchinsamling till Apple Reminders, händelseinsamling till Kalender samt kommandon för uppgifter, anteckningar, projekt och fokus till Alfred. AppleScript och Automator håller de inbyggda arbetsflödena nära macOS. API-adaptrar använder Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 och Google Keep v1. Adaptrar för Things och OmniFocus ingår också. Hostade tester verifierar API-adaptrarna mot en lokal HTTPS-fixtur; kompatibilitet i skarp miljö kräver fortfarande dedikerade leverantörskonton.

## Vad du kan göra

- **Fånga uppgifter utan att byta app.** Använd en Automator-tjänst, ett nyckelord i Alfred eller urklipp för att lägga till en uppgift. Batchinsamling skapar en påminnelse per icke-tom rad.
- **Omvandla text till strukturerade uppgifter.** Tolka relativa datum och ISO-datum, tider, prioriteter, kontexter och projekt med den produktionsklara AppleScript-parsern som delas av inbyggd snabbinsamling och Kalender-insamling.
- **Fånga händelser och gå igenom din inkorg.** Skapa kalenderhändelser med tid, varaktighet och plats; kör en veckogenomgång i fem steg med en hjärntömning in i Reminders.
- **Arbeta i tidsbestämda fokussessioner.** Starta, inspektera och stoppa sessioner över processgränser. Sessionsägda launchd-timers hanterar utgång och avbrytande; JSONL-loggar ger analys av varaktighet.
- **Använd Alfred till mer än uppgifter.** Skapa listor i Reminders för projekt, spara referensanteckningar, öppna inkorgen för genomgång, fånga urklippstext och redigera typsäkra inställningar.
- **Se din inkorg från menyraden.** Det valfria tillägget för SwiftBar/xbar visar antalet oavslutade objekt i inkorgen och länkar till insamlingsarbetsflöden.

Inbyggt beteende kontrolleras på riktiga GitHub-hostade Mac-datorer: tester styr Automator-dialoger och läser sedan tillbaka poster från Reminders och Kalender. Se [testning och kompatibilitet](#testning-och-kompatibilitet) för omfattningen av dessa verifieringar.

## Snabbstart: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Öppna arbetsflödet i Automator och kör det för att testa insamling. För att göra det tillgängligt som en tjänst, installera paketet under `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Tilldela ett kortkommando i **Systeminställningar → Tangentbord → Kortkommandon → Tjänster**. Tillåt automatiseringsåtkomst till Reminders när macOS frågar. Ange:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Det inbyggda arbetsflödet skapar en påminnelse med hög prioritet och förfallodatum imorgon, dirigerar den till listan `shopping` och sparar kontexten. Utan projekt- eller kontextmarkör använder snabbinsamlingen `Inbox`.

## Insamlingssyntax

Den inbyggda uppgiftsparsern och uppgiftsinsamlingen i Alfred känner igen dessa markörer. Leverantörsadaptrar har eget stöd för fält och dirigering.

| Inmatning | Betydelse | Exempel |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Hög, medel eller låg prioritet | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Relativt förfallodatum | `Call dentist tomorrow` |
| Veckodag eller `next weekday` | Förfallodatum på veckodag | `Send report next monday` |
| `due:YYYY-MM-DD` | Explicit förfallodatum | `Renew membership due:2027-03-15` |
| Tid tillsammans med ett datum | Förfallotid | `Call Alex tomorrow at 3pm` |
| `@context` | Kontextmarkör | `Buy milk @errands` |
| `+project` | Projekt-/listdirigering | `Draft outline +website` |

`due:today` och `due:tomorrow` accepteras också. Använd bokstäver, siffror, understreck eller bindestreck i kontext- och projektmarkörer. Inbyggd snabbinsamling ger projektdirigering företräde framför kontextdirigering.

Kalender-insamling använder `@` för händelsens plats och accepterar en varaktighet i minuter eller timmar:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Utan en explicit tid eller varaktighet använder Kalender-insamling kl. 09:00 och en timme, i den första skrivbara kalendern.

## Välj ett arbetsflöde

### Inbyggda Apple-arbetsflöden

| Arbetsflöde | Beteende | Paket |
| --- | --- | --- |
| Snabbinsamling | Tolka uppgiftstext och skapa en påminnelse | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Urklippsinsamling | Skapa en påminnelse från urklippstext | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Batchinsamling | Skapa påminnelser från flera rader | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Händelseinsamling | Skapa en kalenderhändelse | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Veckogenomgång | Guidad genomgång och hjärntömning av påminnelser | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Öppna ett paket i Automator för att prova det, eller installera det under `~/Library/Services` för åtkomst via tangentbordet. Reminders och Kalender behöver lämpliga macOS-behörigheter för automatisering.

### Alfred

Kräver Alfred med Powerpack. Bygg paketet från aktuell källkod:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Du kan också ladda ner paketet från [releases](https://github.com/somethingwithproof/MacGTD/releases). Releasepaket återspeglar sin taggade källkod; funktioner som lagts till i `main` efter en release kräver ett bygge från källkod.

| Nyckelord | Åtgärd |
| --- | --- |
| `task` | Fånga en uppgift med tolkning av datum, kontext, projekt och prioritet |
| `note` | Spara en referensanteckning i Reminders |
| `project` | Skapa en lista i Reminders |
| `gtd process` | Öppna Inbox för manuell genomgång |
| `clip` | Fånga urklippstext |
| `gtd focus` | Starta en fokussession, inspektera status eller stoppa |
| `gtd analytics` | Inspektera registrerade fokusvaraktigheter |
| `gtd preferences` | Redigera arbetsflödets inställningar |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Inställningar lagras i `~/Library/Preferences/com.alfredgtd.plist`; fokustillstånd och loggar lagras under `~/.gtd`. Inställningarna har inbyggda standardvärden, typkontroller, validerad import och atomära skrivningar. Fokussessioner ändrar inte systemets notisinställningar. Inkorgsbehandlingen öppnar listan för genomgång; den flyttar eller slutför inte uppgifter automatiskt.

Se [Alfred-guiden](../../../workflows/alfred/README.md) och [biblioteksdokumentationen för GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Externa insamlingsadaptrar

Alla fyra arbetsflöden för API-insamling testas genom riktiga Automator-dialoger och en lokal TLS-fixtur i hostad E2E. En separat manuell testsvit kontrollerar riktig lagring hos leverantörer när dedikerade konton är konfigurerade. Things och OmniFocus kräver den licensierade sviten för skrivbordsintegration.

| Mål | Mekanism | Konfiguration / källa |
| --- | --- | --- |
| Todoist | API-insamling | [Konfiguration av arbetsflöde och Nyckelhanterare](../../../workflows/todoist/) |
| Notion | API-insamling för datakälla | [Konfiguration av arbetsflöde och Nyckelhanterare](../../../workflows/notion/) |
| Things 3 | URL-schema | [Arbetsflöde](../../../workflows/things/) |
| OmniFocus | AppleScript / URL-schema | [Arbetsflöde](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Arbetsflöde](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Arbetsflöde](../../../workflows/google/) |

API-adaptrar kräver konfiguration av autentiseringsuppgifter; Microsoft behöver delegerad OAuth-auktorisering och Google Keep behöver behörig Workspace-åtkomst:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Se [API-konfiguration, migrering och auktoriseringskrav](../../../workflows/api/README.md). Befintliga databas-ID:n i Notion migreras endast när exakt en datakälla hittas. Insamling för Microsoft och Google använder API:er i stället för odokumenterade webbläsargenvägar. OAuth-åtkomsttoken kräver förnyelse via din OAuth-klient. Nyttolaster använder explicita JSON-nycklar, begränsade HTTPS-förfrågningar och svarsbekräftelse. Felmeddelanden behåller feldetaljer samtidigt som den konfigurerade API-tokenen maskeras. Se [SECURITY.md](../../../SECURITY.md) för rapportering av säkerhetsproblem.

### Menyrad och Shortcuts

[Menyradsguiden](../../../workflows/menubar/README.md) täcker det valfria tillägget för SwiftBar/xbar. Installera Apple-tjänsterna först, konfigurera sedan tilläggskatalogen i din menyradsapp och länka in `workflows/menubar/gtd-menubar.sh` i den.

[Shortcuts-guiden](../../../workflows/shortcuts/README.md) ger manuell konfiguration för insamling via text, urklipp och Siri på macOS 12+. Shortcuts och röstaktivering med Siri ligger utanför den hostade testsviten.

## Arkitektur

Automator-paket bäddar in AppleScript så att de kan köras som inbyggda tjänster. Alfred paketerar åtgärdsskripten och skickar användarinmatning som argument. GTDLib exponerar delade inbyggda operationer för Reminders från redigerbar AppleScript-källkod och ett kompilerat skriptpaket.

- **En produktionsparser:** `scripts/sync-native-parser.py` bäddar in den delade parsern i Snabbinsamling och Händelseinsamling; valideringen upptäcker avvikelser från källkoden.
- **Beständigt fokustillstånd:** separata anrop delar sessionstillstånd, med ägda launchd-jobb och begränsad beräkning av förfluten tid.
- **Reproducerbara paket:** paketeringen bygger ett nytt arkiv och tester jämför dess innehåll med källkoden. Biblioteket har ett separat kompileringsskript.
- **Observerbara tester:** JUnit-rapporter, kommandologgar och testade byggartefakter sparas i 14 dagar i GitHub Actions.

| Katalog | Ansvar |
| --- | --- |
| [`workflows/`](../../../workflows/) | Inbyggda paket, leverantörsadaptrar, Alfred, Shortcuts och menyradsskript |
| [`scripts/`](../../../scripts/) | Paketering, bibliotekskompilering, parsersynkronisering och provisionering av hostade tester |
| [`tests/`](../../../tests/) | Validering, komponentkontroller och inbyggd skrivbords-E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, nattlig/manuell E2E och underhåll av arkivet |
| [`infra/`](../../../infra/) | Valfri lokal konfiguration och EC2 Mac-runner-konfiguration; hostad CI kräver det inte |

## Testning och kompatibilitet

| Omfattning | Miljö | Vad som kontrolleras |
| --- | --- | --- |
| Validering | GitHub-hostad macOS 15 och 26 | AppleScript-kompilering, paket, produktionsparser, åtgärdsmål, inställningar, fokustillstånd, API-transport mot fixtur och paketets tur-och-retur-kontroller |
| Säkerhetskontroller | GitHub-hostad Ubuntu och macOS 15 | Python CodeQL, ShellCheck och begränsad Atheris-fuzzing av den kompilerade produktionsparsern |
| E2E för leverantörsadaptrar | GitHub-hostad `macos-15-intel` | Alla fyra produktions-API-dialoger, TLS-transport, lagring/återläsning i fixtur, API-fel, avbrytande och val av Notion-källa |
| Live-E2E för leverantörer | Manuell GitHub-hostad Mac-körning med dedikerade hemligheter | Riktig insamling och återläsning hos Todoist, Notion, Microsoft och Google; misslyckas om konton saknas |
| Licensierade skrivbordsintegrationer | Dedikerat lokalt konto | Anrop och lagring via gränssnittet i Things 3, OmniFocus 4 och Alfred |
| Inbyggd skrivbords-E2E | GitHub-hostad `macos-15-intel` | Riktiga Automator-dialoger; lagrad data i Reminders och Kalender; veckogenomgång; menyantal; kompilerad GTDLib; paketerade inbyggda Alfred-åtgärder; verklig utgång och avbrytande av launchd-timer |
| Valfritt Alfred-gränssnitt | Dedikerat lokalt konto, Alfred 5 + Powerpack | Import av arbetsflöde, anrop med nyckelord och återläsning av påminnelser genom det licensierade gränssnittet |

Den [verifierade körningen för API-modernisering](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) klarade **35 valideringstester på varje valideringsplattform och 26 skrivbords-E2E-tester**, utan några misslyckanden, fel eller överhoppade tester. Skrivbordstäckningen omfattar 15 inbyggda tester och 11 tester av leverantörsadaptrar, inklusive kontroller av faktisk transporttidsgräns och tillfällig nyckelhanterare. Valideringen kör också strukturkontroller på arkivet. Dessa resultat täcker inbyggt beteende och leverantörsfixturer; de fastställer inte kompatibilitet med skarpa leverantörskonton eller licensierade appar. Aktuell status visas av märkena ovan.

Pull requests och pushar till `main` kör validering följt av inbyggd E2E. E2E-arbetsflödet körs även nattetid och vid manuell utlösning, inklusive deterministiska tester av leverantörsadaptrar. Skarpa leverantörstester använder det separata manuella arbetsflödet `live-e2e.yml`. Standard-CI använder engångsinstanser av GitHub-hostade Mac-datorer, isolerade fixturer och begränsade underprocesser; ingen egenhostad runner eller externa inloggningsuppgifter behövs för standardsviten. Den manuella skarpa sviten kräver dedikerade leverantörshemligheter.

Tidigare macOS-versioner valideras inte av nuvarande CI. Skarpa leverantörskörningar kräver dedikerade hemligheter och har ännu inte verifierats. Shortcuts/Siri och licensierade skrivbordsappar ligger utanför den hostade standardsviten. Tester av inbyggda åtgärder kör paketerade Alfred-skript direkt; de fastställer inte full kompatibilitet med Alfreds gränssnitt. Se [testkonfiguration, förutsättningar och täckning](../../../tests/e2e/README.md).

## Lokalisering

Användarvända strängar i CLI, testkörare och menyrad levereras på 45 språk (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) under `locales/` via `scripts/i18n.py` utan några tredjepartsberoenden. Språkuppslagningen kontrollerar `--lang`, därefter `LC_ALL`, `LC_MESSAGES` och `LANG`, med `en` som reservvärde.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Utveckling

Installera [mise](https://mise.jdx.dev/) och använd den Python-version som är låst i `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Validering skriver rapporter under `test-results/`; byggskript skriver till `dist/`. För att köra den hostade skrivbordssviten på `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Lokal skrivbords-E2E kräver ett dedikerat inloggat testkonto och de behörigheter som beskrivs i [E2E-guiden](../../../tests/e2e/README.md). Det hostade skriptet för behörighetsprovisionering är begränsat till engångsjobb som körs på GitHub.

Använd [Conventional Commits](https://www.conventionalcommits.org/) och följ [CONTRIBUTING.md](../../../CONTRIBUTING.md). Senaste ändringarna dokumenteras i [CHANGELOG.md](../../../CHANGELOG.md).

Säkerhetskontroller, verifiering av releasesignaturer och återstående
Scorecard-begränsningar dokumenteras i [säkerhetsbedömningen](../../../docs/security-assessment.md).
Releasearbetsflödet bygger och attesterar paket innan ett releaseutkast skapas,
inklusive signerad in-toto-proveniens och Sigstore-paket verifierade mot
källkodscommiten och ref. Ny proveniens gäller dessa arbetsflödesbyggen, inte
äldre nedladdningar.

## Projekthistorik och licens

MacGTD slår samman de tidigare arkiven MacGTD-Native, MacGTD-Microsoft, MacGTD-Google och AlfredGTD. Projektet är licensierat under [MIT-licensen](../../../LICENSE).
