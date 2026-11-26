# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (28 locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [Bosanski](../bs/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · **Hrvatski** · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Српски](../sr/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD je zbirka macOS radnih tijekova za bilježenje zadataka, organiziranje podsjetnika i izvođenje vremenski ograničenih sesija fokusa u aplikacijama koje već upotrebljavate.**

Osmišljen prema metodologiji [Getting Things Done](https://gettingthingsdone.com/), donosi bilježenje putem dijaloga, međuspremnika i skupnog unosa u aplikaciju Apple Reminders, bilježenje događaja u Calendar te naredbe za zadatke, bilješke, projekte i fokus u aplikaciji Alfred. AppleScript i Automator drže izvorne radne tijekove čvrsto povezanima sa sustavom macOS. API prilagodnici rabe Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 i Google Keep v1. Uključeni su i prilagodnici za Things i OmniFocus. Ispitivanja u oblaku provjeravaju API prilagodnike prema lokalnom HTTPS poslužitelju za testiranje; kompatibilnost uživo i dalje zahtijeva namjenske račune kod vanjskih pružatelja usluga.

## Što možete učiniti

- **Bilježite bez prebacivanja između aplikacija.** Upotrijebite uslugu sustava Automator, ključnu riječ u Alfredu ili međuspremnik za dodavanje zadatka. Skupno bilježenje izrađuje po jedan podsjetnik za svaki neprazan redak.
- **Pretvorite tekst u strukturirane zadatke.** Raščlanite relativne i ISO datume, vremena, prioritete, kontekste i projekte pomoću produkcijskog AppleScript parsera koji dijele izvorno brzo bilježenje i bilježenje u Calendar.
- **Bilježite događaje i pregledajte ulaznu poštu.** Izradite događaje u aplikaciji Calendar s vremenom, trajanjem i lokacijom; provedite tjedni pregled u pet koraka uz prikupljanje svih ideja u Reminders.
- **Radite u vremenski ograničenim sesijama fokusa.** Pokrenite, provjerite i zaustavite sesije u različitim procesima. Vlastiti launchd mjerači vremena po sesiji upravljaju istekom i otkazivanjem, a JSONL datoteke zapisnika pružaju analitiku trajanja.
- **Upotrijebite Alfred za više od samih zadataka.** Izradite popise u aplikaciji Reminders za projekte, pohranite referentne bilješke, otvorite ulaznu poštu za pregled, zabilježite tekst iz međuspremnika i uredite tipizirane postavke.
- **Pratite ulaznu poštu iz trake izbornika.** Neobvezni dodatak za SwiftBar/xbar prikazuje broj nedovršenih zadataka i poveznice na radne tijekove za bilježenje.

Izvorno ponašanje provjerava se na stvarnim Mac računalima kojima upravlja GitHub: testovi upravljaju dijaloškim okvirima aplikacije Automator te zatim očitavaju zapise iz aplikacija Reminders i Calendar. Za opseg tih dokaza pogledajte odjeljak [testiranje i kompatibilnost](#testiranje-i-kompatibilnost).

## Brzi početak: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Otvorite radni tijek u aplikaciji Automator i pokrenite ga kako biste isprobali bilježenje. Da bi bio dostupan kao usluga (Service), instalirajte paket u mapu `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Dodijelite tipkovnički prečac u **System Settings → Keyboard → Keyboard Shortcuts → Services**. Dopustite Automation pristup aplikaciji Reminders kada macOS to zatraži. Unesite:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Izvorni radni tijek izrađuje podsjetnik visokog prioriteta s rokom za sutra, usmjerava ga u popis `shopping` i pohranjuje kontekst. Bez oznake projekta ili konteksta, brzo bilježenje upotrebljava `Inbox`.

## Sintaksa bilježenja

Izvorni parser zadataka i Alfred bilježenje zadataka prepoznaju sljedeće oznake. Prilagodnici vanjskih pružatelja imaju vlastitu podršku za polja i usmjeravanje.

| Unos | Značenje | Primjer |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Visoki, srednji ili niski prioritet | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Relativni rok | `Call dentist tomorrow` |
| Dan u tjednu ili `next weekday` | Rok prema danu u tjednu | `Send report next monday` |
| `due:YYYY-MM-DD` | Izričiti datum roka | `Renew membership due:2027-03-15` |
| Vrijeme uz datum | Vrijeme roka | `Call Alex tomorrow at 3pm` |
| `@context` | Oznaka konteksta | `Buy milk @errands` |
| `+project` | Usmjeravanje u projekt ili popis | `Draft outline +website` |

Prihvaćaju se i `due:today` te `due:tomorrow`. U oznakama konteksta i projekata upotrebljavajte slova, znamenke, podvlake ili crtice. Izvorno brzo bilježenje daje prednost usmjeravanju prema projektu u odnosu na kontekst.

Bilježenje u Calendar upotrebljava `@` za lokaciju događaja i prihvaća trajanje u minutama ili satima:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Bez izričitog vremena ili trajanja, bilježenje u Calendar upotrebljava 9:00 AM i jedan sat u prvom kalendaru u koji je moguć zapis.

## Odaberite radni tijek

### Izvorni Apple radni tijekovi

| Radni tijek | Ponašanje | Paket |
| --- | --- | --- |
| Brzo bilježenje | Raščlanjuje tekst zadatka i izrađuje podsjetnik | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Bilježenje iz međuspremnika | Izrađuje podsjetnik iz teksta u međuspremniku | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Skupno bilježenje | Izrađuje podsjetnike iz više redaka | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Bilježenje događaja | Izrađuje događaj u aplikaciji Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Tjedni pregled | Vođeni pregled i unos podsjetnika | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Otvorite paket u aplikaciji Automator kako biste ga isprobali ili ga instalirajte u `~/Library/Services` za pokretanje tipkovnicom. Aplikacijama Reminders i Calendar potrebna su odgovarajuća macOS Automation dopuštenja.

### Alfred

Zahtijeva Alfred s licencom Powerpack. Izgradite paket iz trenutačnog izvornog koda:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Paket možete preuzeti i sa stranice [izdanja](https://github.com/somethingwithproof/MacGTD/releases). Paketi izdanja odražavaju označeni izvorni kod; značajke dodane na granu `main` nakon izdanja zahtijevaju izgradnju iz izvornog koda.

| Ključna riječ | Radnja |
| --- | --- |
| `task` | Bilježenje zadatka uz raščlambu datuma, konteksta, projekta i prioriteta |
| `note` | Pohrana referentne bilješke u aplikaciji Reminders |
| `project` | Izrada popisa u aplikaciji Reminders |
| `gtd process` | Otvaranje popisa Inbox za ručni pregled |
| `clip` | Bilježenje teksta iz međuspremnika |
| `gtd focus` | Pokretanje sesije fokusa, provjera stanja ili zaustavljanje |
| `gtd analytics` | Pregled zabilježenih trajanja sesija fokusa |
| `gtd preferences` | Uređivanje postavki radnog tijeka |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Postavke se pohranjuju u datoteci `~/Library/Preferences/com.alfredgtd.plist`, a stanje fokusa i zapisnici nalaze se u mapi `~/.gtd`. Postavke imaju ugrađene zadane vrijednosti, provjeru tipova, provjereni uvoz i atomski zapis. Sesije fokusa ne mijenjaju sustavske postavke obavijesti. Obrada ulazne pošte samo otvara popis za pregled i ne premješta niti dovršava zadatke automatski.

Pogledajte [vodič za Alfred](../../../workflows/alfred/README.md) i [dokumentaciju biblioteke GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Vanjski prilagodnici za bilježenje

Sva četiri API radna tijeka za bilježenje provjeravaju se putem stvarnih Automator dijaloga i lokalnog TLS poslužitelja u E2E testovima u oblaku. Zaseban ručni skup provjerava stvarnu pohranu kod vanjskih pružatelja kada su podešeni namjenski računi. Things i OmniFocus zahtijevaju licencirani paket integracijskih testova za stolna računala.

| Odredište | Mehanizam | Podešavanje / izvor |
| --- | --- | --- |
| Todoist | API bilježenje | [Radni tijek i podešavanje sustava Keychain](../../../workflows/todoist/) |
| Notion | Bilježenje putem Data Source API-ja | [Radni tijek i podešavanje sustava Keychain](../../../workflows/notion/) |
| Things 3 | URL shema | [Radni tijek](../../../workflows/things/) |
| OmniFocus | AppleScript / URL shema | [Radni tijek](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Radni tijek](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Radni tijek](../../../workflows/google/) |

API prilagodnici zahtijevaju podešavanje vjerodajnica; Microsoft zahtijeva delegiranu OAuth autorizaciju, a Google Keep odgovarajući Workspace pristup:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Pogledajte [zahtjeve za API podešavanje, migraciju i autorizaciju](../../../workflows/api/README.md). Postojeći ID-ovi Notion baza podataka migriraju se samo kada je pronađen točno jedan izvor podataka. Bilježenje za Microsoft i Google upotrebljava službene API-je umjesto nedokumentiranih prečaca preglednika. OAuth pristupni tokeni zahtijevaju obnavljanje putem vašeg OAuth klijenta. Korisni tereti rabe izričite JSON ključeve, vremenski ograničene HTTPS zahtjeve i potvrdu odgovora. Poruke o pogrešci zadržavaju pojedinosti neuspjeha dok skrivaju podešeni API token. Pogledajte [SECURITY.md](../../../SECURITY.md) za prijavu sigurnosnih ranjivosti.

### Traka izbornika i Shortcuts

[Vodič za traku izbornika](../../../workflows/menubar/README.md) obuhvaća neobvezni dodatak za SwiftBar/xbar. Najprije instalirajte Apple usluge, potom podesite mapu dodataka u aplikaciji za traku izbornika i povežite `workflows/menubar/gtd-menubar.sh` u nju.

[Vodič za Shortcuts](../../../workflows/shortcuts/README.md) nudi ručno podešavanje za bilježenje teksta, međuspremnika i glasovni unos putem Siri na sustavu macOS 12+. Shortcuts i glasovno pokretanje putem Siri izvan su testnog paketa u oblaku.

## Arhitektura

Automator paketi ugrađuju AppleScript kako bi mogli raditi kao izvorne usluge. Alfred pakira skripte radnji i prosljeđuje korisnički unos kao argumente. GTDLib pruža zajedničke izvorne operacije za Reminders iz izmjenjivog AppleScript izvornog koda i prevedenog paketa skripti.

- **Jedan produkcijski parser:** `scripts/sync-native-parser.py` ugrađuje zajednički parser u Quick Capture i Event Capture; validacija otkriva odstupanje izvornog koda.
- **Trajno stanje fokusa:** odvojena pokretanja dijele stanje sesije uz vlastite launchd poslove i ograničeno praćenje proteklog vremena.
- **Ponovljivi paketi:** pakiranje izrađuje svježu arhivu, a testovi uspoređuju njezin sadržaj s izvornim kodom. Biblioteka ima zasebnu skriptu za prevođenje.
- **Uvidljivi testovi:** JUnit izvješća, zapisnici naredbi i ispitani artefakti izgradnje pohranjuju se 14 dana u sustavu GitHub Actions.

| Mapa | Odgovornost |
| --- | --- |
| [`workflows/`](../../../workflows/) | Izvorni paketi, prilagodnici pružatelja, Alfred, Shortcuts i skripte za traku izbornika |
| [`scripts/`](../../../scripts/) | Pakiranje, prevođenje biblioteke, sinkronizacija parsera i priprema testova u oblaku |
| [`tests/`](../../../tests/) | Validacija, provjere komponenti i izvorni stolni E2E testovi |
| [`.github/workflows/`](../../../.github/workflows/) | CI, noćni/ručni E2E testovi i održavanje repozitorija |
| [`infra/`](../../../infra/) | Neobvezno podešavanje lokalnog i EC2 Mac poslužitelja za izvođenje; CI u oblaku to ne zahtijeva |

## Testiranje i kompatibilnost

| Opseg | Okruženje | Što se provjerava |
| --- | --- | --- |
| Validacija | GitHub macOS 15 i 26 u oblaku | Prevođenje AppleScripta, paketi, produkcijski parser, odredišta radnji, postavke, stanje fokusa, testni API prijenos i cjelovitost paketa |
| Sigurnosne provjere | GitHub Ubuntu i macOS 15 u oblaku | Python CodeQL, ShellCheck i ograničeno Atheris fuzz ispitivanje prevedenog produkcijskog parsera |
| E2E prilagodnika pružatelja | GitHub `macos-15-intel` u oblaku | Sva četiri produkcijska API dijaloga, TLS prijenos, testna pohrana i očitavanje, API pogreške, otkazivanje i odabir Notion izvora |
| E2E pružatelja uživo | Ručno pokretanje na GitHub Mac računalu s namjenskim tajnama | Stvarno bilježenje i očitavanje na servisima Todoist, Notion, Microsoft i Google; ne prolazi ako računi nedostaju |
| Licencirane stolne integracije | Namjenski lokalni račun | Pokretanje i pohrana kroz sučelje aplikacija Things 3, OmniFocus 4 i Alfred |
| Izvorni stolni E2E | GitHub `macos-15-intel` u oblaku | Stvarni Automator dijalozi; pohranjeni podatci u Reminders i Calendar; tjedni pregled; brojači izbornika; prevedeni GTDLib; zapakirane izvorne Alfred radnje; stvarni istek i otkazivanje launchd mjerača vremena |
| Neobvezno Alfred sučelje | Namjenski lokalni račun, Alfred 5 + Powerpack | Uvoz radnog tijeka, pozivanje ključnom riječi i očitavanje podsjetnika kroz licencirano sučelje |

[Potvrđeno pokretanje modernizacije API-ja](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) prošlo je **35 testova validacije na svakoj platformi i 26 stolnih E2E testova**, bez neuspjeha, pogrešaka ili preskakanja. Stolna pokrivenost obuhvaća 15 izvornih testova i 11 testova prilagodnika pružatelja, uključujući stvarno istjecanje mrežnog vremena i privremene Keychain provjere. Validacija također izvršava provjere strukture repozitorija. Ovi rezultati pokrivaju izvorno ponašanje i testne poslužitelje; ne dokazuju kompatibilnost s pružateljima uživo ni s licenciranim aplikacijama. Trenutačno stanje prikazano je na oznakama iznad.

Zahtjevi za spajanje i slanja na granu `main` pokreću validaciju nakon koje slijedi izvorni E2E. E2E radni tijek pokreće se i svake noći te ručno, uključujući determinističke testove prilagodnika pružatelja. Testovi pružatelja uživo upotrebljavaju zaseban ručni radni tijek `live-e2e.yml`. Zadani CI upotrebljava jednokratna GitHub Mac računala u oblaku, izolirane testne poslužitelje i ograničene potprocese; za zadani paket nije potreban vlastiti poslužitelj ni vanjske vjerodajnice. Ručni paket uživo zahtijeva namjenske tajne pružatelja.

Ranije inačice sustava macOS nisu potvrđene trenutačnim CI-jem. Pokretanja pružatelja uživo zahtijevaju namjenske tajne i još nisu potvrđena. Shortcuts/Siri i licencirane stolne aplikacije izvan su zadanog paketa u oblaku. Izvorni testovi radnji izravno pozivaju zapakirane Alfred skripte i ne dokazuju potpunu kompatibilnost s Alfred korisničkim sučeljem. Pogledajte [postavljanje testova, preduvjete i pokrivenost](../../../tests/e2e/README.md).

## Lokalizacija

Korisnički nizovi za CLI, pokretač testova i traku izbornika isporučuju se u 48 lokalizacija (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`, `bs`, `hr`, `sr`) u mapi `locales/` putem `scripts/i18n.py` bez vanjskih ovisnosti. Određivanje lokalizacije provjerava `--lang`, zatim `LC_ALL`, `LC_MESSAGES` i `LANG`, s povratkom na `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Razvoj

Instalirajte [mise](https://mise.jdx.dev/) i upotrijebite inačicu Pythona zadanu u datoteci `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Validacija pohranjuje izvješća u `test-results/`, a skripte izgradnje zapisuju u `dist/`. Za pokretanje stolnog paketa u oblaku na grani `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Lokalni stolni E2E zahtijeva namjenski prijavljeni testni račun i dopuštenja opisana u [E2E vodiču](../../../tests/e2e/README.md). Skripta za pripremu dopuštenja u oblaku ograničena je na jednokratne GitHub poslove.

Upotrebljavajte [Conventional Commits](https://www.conventionalcommits.org/) i slijedite [CONTRIBUTING.md](../../../CONTRIBUTING.md). Nedavne promjene zabilježene su u [CHANGELOG.md](../../../CHANGELOG.md).

Sigurnosne kontrole, provjera potpisa izdanja i preostala ograničenja za Scorecard dokumentirani su u [sigurnosnoj procjeni](../../../docs/security-assessment.md). Radni tijek za izdanja gradi i ovjerava pakete prije stvaranja nacrta izdanja, uključujući potpisano in-toto podrijetlo i Sigstore pakete provjerene prema izvornom commitu i referenci. Novo podrijetlo odnosi se na te izgradnje radnog tijeka, a ne na starija preuzimanja.

## Povijest projekta i licenca

MacGTD objedinjuje nekadašnje repozitorije MacGTD-Native, MacGTD-Microsoft, MacGTD-Google i AlfredGTD. Licenciran je pod [MIT licencom](../../../LICENSE).
