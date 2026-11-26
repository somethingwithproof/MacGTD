# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · **Polski** · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD to zbiór przepływów pracy dla systemu macOS służących do przechwytywania zadań, porządkowania przypomnień oraz prowadzenia sesji skupienia z limitem czasu w aplikacjach, z których już korzystasz.**

Oparty na metodologii [Getting Things Done](https://gettingthingsdone.com/), projekt wprowadza przechwytywanie przez okno dialogowe, ze schowka i wsadowe do aplikacji Apple Reminders, przechwytywanie wydarzeń do aplikacji Calendar oraz polecenia do obsługi zadań, notatek, projektów i sesji skupienia w aplikacji Alfred. AppleScript i Automator zapewniają natywnym przepływom pracy ścisłą integrację z systemem macOS. Adaptery API korzystają z Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 oraz Google Keep v1. Dołączono również adaptery dla aplikacji Things i OmniFocus. Testy hostowane weryfikują adaptery API względem lokalnego środowiska testowego HTTPS (fixture); pełna zgodność w środowisku produkcyjnym nadal wymaga dedykowanych kont u dostawców.

## Możliwości

- **Przechwytywanie bez przełączania aplikacji.** Użyj usługi Automator, słowa kluczowego Alfred lub schowka, aby dodać zadanie. Przechwytywanie wsadowe tworzy jedno przypomnienie dla każdego niepustego wiersza.
- **Przekształcanie tekstu w ustrukturyzowane zadania.** Parsuj daty względne i ISO, godziny, priorytety, konteksty oraz projekty za pomocą produkcyjnego parsera AppleScript współdzielonego przez natywne szybkie przechwytywanie i przechwytywanie do Calendar.
- **Przechwytywanie wydarzeń i przegląd skrzynki odbiorczej.** Twórz wydarzenia w Calendar z godziną, czasem trwania i lokalizacją; przeprowadzaj pięcioetapowy przegląd tygodniowy wraz ze zrzutem myśli (brain dump) do Reminders.
- **Praca w sesjach skupienia z limitem czasu.** Uruchamiaj, sprawdzaj i zatrzymuj sesje między procesami. Timery launchd przypisane do sesji obsługują wygaśnięcie i anulowanie, a logi JSONL dostarczają danych analitycznych o czasie trwania.
- **Wykorzystanie aplikacji Alfred nie tylko do zadań.** Twórz listy Reminders dla projektów, zapisuj notatki referencyjne, otwieraj skrzynkę odbiorczą do przeglądu, przechwytuj tekst ze schowka i edytuj preferencje z walidacją typów.
- **Podgląd skrzynki odbiorczej z paska menu.** Opcjonalna wtyczka SwiftBar/xbar wyświetla liczbę nieukończonych zadań w skrzynce odbiorczej oraz odnośniki do przepływów przechwytywania.

Natywne działanie jest sprawdzane na rzeczywistych maszynach Mac hostowanych w GitHub: testy obsługują okna dialogowe Automator, a następnie odczytują z powrotem rekordy z Reminders i Calendar. Zobacz [testowanie i zgodność](#testowanie-i-zgodność), aby poznać zakres tych testów.

## Szybki start: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Otwórz przepływ pracy w aplikacji Automator i uruchom go, aby przetestować przechwytywanie. Aby udostępnić go jako usługę (Service), zainstaluj pakiet w katalogu `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Przypisz skrót w **System Settings → Keyboard → Keyboard Shortcuts → Services** (Ustawienia systemowe → Klawiatura → Skróty klawiszowe → Usługi). Zezwól na dostęp automatyzacji do Reminders, gdy macOS o to poprosi. Wpisz:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Natywny przepływ tworzy przypomnienie o wysokim priorytecie z terminem na jutro, kieruje je do listy `shopping` i zapisuje kontekst. Bez znacznika projektu lub kontekstu szybkie przechwytywanie używa listy `Inbox`.

## Składnia przechwytywania

Natywny parser zadań oraz przechwytywanie zadań w Alfred rozpoznają następujące znaczniki. Adaptery dostawców mają własną obsługę pól i routingu.

| Wejście | Znaczenie | Przykład |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Wysoki, średni lub niski priorytet | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Względny termin wykonania | `Call dentist tomorrow` |
| Dzień tygodnia lub `next weekday` | Termin w określony dzień tygodnia | `Send report next monday` |
| `due:YYYY-MM-DD` | Jawny termin wykonania | `Renew membership due:2027-03-15` |
| Godzina wraz z datą | Godzina wykonania | `Call Alex tomorrow at 3pm` |
| `@context` | Znacznik kontekstu | `Buy milk @errands` |
| `+project` | Routing do projektu/listy | `Draft outline +website` |

Akceptowane są również zapisy `due:today` oraz `due:tomorrow`. W znacznikach kontekstu i projektu używaj liter, cyfr, podkreśleń lub łączników. Natywne szybkie przechwytywanie nadaje routingowi projektu wyższy priorytet niż routingowi kontekstu.

Przechwytywanie do Calendar wykorzystuje `@` do określenia lokalizacji wydarzenia i akceptuje czas trwania w minutach lub godzinach:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Bez podanej godziny lub czasu trwania przechwytywanie do Calendar ustawia godzinę 9:00 AM i jedną godzinę trwania w pierwszym kalendarzu z prawem zapisu.

## Wybór przepływu pracy

### Natywne przepływy Apple

| Przepływ pracy | Działanie | Pakiet |
| --- | --- | --- |
| Szybkie przechwytywanie | Parsuje tekst zadania i tworzy przypomnienie | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Przechwytywanie ze schowka | Tworzy przypomnienie z tekstu w schowku | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Przechwytywanie wsadowe | Tworzy przypomnienia z wielu wierszy | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Przechwytywanie wydarzeń | Tworzy wydarzenie w Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Przegląd tygodniowy | Przegląd z przewodnikiem i zrzut myśli do przypomnień | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Otwórz pakiet w Automator, aby go wypróbować, lub zainstaluj go w `~/Library/Services`, aby uzyskać dostęp z klawiatury. Aplikacje Reminders i Calendar wymagają odpowiednich uprawnień automatyzacji w systemie macOS.

### Alfred

Wymaga aplikacji Alfred z dodatkiem Powerpack. Zbuduj pakiet z bieżącego kodu źródłowego:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Pakiet możesz również pobrać z sekcji [wydań (releases)](https://github.com/somethingwithproof/MacGTD/releases). Pakiety wydań odpowiadają otagowanemu kodowi źródłowemu; funkcje dodane do gałęzi `main` po wydaniu wymagają zbudowania ze źródeł.

| Słowo kluczowe | Akcja |
| --- | --- |
| `task` | Przechwycenie zadania z parsowaniem daty, kontekstu, projektu i priorytetu |
| `note` | Zapisanie notatki referencyjnej w Reminders |
| `project` | Utworzenie listy w Reminders |
| `gtd process` | Otwarcie Inbox do ręcznego przeglądu |
| `clip` | Przechwycenie tekstu ze schowka |
| `gtd focus` | Uruchomienie sesji skupienia, sprawdzenie stanu lub zatrzymanie |
| `gtd analytics` | Przegląd zarejestrowanych czasów trwania sesji skupienia |
| `gtd preferences` | Edycja preferencji przepływu pracy |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Preferencje znajdują się w `~/Library/Preferences/com.alfredgtd.plist`, a stan sesji skupienia i logi w `~/.gtd`. Preferencje mają wbudowane wartości domyślne, kontrolę typów, walidację importu oraz zapis atomowy. Sesje skupienia nie zmieniają systemowych ustawień powiadomień. Przetwarzanie skrzynki Inbox otwiera listę do przeglądu; nie przenosi ani nie oznacza zadań jako ukończonych automatycznie.

Zobacz [przewodnik po Alfred](../../../workflows/alfred/README.md) oraz [dokumentację biblioteki GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Zewnętrzne adaptery przechwytywania

Wszystkie cztery przepływy przechwytywania przez API są testowane w hostowanych testach E2E za pomocą rzeczywistych okien dialogowych Automator oraz lokalnego środowiska testowego TLS (fixture). Oddzielny zestaw testów ręcznych weryfikuje rzeczywiste zapisywanie danych u dostawców po skonfigurowaniu dedykowanych kont. Things i OmniFocus wymagają zestawu testów integracji desktopowej z licencjonowanymi aplikacjami.

| Cel | Mechanizm | Konfiguracja / źródło |
| --- | --- | --- |
| Todoist | Przechwytywanie przez API | [Przepływ pracy i konfiguracja Keychain](../../../workflows/todoist/) |
| Notion | Przechwytywanie przez API źródeł danych | [Przepływ pracy i konfiguracja Keychain](../../../workflows/notion/) |
| Things 3 | Schemat URL | [Przepływ pracy](../../../workflows/things/) |
| OmniFocus | AppleScript / schemat URL | [Przepływ pracy](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Przepływ pracy](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Przepływ pracy](../../../workflows/google/) |

Adaptery API wymagają konfiguracji danych uwierzytelniających; Microsoft wymaga delegowanej autoryzacji OAuth, a Google Keep kwalifikującego się dostępu Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Zobacz [konfigurację API, migrację i wymagania autoryzacji](../../../workflows/api/README.md). Istniejące identyfikatory baz danych Notion są migrowane wyłącznie wtedy, gdy zostanie znalezione dokładnie jedno źródło danych. Przechwytywanie do Microsoft i Google korzysta z interfejsów API zamiast nieudokumentowanych skrótów przeglądarkowych. Tokeny dostępu OAuth wymagają odnawiania przez klienta OAuth. Ładunki używają jawnych kluczy JSON, ograniczonych czasowo żądań HTTPS oraz potwierdzenia odpowiedzi. Komunikaty o błędach zachowują szczegóły niepowodzenia, jednocześnie maskując skonfigurowany token API. Zobacz [SECURITY.md](../../../SECURITY.md), aby zgłosić problemy z bezpieczeństwem.

### Pasek menu i Shortcuts

[Przewodnik po pasku menu](../../../workflows/menubar/README.md) opisuje opcjonalną wtyczkę SwiftBar/xbar. Najpierw zainstaluj usługi Apple, następnie skonfiguruj katalog wtyczek w swojej aplikacji paska menu i utwórz w nim dowiązanie do `workflows/menubar/gtd-menubar.sh`.

[Przewodnik po Shortcuts](../../../workflows/shortcuts/README.md) zawiera instrukcję ręcznej konfiguracji przechwytywania tekstu, schowka oraz przez Siri w systemie macOS 12+. Shortcuts i aktywacja głosowa Siri nie są objęte hostowanym zestawem testów.

## Architektura

Pakiety Automator osadzają kod AppleScript, dzięki czemu mogą działać jako natywne usługi (Services). Alfred pakuje skrypty akcji i przekazuje dane wprowadzone przez użytkownika jako argumenty. GTDLib udostępnia współdzielone natywne operacje na Reminders z edytowalnego kodu źródłowego AppleScript oraz skompilowanego pakietu skryptów.

- **Jeden parser produkcyjny:** `scripts/sync-native-parser.py` osadza współdzielony parser w przepływach Quick Capture i Event Capture; walidacja wykrywa rozbieżności względem źródła.
- **Trwały stan skupienia:** oddzielne wywołania współdzielą stan sesji, z własnymi zadaniami launchd i ograniczonym zliczaniem czasu trwania.
- **Powtarzalne pakiety:** proces pakowania buduje świeże archiwum, a testy porównują jego zawartość ze źródłem. Biblioteka ma oddzielny skrypt kompilacji.
- **Obserwowalne testy:** raporty JUnit, logi poleceń oraz przetestowane artefakty kompilacji są przechowywane przez 14 dni w GitHub Actions.

| Katalog | Odpowiedzialność |
| --- | --- |
| [`workflows/`](../../../workflows/) | Pakiety natywne, adaptery dostawców, skrypty Alfred, Shortcuts i paska menu |
| [`scripts/`](../../../scripts/) | Pakowanie, kompilacja biblioteki, synchronizacja parsera oraz udostępnianie środowiska dla testów hostowanych |
| [`tests/`](../../../tests/) | Walidacja, testy komponentów oraz natywne testy E2E na desktopie |
| [`.github/workflows/`](../../../.github/workflows/) | CI, nocne/ręczne testy E2E oraz utrzymanie repozytorium |
| [`infra/`](../../../infra/) | Opcjonalna konfiguracja lokalnego i EC2 runnera Mac; hostowane CI jej nie wymaga |

## Testowanie i zgodność

| Zakres | Środowisko | Co jest sprawdzane |
| --- | --- | --- |
| Walidacja | Hostowany w GitHub macOS 15 i 26 | Kompilacja AppleScript, pakiety, parser produkcyjny, cele akcji, preferencje, stan skupienia, transport API fixture oraz poprawność pakowania i rozpakowywania |
| Kontrole bezpieczeństwa | Hostowane w GitHub Ubuntu i macOS 15 | Python CodeQL, ShellCheck oraz ograniczony fuzzing Atheris skompilowanego parsera produkcyjnego |
| Testy E2E adapterów dostawców | Hostowany w GitHub `macos-15-intel` | Wszystkie cztery produkcyjne okna dialogowe API, transport TLS, zapis/odczyt w fixture, błędy API, anulowanie oraz wybór źródła Notion |
| Testy E2E dostawców na żywo | Ręczne uruchomienie na Macu hostowanym w GitHub z dedykowanymi sekretami | Rzeczywiste przechwytywanie w Todoist, Notion, Microsoft i Google oraz odczyt zwrotny u dostawców; kończy się błędem w razie braku kont |
| Integracje z licencjonowanymi aplikacjami desktopowymi | Dedykowane konto lokalne | Wywołanie i zapis w interfejsie aplikacji Things 3, OmniFocus 4 oraz Alfred |
| Natywne testy E2E na desktopie | Hostowany w GitHub `macos-15-intel` | Rzeczywiste okna dialogowe Automator; utrwalone dane w Reminders i Calendar; przegląd tygodniowy; liczniki w menu; skompilowana biblioteka GTDLib; spakowane natywne akcje Alfred; rzeczywiste wygaśnięcie i anulowanie timera launchd |
| Opcjonalny interfejs Alfred | Dedykowane konto lokalne, Alfred 5 + Powerpack | Import przepływu pracy, wywołanie słowem kluczowym oraz odczyt przypomnienia przez licencjonowany interfejs |

[Zweryfikowane uruchomienie modernizacji API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) przeszło pomyślnie **35 testów walidacji na każdej platformie walidacyjnej oraz 26 testów desktopowych E2E**, bez żadnych niepowodzeń, błędów ani pominięć. Pokrycie desktopowe obejmuje 15 testów natywnych oraz 11 testów adapterów dostawców, w tym rzeczywiste sprawdzenie limitu czasu transportu i tymczasowych operacji Keychain. Walidacja uruchamia również kontrolę struktury repozytorium. Wyniki te obejmują zachowanie natywne oraz środowiska testowe (fixtures) dostawców; nie potwierdzają zgodności z kontami produkcyjnymi dostawców ani aplikacjami licencjonowanymi. Bieżący stan przedstawiają powyższe odznaki.

Pull requesty oraz wypchnięcia (pushes) do gałęzi `main` uruchamiają walidację, a następnie natywne testy E2E. Przepływ E2E uruchamia się również co noc oraz na żądanie ręczne, obejmując deterministyczne testy adapterów dostawców. Testy na żywo u dostawców wykorzystują osobny, ręczny przepływ `live-e2e.yml`. Domyślne CI korzysta z jednorazowych maszyn Mac hostowanych w GitHub, izolowanych środowisk testowych (fixtures) oraz ograniczonych podprocesów; dla domyślnego zestawu testów nie jest wymagany własny runner ani dane logowania do kont zewnętrznych. Ręczny zestaw testów na żywo wymaga dedykowanych sekretów dostawców.

Wcześniejsze wersje systemu macOS nie są weryfikowane przez obecne CI. Uruchomienia z dostawcami na żywo wymagają dedykowanych sekretów i nie zostały jeszcze zweryfikowane. Shortcuts/Siri oraz licencjonowane aplikacje desktopowe znajdują się poza domyślnym hostowanym zestawem testów. Testy natywnych akcji wywołują spakowane skrypty Alfred bezpośrednio; nie potwierdzają pełnej zgodności z interfejsem użytkownika aplikacji Alfred. Zobacz [konfigurację testów, wymagania wstępne i pokrycie](../../../tests/e2e/README.md).

## Lokalizacja

Komunikaty dla użytkownika w CLI, runnerze testów oraz na pasku menu są dostarczane w 45 wersjach językowych (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) w katalogu `locales/` za pośrednictwem `scripts/i18n.py` bez żadnych zależności zewnętrznych. Rozpoznawanie ustawień regionalnych sprawdza `--lang`, następnie `LC_ALL`, `LC_MESSAGES` i `LANG`, z powrotem awaryjnym do `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Rozwój

Zainstaluj narzędzie [mise](https://mise.jdx.dev/) i użyj wersji Pythona przypiętej w `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Walidacja zapisuje raporty w katalogu `test-results/`, a skrypty budowania w `dist/`. Aby uruchomić hostowany zestaw testów desktopowych na gałęzi `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Lokalne testy desktopowe E2E wymagają dedykowanego, zalogowanego konta testowego oraz uprawnień opisanych w [przewodniku E2E](../../../tests/e2e/README.md). Skrypt nadający uprawnienia w środowisku hostowanym jest ograniczony do jednorazowych zadań hostowanych w GitHub.

Stosuj konwencję [Conventional Commits](https://www.conventionalcommits.org/) i postępuj zgodnie z [CONTRIBUTING.md](../../../CONTRIBUTING.md). Ostatnie zmiany są zapisane w [CHANGELOG.md](../../../CHANGELOG.md).

Mechanizmy bezpieczeństwa, weryfikacja podpisów wydań oraz pozostałe ograniczenia Scorecard są udokumentowane w [ocenie bezpieczeństwa](../../../docs/security-assessment.md). Przepływ wydawniczy buduje i poświadcza pakiety przed utworzeniem szkicu wydania, w tym podpisane poświadczenie pochodzenia (provenance) in-toto oraz pakiety Sigstore weryfikowane względem źródłowego commita i referencji (ref). Nowe poświadczenia pochodzenia dotyczą wyłącznie tych kompilacji z przepływu, a nie starszych plików do pobrania.

## Historia projektu i licencja

MacGTD konsoliduje wcześniejsze repozytoria MacGTD-Native, MacGTD-Microsoft, MacGTD-Google oraz AlfredGTD. Projekt jest objęty licencją [MIT License](../../../LICENSE).
