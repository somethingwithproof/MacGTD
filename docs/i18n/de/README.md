# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · **Deutsch** · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD ist eine Sammlung von macOS-Workflows zum Erfassen von Aufgaben, Organisieren von Erinnerungen und Ausführen zeitgesteuerter Fokussitzungen mit den Apps, die du bereits verwendest.**

Aufbauend auf [Getting Things Done](https://gettingthingsdone.com/) bringt MacGTD Dialog-, Zwischenablage- und Stapelerfassung in Apple Erinnerungen, Terminerfassung in Kalender sowie Aufgaben-, Notiz-, Projekt- und Fokusbefehle in Alfred. AppleScript und Automator halten die nativen Workflows nah an macOS. Die API-Adapter nutzen Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 und Google Keep v1. Adapter für Things und OmniFocus sind ebenfalls enthalten. Gehostete Tests überprüfen die API-Adapter gegen ein lokales HTTPS-Fixture; für Live-Kompatibilität sind weiterhin dedizierte Anbieterkonten erforderlich.

## Funktionsumfang

- **Erfassen ohne App-Wechsel.** Füge Aufgaben über einen Automator-Dienst, ein Alfred-Schlüsselwort oder die Zwischenablage hinzu. Die Stapelerfassung legt für jede nicht leere Zeile eine eigene Erinnerung an.
- **Text in strukturierte Aufgaben umwandeln.** Verarbeite relative und ISO-Daten, Uhrzeiten, Prioritäten, Kontexte und Projekte mit dem produktiven AppleScript-Parser, den die native Schnellerfassung und die Kalendererfassung gemeinsam nutzen.
- **Termine erfassen und die Inbox prüfen.** Erstelle Kalendertermine mit Uhrzeit, Dauer und Ort; führe einen fünfschrittigen Wochenrückblick mit einem Brain Dump in Erinnerungen durch.
- **In zeitgesteuerten Fokussitzungen arbeiten.** Starte, inspiziere und beende Sitzungen prozessübergreifend. Sitzungseigene launchd-Timer übernehmen Ablauf und Abbruch; JSONL-Protokolle liefern Auswertungen zur Dauer.
- **Alfred für mehr als nur Aufgaben nutzen.** Erstelle Erinnerungslisten für Projekte, speichere Referenznotizen, öffne die Inbox zur Überprüfung, erfasse Text aus der Zwischenablage und bearbeite typisierte Einstellungen.
- **Die Inbox direkt in der Menüleiste sehen.** Das optionale SwiftBar/xbar-Plugin zeigt die Anzahl offener Inbox-Einträge an und verlinkt auf die Erfassungs-Workflows.

Natives Verhalten wird auf echten GitHub-gehosteten Macs geprüft: Tests bedienen Automator-Dialoge und lesen anschließend Einträge aus Erinnerungen und Kalender aus. Siehe [Tests und Kompatibilität](#testing-and-compatibility) für den Umfang dieses Nachweises.

## Schnellstart: Apple Erinnerungen

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Öffne den Workflow in Automator und führe ihn aus, um die Erfassung zu testen. Um ihn als Dienst verfügbar zu machen, installiere das Bundle unter `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Weise unter **Systemeinstellungen → Tastatur → Tastaturkurzbefehle → Dienste** ein Tastaturkürzel zu. Erlaube den Automationszugriff auf Erinnerungen, wenn macOS danach fragt. Gib Folgendes ein:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Der native Workflow erstellt eine Erinnerung mit hoher Priorität und Fälligkeit morgen, leitet sie an die Liste `shopping` weiter und speichert den Kontext. Ohne Projekt- oder Kontextmarkierung verwendet die Schnellerfassung `Inbox`.

## Erfassungssyntax

Der native Aufgaben-Parser und die Alfred-Aufgabenerfassung erkennen diese Markierungen. Anbieter-Adapter verfügen über eigene Feld- und Weiterleitungsunterstützung.

| Eingabe | Bedeutung | Beispiel |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Hohe, mittlere oder niedrige Priorität | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Relatives Fälligkeitsdatum | `Call dentist tomorrow` |
| Wochentag oder `next weekday` | Wochentag als Fälligkeitsdatum | `Send report next monday` |
| `due:YYYY-MM-DD` | Explizites Fälligkeitsdatum | `Renew membership due:2027-03-15` |
| Uhrzeit zusammen mit einem Datum | Fälligkeitszeit | `Call Alex tomorrow at 3pm` |
| `@context` | Kontextmarkierung | `Buy milk @errands` |
| `+project` | Projekt-/Listenzuweisung | `Draft outline +website` |

`due:today` und `due:tomorrow` werden ebenfalls akzeptiert. Verwende Buchstaben, Zahlen, Unterstriche oder Bindestriche in Kontext- und Projektmarkierungen. Bei der nativen Schnellerfassung hat die Projektzuweisung Vorrang vor der Kontextzuweisung.

Die Kalendererfassung verwendet `@` für den Terminort und akzeptiert eine Dauer in Minuten oder Stunden:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Ohne explizite Uhrzeit oder Dauer verwendet die Kalendererfassung 9:00 Uhr und eine Stunde im ersten beschreibbaren Kalender.

## Workflow auswählen

### Native Apple-Workflows

| Workflow | Verhalten | Bundle |
| --- | --- | --- |
| Schnellerfassung | Aufgabentext parsen und Erinnerung erstellen | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Zwischenablage-Erfassung | Erinnerung aus Text der Zwischenablage erstellen | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Stapelerfassung | Erinnerungen aus mehreren Zeilen erstellen | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Terminerfassung | Kalendertermin erstellen | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Wochenrückblick | Geführter Rückblick und Erinnerungs-Brain-Dump | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Öffne ein Bundle in Automator, um es auszuprobieren, oder installiere es für den Tastaturzugriff unter `~/Library/Services`. Erinnerungen und Kalender benötigen die entsprechenden macOS-Automationsberechtigungen.

### Alfred

Erfordert Alfred mit Powerpack. Paket aus dem aktuellen Quellcode bauen:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Du kannst das Paket auch über [Releases](https://github.com/somethingwithproof/MacGTD/releases) herunterladen. Release-Pakete entsprechen dem jeweiligen getaggten Quellcode; Funktionen, die nach einem Release zu `main` hinzugefügt wurden, erfordern einen Build aus dem Quellcode.

| Schlüsselwort | Aktion |
| --- | --- |
| `task` | Aufgabe mit Erkennung von Datum, Kontext, Projekt und Priorität erfassen |
| `note` | Referenznotiz in Erinnerungen speichern |
| `project` | Erinnerungsliste erstellen |
| `gtd process` | Inbox zur manuellen Überprüfung öffnen |
| `clip` | Text aus der Zwischenablage erfassen |
| `gtd focus` | Fokussitzung starten, Status prüfen oder beenden |
| `gtd analytics` | Aufgezeichnete Fokusdauern auswerten |
| `gtd preferences` | Workflow-Einstellungen bearbeiten |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Die Einstellungen liegen in `~/Library/Preferences/com.alfredgtd.plist`; Fokusstatus und Protokolle befinden sich unter `~/.gtd`. Einstellungen verfügen über integrierte Standardwerte, Typprüfungen, validierte Importe und atomare Schreibvorgänge. Fokussitzungen ändern die System-Mitteilungseinstellungen nicht. Die Inbox-Verarbeitung öffnet die Liste zur Überprüfung; Aufgaben werden nicht automatisch verschoben oder als erledigt markiert.

Siehe das [Alfred-Handbuch](../../../workflows/alfred/README.md) und die [GTDLib-Bibliotheksdokumentation](../../../workflows/alfred/GTDLib.scptd/README.md).

### Externe Erfassungsadapter

Alle vier API-Erfassungs-Workflows werden in den gehosteten E2E-Tests über echte Automator-Dialoge und ein lokales TLS-Fixture getestet. Eine separate manuelle Testsuite prüft die echte Anbieter-Persistenz, sobald dedizierte Konten konfiguriert sind. Things und OmniFocus erfordern die lizenzierte Desktop-Integrationssuite.

| Ziel | Mechanismus | Einrichtung / Quelle |
| --- | --- | --- |
| Todoist | API-Erfassung | [Workflow- und Schlüsselbund-Einrichtung](../../../workflows/todoist/) |
| Notion | Data-Source-API-Erfassung | [Workflow- und Schlüsselbund-Einrichtung](../../../workflows/notion/) |
| Things 3 | URL-Schema | [Workflow](../../../workflows/things/) |
| OmniFocus | AppleScript / URL-Schema | [Workflow](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Workflow](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Workflow](../../../workflows/google/) |

API-Adapter erfordern eine Einrichtung der Zugangsdaten; Microsoft benötigt eine delegierte OAuth-Autorisierung und Google Keep einen berechtigten Workspace-Zugriff:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Siehe [API-Einrichtung, Migration und Autorisierungsanforderungen](../../../workflows/api/README.md). Bestehende Notion-Datenbank-IDs werden nur migriert, wenn genau eine Datenquelle gefunden wird. Die Erfassung für Microsoft und Google nutzt APIs statt undokumentierter Browser-Kurzbefehle. OAuth-Zugriffstoken müssen über deinen OAuth-Client erneuert werden. Payloads verwenden explizite JSON-Schlüssel, begrenzte HTTPS-Anfragen und Antwortbestätigungen. Fehlermeldungen behalten Fehlerdetails bei, schwärzen jedoch das konfigurierte API-Token. Hinweise zum Melden von Sicherheitsproblemen findest du in [SECURITY.md](../../../SECURITY.md).

### Menüleiste und Kurzbefehle

Das [Menüleisten-Handbuch](../../../workflows/menubar/README.md) beschreibt das optionale SwiftBar/xbar-Plugin. Installiere zuerst die Apple-Dienste, konfiguriere dann das Plugin-Verzeichnis in deiner Menüleisten-App und verlinke `workflows/menubar/gtd-menubar.sh` dorthin.

Das [Kurzbefehle-Handbuch](../../../workflows/shortcuts/README.md) beschreibt die manuelle Einrichtung für Text-, Zwischenablage- und Siri-Erfassung ab macOS 12+. Kurzbefehle und Siri-Sprachaktivierung liegen außerhalb der gehosteten Testsuite.

## Architektur

Automator-Bundles betten AppleScript ein, damit sie als native Dienste ausgeführt werden können. Alfred paketiert die Aktionsskripte und übergibt Benutzereingaben als Argumente. GTDLib stellt gemeinsam genutzte native Erinnerungsoperationen aus bearbeitbarem AppleScript-Quellcode und einem kompilierten Skript-Bundle bereit.

- **Ein produktiver Parser:** `scripts/sync-native-parser.py` bettet den gemeinsamen Parser in die Schnellerfassung und Terminerfassung ein; die Validierung erkennt Abweichungen im Quellcode.
- **Persistenter Fokusstatus:** Getrennte Aufrufe teilen sich den Sitzungszustand, mit eigenen launchd-Jobs und begrenzter Zeiterfassung.
- **Reproduzierbare Pakete:** Die Paketierung erstellt ein frisches Archiv, und Tests vergleichen dessen Inhalt mit dem Quellcode. Die Bibliothek verfügt über ein eigenes Kompilierungsskript.
- **Nachvollziehbare Tests:** JUnit-Berichte, Befehlsprotokolle und getestete Build-Artefakte werden in GitHub Actions 14 Tage lang aufbewahrt.

| Verzeichnis | Zuständigkeit |
| --- | --- |
| [`workflows/`](../../../workflows/) | Native Bundles, Anbieter-Adapter, Alfred, Kurzbefehle und Menüleisten-Skripte |
| [`scripts/`](../../../scripts/) | Paketierung, Bibliothekskompilierung, Parser-Synchronisierung und Bereitstellung gehosteter Tests |
| [`tests/`](../../../tests/) | Validierung, Komponentenprüfungen und native Desktop-E2E-Tests |
| [`.github/workflows/`](../../../.github/workflows/) | CI, nächtliche/manuelle E2E-Läufe und Repository-Wartung |
| [`infra/`](../../../infra/) | Optionale Einrichtung lokaler und EC2-Mac-Runner; für gehostete CI nicht erforderlich |

## Tests und Kompatibilität

| Bereich | Umgebung | Was geprüft wird |
| --- | --- | --- |
| Validierung | Gehostetes GitHub macOS 15 und 26 | AppleScript-Kompilierung, Bundles, produktiver Parser, Aktionsziele, Einstellungen, Fokusstatus, Fixture-API-Transport und Paket-Roundtrips |
| Sicherheitsprüfungen | Gehostetes GitHub Ubuntu und macOS 15 | Python CodeQL, ShellCheck und begrenztes Atheris-Fuzzing des kompilierten produktiven Parsers |
| Anbieter-Adapter-E2E | Gehostetes GitHub `macos-15-intel` | Alle vier produktiven API-Dialoge, TLS-Transport, Fixture-Persistenz/Rücklesung, API-Fehler, Abbruch und Notion-Quellenauswahl |
| Live-Anbieter-E2E | Manueller GitHub-gehosteter Mac-Lauf mit dedizierten Secrets | Echte Erfassung und Anbieter-Rücklesung für Todoist, Notion, Microsoft und Google; schlägt fehl, wenn Konten fehlen |
| Lizenzierte Desktop-Integrationen | Dediziertes lokales Konto | Things 3, OmniFocus 4 und Alfred-UI-Aufruf sowie Persistenz |
| Native Desktop-E2E | Gehostetes GitHub `macos-15-intel` | Echte Automator-Dialoge; persistierte Daten in Erinnerungen und Kalender; Wochenrückblick; Menüzähler; kompiliertes GTDLib; paketierte native Alfred-Aktionen; echter launchd-Timer-Ablauf und -Abbruch |
| Optionale Alfred-UI | Dediziertes lokales Konto, Alfred 5 + Powerpack | Workflow-Import, Schlüsselwort-Aufruf und Erinnerungs-Rücklesung über die lizenzierte UI |

Der [verifizierte API-Modernisierungslauf](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) bestand **35 Validierungstests auf jeder Validierungsplattform und 26 Desktop-E2E-Tests** ohne Fehlschläge, Fehler oder übersprungene Tests. Die Desktop-Abdeckung umfasst 15 native Tests und 11 Anbieter-Adapter-Tests, einschließlich realer Transport-Timeouts und temporärer Schlüsselbund-Prüfungen. Die Validierung führt außerdem Strukturprüfungen des Repositorys durch. Diese Ergebnisse decken natives Verhalten und Anbieter-Fixtures ab; sie belegen keine Kompatibilität mit Live-Anbietern oder lizenzierten Apps. Der aktuelle Status wird durch die Badges oben angezeigt.

Bei Pull Requests und Pushes auf `main` laufen zunächst die Validierung und anschließend die nativen E2E-Tests. Der E2E-Workflow läuft außerdem nächtlich sowie bei manuellem Auslösen, einschließlich deterministischer Anbieter-Adapter-Tests. Live-Anbietertests nutzen den separaten manuellen Workflow `live-e2e.yml`. Die Standard-CI verwendet kurzlebige GitHub-gehostete Macs, isolierte Fixtures und begrenzte Subprozesse; für die Standardsuite sind weder selbst gehostete Runner noch externe Kontodaten erforderlich. Die manuelle Live-Suite erfordert dedizierte Anbieter-Secrets.

Ältere macOS-Versionen werden von der aktuellen CI nicht validiert. Live-Anbieterläufe erfordern dedizierte Secrets und wurden noch nicht verifiziert. Kurzbefehle/Siri und lizenzierte Desktop-Apps liegen außerhalb der standardmäßigen gehosteten Suite. Native Aktionstests führen paketierte Alfred-Skripte direkt aus; sie belegen keine vollständige Alfred-UI-Kompatibilität. Siehe [Test-Einrichtung, Voraussetzungen und Abdeckung](../../../tests/e2e/README.md).

## Lokalisierung

Benutzersichtbare Zeichenketten für CLI, Test-Runner und Menüleiste werden in 45 Gebietsschemata (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) unter `locales/` über `scripts/i18n.py` ohne Drittanbieter-Abhängigkeiten ausgeliefert. Die Gebietsschema-Auflösung prüft `--lang`, dann `LC_ALL`, `LC_MESSAGES` und `LANG` und fällt auf `en` zurück.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Entwicklung

Installiere [mise](https://mise.jdx.dev/) und verwende die in `.mise.toml` festgelegte Python-Version:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Die Validierung schreibt Berichte unter `test-results/`; Build-Skripte schreiben nach `dist/`. Um die gehostete Desktop-Suite auf `main` auszuführen:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Lokale Desktop-E2E-Tests erfordern ein dediziertes angemeldetes Testkonto und die im [E2E-Handbuch](../../../tests/e2e/README.md) beschriebenen Berechtigungen. Das gehostete Skript zur Berechtigungsvergabe ist auf kurzlebige GitHub-gehostete Jobs beschränkt.

Verwende [Conventional Commits](https://www.conventionalcommits.org/) und beachte [CONTRIBUTING.md](../../../CONTRIBUTING.md). Aktuelle Änderungen sind in [CHANGELOG.md](../../../CHANGELOG.md) dokumentiert.

Sicherheitskontrollen, die Überprüfung von Release-Signaturen und verbleibende
Scorecard-Einschränkungen sind in der [Sicherheitsbewertung](../../../docs/security-assessment.md)
dokumentiert. Der Release-Workflow baut und attestiert Pakete vor dem Erstellen
eines Release-Entwurfs, einschließlich signierter in-toto-Provenienz und
Sigstore-Bundles, die gegen den Quell-Commit und die Ref verifiziert werden.
Neue Provenienznachweise gelten für diese Workflow-Builds, nicht für ältere Downloads.

## Projekthistorie und Lizenz

MacGTD führt die früheren Repositories MacGTD-Native, MacGTD-Microsoft, MacGTD-Google und AlfredGTD zusammen. Es steht unter der [MIT-Lizenz](../../../LICENSE).
