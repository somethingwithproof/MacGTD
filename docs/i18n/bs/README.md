# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (28 locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · **Bosanski** · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Hrvatski](../hr/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Српски](../sr/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD je zbirka macOS tokova rada za brzo unošenje zadataka, organizovanje podsjetnika i vođenje vremenski ograničenih fokus-sesija u aplikacijama koje već koristite.**

Izgrađen oko metodologije [Getting Things Done](https://gettingthingsdone.com/), donosi unos putem dijaloga, međuspremnika i grupnog unosa u Apple Reminders, unos događaja u Calendar te komande za zadatke, bilješke, projekte i fokus u Alfred. AppleScript i Automator drže izvorne tokove rada blisko povezanim sa sistemom macOS. API adapteri koriste Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 i Google Keep v1. Uključeni su i adapteri za Things i OmniFocus. Hostovani testovi provjeravaju API adaptere na lokalnom HTTPS testnom serveru; kompatibilnost uživo i dalje zahtijeva namjenske korisničke naloge kod tih servisa.

## Šta možete uraditi

- **Unosite zadatke bez prebacivanja aplikacija.** Koristite Automator servis, Alfred ključnu riječ ili međuspremnik da dodate zadatak. Grupni unos kreira po jedan podsjetnik za svaki neprazan red.
- **Pretvorite tekst u strukturirane zadatke.** Parsirajte relativne i ISO datume, vremena, prioritete, kontekste i projekte pomoću produkcijskog AppleScript parsera koji dijele izvorni brzi unos i unos u Calendar.
- **Unosite događaje i pregledajte pristigle zadatke.** Kreirajte događaje u aplikaciji Calendar sa vremenom, trajanjem i lokacijom; provedite sedmični pregled u pet koraka uz prikupljanje svih ideja u Reminders.
- **Radite u vremenski ograničenim fokus-sesijama.** Pokrenite, provjerite i zaustavite sesije između različitih procesa. Vlastiti launchd tajmeri po sesiji brinu o isteku i otkazivanju, a JSONL datoteke dnevnika pružaju analitiku trajanja.
- **Koristite Alfred za više od zadataka.** Kreirajte liste u aplikaciji Reminders za projekte, spremajte referentne bilješke, otvarajte pristigle stavke za pregled, unosite tekst iz međuspremnika i uređujte tipizirane postavke.
- **Pratite pristigle zadatke iz trake menija.** Opcionalni SwiftBar/xbar dodatak prikazuje broj nezavršenih zadataka i prečice ka tokovima rada za unos.

Izvorno ponašanje provjerava se na pravim GitHub-hostovanim Mac računarima: testovi upravljaju Automator dijalozima, a zatim očitavaju zapise iz aplikacija Reminders i Calendar. Pogledajte odjeljak [testiranje i kompatibilnost](#testiranje-i-kompatibilnost) za obim te provjere.

## Brzi početak: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Otvorite tok rada u aplikaciji Automator i pokrenite ga da isprobate unos. Da bi bio dostupan kao servis (Service), instalirajte paket u `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Dodijelite prečicu u **System Settings → Keyboard → Keyboard Shortcuts → Services**. Odobrite Automation pristup aplikaciji Reminders kada macOS to zatraži. Unesite:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Izvorni tok rada kreira podsjetnik visokog prioriteta s rokom za sutra, usmjerava ga u listu `shopping` i zapisuje kontekst. Bez oznake projekta ili konteksta, brzi unos koristi `Inbox`.

## Sintaksa unosa

Izvorni parser zadataka i Alfred unos zadataka prepoznaju sljedeće oznake. Adapteri za vanjske servise imaju vlastitu podršku za polja i usmjeravanje.

| Unos | Značenje | Primjer |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Visoki, srednji ili niski prioritet | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Relativni rok | `Call dentist tomorrow` |
| Dan u sedmici ili `next weekday` | Rok po danu u sedmici | `Send report next monday` |
| `due:YYYY-MM-DD` | Eksplicitni datum roka | `Renew membership due:2027-03-15` |
| Vrijeme uz datum | Vrijeme roka | `Call Alex tomorrow at 3pm` |
| `@context` | Oznaka konteksta | `Buy milk @errands` |
| `+project` | Usmjeravanje u projekat/listu | `Draft outline +website` |

Prihvataju se i `due:today` te `due:tomorrow`. U oznakama konteksta i projekata koristite slova, brojeve, donje crte ili crtice. Izvorni brzi unos daje prednost usmjeravanju po projektu u odnosu na kontekst.

Unos u Calendar koristi `@` za lokaciju događaja i prihvata trajanje u minutama ili satima:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Bez eksplicitnog vremena ili trajanja, unos u Calendar koristi 9:00 AM i jedan sat u prvom kalendaru u koji je moguć upis.

## Odaberite tok rada

### Izvorni Apple tokovi rada

| Tok rada | Ponašanje | Paket |
| --- | --- | --- |
| Brzi unos | Parsira tekst zadatka i kreira podsjetnik | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Unos iz međuspremnika | Kreira podsjetnik iz teksta u međuspremniku | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Grupni unos | Kreira podsjetnike iz više redova | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Unos događaja | Kreira događaj u aplikaciji Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Sedmični pregled | Vođeni pregled i prikupljanje podsjetnika | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Otvorite paket u aplikaciji Automator da ga isprobate ili ga instalirajte u `~/Library/Services` za pristup putem tastature. Aplikacijama Reminders i Calendar potrebne su odgovarajuće macOS Automation dozvole.

### Alfred

Zahtijeva Alfred sa Powerpack licencom. Izgradite paket iz trenutnog izvornog koda:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Paket možete preuzeti i sa stranice [izdanja](https://github.com/somethingwithproof/MacGTD/releases). Paketi izdanja odražavaju označeni izvorni kod; funkcionalnosti dodane na granu `main` nakon izdanja zahtijevaju gradnju iz izvornog koda.

| Ključna riječ | Radnja |
| --- | --- |
| `task` | Unos zadatka uz parsiranje datuma, konteksta, projekta i prioriteta |
| `note` | Spremanje referentne bilješke u Reminders |
| `project` | Kreiranje liste u aplikaciji Reminders |
| `gtd process` | Otvaranje liste Inbox za ručni pregled |
| `clip` | Unos teksta iz međuspremnika |
| `gtd focus` | Pokretanje fokus-sesije, provjera statusa ili zaustavljanje |
| `gtd analytics` | Pregled zabilježenih trajanja fokus-sesija |
| `gtd preferences` | Uređivanje postavki toka rada |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Postavke se čuvaju u datoteci `~/Library/Preferences/com.alfredgtd.plist`, dok se stanje fokusa i dnevnici nalaze u direktoriju `~/.gtd`. Postavke imaju ugrađene zadane vrijednosti, provjeru tipova, validirani uvoz i atomični upis. Fokus-sesije ne mijenjaju sistemske postavke obavještenja. Obrada pristiglih zadataka samo otvara listu za pregled i ne premješta niti završava zadatke automatski.

Pogledajte [Alfred vodič](../../../workflows/alfred/README.md) i [dokumentaciju biblioteke GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Vanjski adapteri za unos

Sva četiri API toka rada za unos provjeravaju se kroz prave Automator dijaloge i lokalni TLS testni server u hostovanim E2E testovima. Zaseban ručni skup testova provjerava stvarno čuvanje kod provajdera kada su konfigurisani namjenski nalozi. Things i OmniFocus zahtijevaju licencirani paket desktop integracijskih testova.

| Cilj | Mehanizam | Podešavanje / izvor |
| --- | --- | --- |
| Todoist | API unos | [Tok rada i Keychain podešavanje](../../../workflows/todoist/) |
| Notion | Unos putem Data Source API-ja | [Tok rada i Keychain podešavanje](../../../workflows/notion/) |
| Things 3 | URL šema | [Tok rada](../../../workflows/things/) |
| OmniFocus | AppleScript / URL šema | [Tok rada](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Tok rada](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Tok rada](../../../workflows/google/) |

API adapteri zahtijevaju podešavanje akreditiva; Microsoft zahtijeva delegiranu OAuth autorizaciju, a Google Keep odgovarajući Workspace pristup:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Pogledajte [zahtjeve za API podešavanje, migraciju i autorizaciju](../../../workflows/api/README.md). Postojeći ID-ovi Notion baza podataka migriraju se samo kada je pronađen tačno jedan izvor podataka. Unos za Microsoft i Google koristi zvanične API-je umjesto nedokumentovanih prečica u pregledniku. OAuth pristupni tokeni zahtijevaju obnavljanje putem vašeg OAuth klijenta. Zahtjevi koriste eksplicitne JSON ključeve, vremenski ograničene HTTPS pozive i potvrdu odgovora. Poruke o grešci čuvaju detalje kvara dok skrivaju konfigurisani API token. Pogledajte [SECURITY.md](../../../SECURITY.md) za prijavu sigurnosnih problema.

### Traka menija i Shortcuts

[Vodič za traku menija](../../../workflows/menubar/README.md) opisuje opcionalni SwiftBar/xbar dodatak. Prvo instalirajte Apple servise, zatim podesite direktorij dodataka u aplikaciji za traku menija i povežite `workflows/menubar/gtd-menubar.sh` u njega.

[Shortcuts vodič](../../../workflows/shortcuts/README.md) pruža ručno podešavanje za unos teksta, međuspremnika i Siri unos na macOS 12+. Shortcuts i Siri glasovno pokretanje nisu dio hostovanog skupa testova.

## Arhitektura

Automator paketi ugrađuju AppleScript kako bi mogli raditi kao izvorni servisi. Alfred pakuje skripte radnji i prosljeđuje korisnički unos kao argumente. GTDLib pruža zajedničke izvorne operacije za Reminders iz izmjenjivog AppleScript izvornog koda i kompajliranog paketa skripti.

- **Jedan produkcijski parser:** `scripts/sync-native-parser.py` ugrađuje zajednički parser u Quick Capture i Event Capture; validacija otkriva odstupanja izvornog koda.
- **Trajno stanje fokusa:** odvojena pokretanja dijele stanje sesije uz vlastite launchd poslove i ograničeno praćenje proteklog vremena.
- **Ponovljivi paketi:** pakovanje pravi svježu arhivu, a testovi porede njen sadržaj s izvornim kodom. Biblioteka ima posebnu skriptu za kompajliranje.
- **Pregledni testovi:** JUnit izvještaji, dnevnici komandi i testirani artefakti gradnje čuvaju se 14 dana u servisu GitHub Actions.

| Direktorij | Odgovornost |
| --- | --- |
| [`workflows/`](../../../workflows/) | Izvorni paketi, adapteri servisa, Alfred, Shortcuts i skripte za traku menija |
| [`scripts/`](../../../scripts/) | Pakovanje, kompajliranje biblioteke, sinhronizacija parsera i priprema hostovanih testova |
| [`tests/`](../../../tests/) | Validacija, provjere komponenti i izvorni desktop E2E testovi |
| [`.github/workflows/`](../../../.github/workflows/) | CI, noćni/ručni E2E testovi i održavanje repozitorija |
| [`infra/`](../../../infra/) | Opcionalno podešavanje lokalnog i EC2 Mac izvršioca; hostovani CI ga ne zahtijeva |

## Testiranje i kompatibilnost

| Obim | Okruženje | Šta se provjerava |
| --- | --- | --- |
| Validacija | GitHub-hostovani macOS 15 i 26 | Kompajliranje AppleScript-a, paketi, produkcijski parser, ciljevi radnji, postavke, stanje fokusa, testni API transport i provjera integriteta paketa |
| Sigurnosne provjere | GitHub-hostovani Ubuntu i macOS 15 | Python CodeQL, ShellCheck i ograničeno Atheris fuzz testiranje kompajliranog produkcijskog parsera |
| E2E adaptera servisa | GitHub-hostovani `macos-15-intel` | Sva četiri produkcijska API dijaloga, TLS transport, testno čuvanje i čitanje, API greške, otkazivanje i odabir Notion izvora |
| E2E servisa uživo | Ručno pokretanje na GitHub-hostovanom Mac računaru s namjenskim tajnama | Stvarni Todoist, Notion, Microsoft i Google unos i očitavanje sa servera; pada ako nalozi nedostaju |
| Licencirane desktop integracije | Namjenski lokalni nalog | Pokretanje i čuvanje podataka u korisničkom interfejsu aplikacija Things 3, OmniFocus 4 i Alfred |
| Izvorni desktop E2E | GitHub-hostovani `macos-15-intel` | Pravi Automator dijalozi; sačuvani podaci u Reminders i Calendar; sedmični pregled; brojači u traci menija; kompajlirani GTDLib; upakovane izvorne Alfred radnje; stvarni istek i otkazivanje launchd tajmera |
| Opcionalni Alfred UI | Namjenski lokalni nalog, Alfred 5 + Powerpack | Uvoz toka rada, pozivanje ključnom riječi i očitavanje podsjetnika kroz licencirani interfejs |

[Verifikovano pokretanje modernizacije API-ja](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) prošlo je **35 testova validacije na svakoj platformi i 26 desktop E2E testova**, bez neuspjeha, grešaka ili preskakanja. Desktop pokrivenost uključuje 15 izvornih testova i 11 testova adaptera servisa, uključujući provjeru stvarnog isteka mrežnog vremena i privremenih Keychain provjera. Validacija također izvršava provjere strukture repozitorija. Ovi rezultati pokrivaju izvorno ponašanje i testne servere; ne dokazuju kompatibilnost sa servisima uživo niti licenciranim aplikacijama. Trenutni status prikazan je na oznakama iznad.

Pull zahtjevi i slanja promjena na granu `main` pokreću validaciju nakon koje slijedi izvorni E2E. E2E tok rada također se pokreće svake noći i ručno, uključujući determinističke testove adaptera servisa. Testovi servisa uživo koriste poseban ručni tok rada `live-e2e.yml`. Zadani CI koristi jednokratne GitHub-hostovane Mac računare, izolovane testne servere i ograničene podprocese; za osnovni skup testova nije potreban vlastiti server za izvršavanje niti vanjski akreditivi. Ručni paket uživo zahtijeva namjenske tajne provajdera.

Ranije verzije macOS-a nisu validirane trenutnim CI sistemom. Pokretanja servisa uživo zahtijevaju namjenske tajne i još nisu verifikovana. Shortcuts/Siri i licencirane desktop aplikacije su izvan zadanog hostovanog skupa. Testovi izvornih radnji direktno pozivaju upakovane Alfred skripte i ne dokazuju potpunu kompatibilnost sa Alfred interfejsom. Pogledajte [podešavanje testova, preduslove i pokrivenost](../../../tests/e2e/README.md).

## Lokalizacija

Korisničke poruke za CLI, pokretač testova i traku menija dolaze u 48 lokaliteta (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`, `bs`, `hr`, `sr`) u direktoriju `locales/` putem `scripts/i18n.py` bez ikakvih vanjskih zavisnosti. Određivanje lokaliteta provjerava `--lang`, zatim `LC_ALL`, `LC_MESSAGES` i `LANG`, uz povratak na `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Razvoj

Instalirajte [mise](https://mise.jdx.dev/) i koristite verziju Pythona definisanu u datoteci `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Validacija upisuje izvještaje u `test-results/`, a skripte za gradnju pišu u `dist/`. Za pokretanje hostovanog desktop skupa na grani `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Lokalni desktop E2E zahtijeva namjenski prijavljeni testni nalog i dozvole opisane u [E2E vodiču](../../../tests/e2e/README.md). Skripta za podešavanje dozvola u hostovanom okruženju ograničena je na jednokratne GitHub-hostovane poslove.

Koristite [Conventional Commits](https://www.conventionalcommits.org/) i pratite [CONTRIBUTING.md](../../../CONTRIBUTING.md). Nedavne izmjene zabilježene su u [CHANGELOG.md](../../../CHANGELOG.md).

Sigurnosne kontrole, provjera potpisa izdanja i preostala ograničenja za Scorecard dokumentovani su u [sigurnosnoj procjeni](../../../docs/security-assessment.md). Tok rada za izdanja gradi i potvrđuje pakete prije kreiranja nacrta izdanja, uključujući potpisano in-toto porijeklo i Sigstore pakete provjerene prema izvornom komitu i referenci. Novo porijeklo odnosi se na te gradnje toka rada, a ne na starija preuzimanja.

## Historija projekta i licenca

MacGTD objedinjuje nekadašnje repozitorije MacGTD-Native, MacGTD-Microsoft, MacGTD-Google i AlfredGTD. Licenciran je pod [MIT licencom](../../../LICENSE).
