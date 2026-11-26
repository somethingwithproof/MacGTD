# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · **Malagasy** · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD dia fitambaran'ny fizotran'asa macOS natao handraisana asa, handaminana fampahatsiahivana, ary hanatanterahana fotoam-pifantohana misy fameram-potoana miaraka amin'ireo rindranasa efa ampiasainao.**

Natao mifototra amin'ny [Getting Things Done](https://gettingthingsdone.com/), izy io dia mitondra fandraisana amin'ny alalan'ny boaty fifampiresahana, takelaka fitahirizana dika, ary fandraisana maro indray mandeha ho an'ny Apple Reminders; fandraisana hetsika ho an'ny Calendar; ary baiko ho an'ny asa, naoty, tetikasa, ary fifantohana ho an'ny Alfred. Ny AppleScript sy Automator dia mitazona ireo fizotran'asa teratany hifanakaiky tsara amin'ny macOS. Ny mpampifandray API dia mampiasa Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, ary Google Keep v1. Tafiditra ao koa ny mpampifandray Things sy OmniFocus. Ny fitsapana ampiantranoina dia manamarina ireo mpampifandray API amin'ny alalan'ny tontolo fitsapana HTTPS eto an-toerana; mbola mitaky kaontin'ny mpamatsy natokana ny fanamarinana ny fifanarahana mivantana.

## Ny zavatra azonao atao

- **Mandraisa asa tsy mila manova rindranasa.** Mampiasà Service Automator, teny fanalahidy Alfred, na takelaka fitahirizana dika mba hanampiana asa. Ny fandraisana maro indray mandeha dia mamorona fampahatsiahivana iray isaky ny andalana tsy foana.
- **Ovay ho asa voarafitra ny lahatsoratra.** Diniho ny daty mifandray amin'ny ankehitriny sy ny daty ISO, ora, laharam-pahamehana, sehatra, ary tetikasa amin'ny alalan'ny mpandinika lahatsoratra AppleScript ampiasaina amin'ny famokarana, izay iarahan'ny fandraisana haingana teratany sy ny fandraisana Calendar.
- **Mandraisa hetsika ary jereo ny boaty fandraisanao.** Mamoròna hetsika Calendar misy ora, faharetana, ary toerana; tanteraho ny famerenana isan-kerinandro misy dingana dimy miaraka amin'ny famoahana hevitra rehetra mankany amin'ny Reminders.
- **Miasà ao anatin'ny fotoam-pifantohana misy fameram-potoana.** Manomboha, manaraha maso, ary manajanòna fotoam-pifantohana amin'ny alalan'ny dingana samihafa. Ny fameram-potoana launchd an'ny fotoam-pifantohana no mitantana ny fahataperana sy ny fanafoanana; ny firaketana JSONL no manome fanadihadiana ny faharetana.
- **Ampiasao amin'ny zavatra mihoatra ny asa ny Alfred.** Mamoròna lisitra Reminders ho an'ny tetikasa, tehirizo ny naoty fanovozan-kevitra, sokafy ny boaty fandraisana hojerena, raiso ny lahatsoratra avy amin'ny takelaka fitahirizana dika, ary ovay ireo safidy voamarina karazana.
- **Jereo avy amin'ny tsipika menio ny boaty fandraisanao.** Ny fanitarana SwiftBar/xbar azo isafidianana dia mampiseho ny isan'ny singa tsy mbola vita ao amin'ny boaty fandraisana ary manome rohy mankany amin'ireo fizotran'asa fandraisana.

Ny fomba fiasa teratany dia voamarina amin'ny Mac tena izy ampiantranoin'ny GitHub: ny fitsapana dia mampiasa boaty fifampiresahana Automator, avy eo mamaky indray ireo firaketana ao amin'ny Reminders sy Calendar. Jereo ny [fitsapana sy fifanarahana](#testing-and-compatibility) mba hahitana ny fetran'izany porofo izany.

## Fanombohana haingana: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Sokafy ao amin'ny Automator ny fizotran'asa ary alefaso mba hanandrana ny fandraisana. Mba hampiasana azy ho Service, apetraho ao anatin'ny `~/Library/Services` ny fonosana:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Manendria hitsin-dalana ao amin'ny **System Settings → Keyboard → Keyboard Shortcuts → Services**. Omeo alalana ny Automation hiditra ao amin'ny Reminders rehefa mangataka ny macOS. Ampidiro:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Ny fizotran'asa teratany dia mamorona fampahatsiahivana manana laharam-pahamehana ambony izay tokony ho vita rahampitso, mandefa azy any amin'ny lisitra `shopping`, ary mirakitra ny sehatra. Raha tsy misy marika tetikasa na sehatra, ny fandraisana haingana dia mampiasa ny `Inbox`.

## Fitsipi-panoratana amin'ny fandraisana

Ny mpandinika asa teratany sy ny fandraisana asa Alfred dia mahafantatra ireto marika ireto. Manana ny saha sy ny fandefasana manokana tohanany ireo mpampifandray mpamatsy.

| Fampidirana | Dikany | Ohatra |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Laharam-pahamehana ambony, antonony, na ambany | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Daty farany mifandray amin'ny ankehitriny | `Call dentist tomorrow` |
| Andron'ny herinandro na `next weekday` | Daty farany amin'ny andron'ny herinandro | `Send report next monday` |
| `due:YYYY-MM-DD` | Daty farany voafaritra mazava | `Renew membership due:2027-03-15` |
| Ora miaraka amin'ny daty | Ora farany | `Call Alex tomorrow at 3pm` |
| `@context` | Marika sehatra | `Buy milk @errands` |
| `+project` | Fandefasana mankany amin'ny tetikasa/lisitra | `Draft outline +website` |

Ekena koa ny `due:today` sy `due:tomorrow`. Mampiasà litera, isa, tsipika ambany, na tsipika fampifandraisana ao amin'ny marika sehatra sy tetikasa. Ny fandraisana haingana teratany dia manome laharam-pahamehana ny fandefasana tetikasa alohan'ny fandefasana sehatra.

Ny fandraisana Calendar dia mampiasa `@` ho an'ny toerana misy ny hetsika ary manaiky faharetana amin'ny minitra na ora:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Raha tsy misy ora na faharetana voafaritra mazava, ny fandraisana Calendar dia mampiasa ny amin'ny 9:00 maraina sy faharetana adiny iray, ao amin'ny kalandrie voalohany azo soratana.

## Misafidiana fizotran'asa

### Fizotran'asa teratany Apple

| Fizotran'asa | Fomba fiasa | Fonosana |
| --- | --- | --- |
| Fandraisana haingana | Mandinika lahatsoratra asa sy mamorona fampahatsiahivana | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Fandraisana takelaka fitahirizana dika | Mamorona fampahatsiahivana avy amin'ny lahatsoratra ao amin'ny takelaka fitahirizana dika | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Fandraisana maro indray mandeha | Mamorona fampahatsiahivana avy amin'ny andalana maromaro | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Fandraisana hetsika | Mamorona hetsika Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Famerenana isan-kerinandro | Famerenana misy tari-dalana sy famoahana hevitra fampahatsiahivana | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Sokafy ao amin'ny Automator ny fonosana iray mba hanandrana azy, na apetraho ao anatin'ny `~/Library/Services` mba hampiasaina amin'ny kitendry. Mila ny alalana macOS Automation mifanaraka aminy ny Reminders sy ny Calendar.

### Alfred

Mitaky Alfred miaraka amin'ny Powerpack. Amboary avy amin'ny loharanon-kaody ankehitriny ny fonosana:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Azonao sintonina avy ao amin'ny [dika navoaka](https://github.com/somethingwithproof/MacGTD/releases) koa ny fonosana. Ny fonosana navoaka dia mifanaraka amin'ny loharanon-kaody misy marika dika; ireo fiasa nampiana tao amin'ny `main` taorian'ny famoahana iray dia mitaky fanamboarana avy amin'ny loharanon-kaody.

| Teny fanalahidy | Hetsika |
| --- | --- |
| `task` | Mandray asa miaraka amin'ny fandinihana daty, sehatra, tetikasa, ary laharam-pahamehana |
| `note` | Mitahiry naoty fanovozan-kevitra ao amin'ny Reminders |
| `project` | Mamorona lisitra Reminders |
| `gtd process` | Manokatra ny Inbox mba hojeren'ny olona |
| `clip` | Mandray lahatsoratra avy amin'ny takelaka fitahirizana dika |
| `gtd focus` | Manomboka fotoam-pifantohana, mijery ny sata, na manajanona |
| `gtd analytics` | Mijery ireo faharetan'ny fifantohana voarakitra |
| `gtd preferences` | Manova ny safidin'ny fizotran'asa |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Ny safidy dia voatahiry ao amin'ny `~/Library/Preferences/com.alfredgtd.plist`; ny satan'ny fifantohana sy ny firaketana dia ao anatin'ny `~/.gtd`. Manana sanda fototra voaorina ao anatiny, fanamarinana karazana, fanafarana voamarina, ary fanoratana tsy azo sarahina ny safidy. Tsy manova ny fikirana fampandrenesana rafitra ny fotoam-pifantohana. Ny fikarakarana ny boaty fandraisana dia manokatra ny lisitra hojerena; tsy mamindra na mamita asa ho azy izy io.

Jereo ny [tari-dalana Alfred](../../../workflows/alfred/README.md) sy ny [tahirin-kevitra momba ny tranomboky GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Mpampifandray fandraisana ivelany

Ireo fizotran'asa fandraisana API efatra rehetra dia tsapaina amin'ny alalan'ny boaty fifampiresahana Automator tena izy sy tontolo fitsapana TLS eto an-toerana ao amin'ny E2E ampiantranoina. Ny andian-tsedra atao tanana misaraka dia mitsapa ny fitahirizana tena izy any amin'ny mpamatsy rehefa misy kaonty natokana voaomana. Ny Things sy OmniFocus dia mitaky ny andian-tsedra fampidirana amin'ny rindranasa solosaina misy fahazoan-dalana.

| Tanjona | Fomba fiasa | Fanomanana / loharano |
| --- | --- | --- |
| Todoist | Fandraisana API | [Fizotran'asa sy fanomanana Keychain](../../../workflows/todoist/) |
| Notion | Fandraisana API loharanon-tahiry | [Fizotran'asa sy fanomanana Keychain](../../../workflows/notion/) |
| Things 3 | Rafitra URL | [Fizotran'asa](../../../workflows/things/) |
| OmniFocus | AppleScript / Rafitra URL | [Fizotran'asa](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Fizotran'asa](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Fizotran'asa](../../../workflows/google/) |

Mitaky fanomanana mari-pamantarana ny mpampifandray API; mila fanomezan-dalana OAuth nomena fahefana ny Microsoft ary mila fidirana Workspace mahafeno fepetra ny Google Keep:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Jereo ny [fanomanana API, famindrana, ary fepetra fanomezan-dalana](../../../workflows/api/README.md). Ny ID tahirin-kevitra Notion efa misy dia tsy mifindra raha tsy loharanon-tahiry iray ihany no hita. Ny fandraisana Microsoft sy Google dia mampiasa API fa tsy hitsin-dalana mpitety tranonkala tsy voarakitra an-tsoratra. Mila havaozina amin'ny alalan'ny mpanjifa OAuth anao ny marika fidirana OAuth. Ny angona alefa dia mampiasa fanalahidy JSON mazava, fangatahana HTTPS voafetra fotoana, ary fanamarinana ny valiny. Ny hafatra fahadisoana dia mitazona ny antsipirian'ny tsy fahombiazana sady manafina ny marika API voaomana. Jereo ny [SECURITY.md](../../../SECURITY.md) raha te hanao tatitra olana ara-piarovana.

### Tsipika menio sy Shortcuts

Ny [tari-dalana momba ny tsipika menio](../../../workflows/menubar/README.md) dia manazava ny fanitarana SwiftBar/xbar azo isafidianana. Apetraho aloha ny Apple Services, avy eo amboary ny lahatahirin'ny fanitarana ao amin'ny rindranasa tsipika menio ampiasainao ary ampifandraiso ao anatiny ny `workflows/menubar/gtd-menubar.sh`.

Ny [tari-dalana Shortcuts](../../../workflows/shortcuts/README.md) dia manome fanomanana atao tanana ho an'ny fandraisana lahatsoratra, takelaka fitahirizana dika, ary Siri amin'ny macOS 12+. Ny Shortcuts sy ny fampandehanana amin'ny feo Siri dia ivelan'ny andian-tsedra fitsapana ampiantranoina.

## Maritrano rafitra

Ny fonosana Automator dia mampiditra AppleScript ao anatiny mba hahafahany miasa toy ny Services teratany. Ny Alfred dia mamatotra ireo script hetsika ary mandefa ny fampidiran'ny mpampiasa ho singa fampidirana. Ny GTDLib dia manome asa Reminders teratany iraisana avy amin'ny loharanon-kaody AppleScript azo ovaina sy fonosana script voaangona.

- **Mpandinika famokarana iray ihany:** ny `scripts/sync-native-parser.py` dia mampiditra ny mpandinika iraisana ao amin'ny Fandraisana Haingana sy Fandraisana Hetsika; ny fanamarinana dia mamantatra ny fivilian'ny loharanon-kaody.
- **Satan'ny fifantohana maharitra:** ireo fampandehanana misaraka dia mizara ny satan'ny fotoam-pifantohana, miaraka amin'ny asa launchd an'ny fotoam-pifantohana sy kajy voafetra ny fotoana lasa.
- **Fonosana azo averina amboarina mitovy:** ny famonosana dia mamorona tahiry vaovao, ary ny fitsapana dia mampitaha ny ao anatiny amin'ny loharanon-kaody. Manana script fanangonana misaraka ny tranomboky.
- **Fitsapana azo arahina maso:** ny tatitra JUnit, ny firaketana baiko, ary ireo vokatra fanamboarana voatsapa dia tehirizina mandritra ny 14 andro ao amin'ny GitHub Actions.

| Lahatahiry | Andraikitra |
| --- | --- |
| [`workflows/`](../../../workflows/) | Fonosana teratany, mpampifandray mpamatsy, Alfred, Shortcuts, ary script tsipika menio |
| [`scripts/`](../../../scripts/) | Famonosana, fanangonana tranomboky, fampifanarahana mpandinika, ary fanomanana tontolo fitsapana ampiantranoina |
| [`tests/`](../../../tests/) | Fanamarinana, fizahana singa, ary E2E teratany amin'ny solosaina |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E isan'alina/atao tanana, ary fikojakojana ny tahiry |
| [`infra/`](../../../infra/) | Fanomanana mpampandeha Mac eto an-toerana sy EC2 azo isafidianana; tsy mitaky izany ny CI ampiantranoina |

<a name="testing-and-compatibility"></a>

## Fitsapana sy fifanarahana

| Sehatra | Tontolo | Ny zavatra hamarinina |
| --- | --- | --- |
| Fanamarinana | macOS 15 sy 26 ampiantranoin'ny GitHub | Fanangonana AppleScript, fonosana, mpandinika famokarana, tanjona hetsika, safidy, satan'ny fifantohana, fifandraisana API tontolo fitsapana, ary fanamarinana miverina ny fonosana |
| Fizahana fiarovana | Ubuntu sy macOS 15 ampiantranoin'ny GitHub | Python CodeQL, ShellCheck, ary fitsapana fuzzing Atheris voafetra amin'ny mpandinika famokarana voaangona |
| E2E mpampifandray mpamatsy | `macos-15-intel` ampiantranoin'ny GitHub | Ireo boaty fifampiresahana API famokarana efatra rehetra, fifandraisana TLS, fitahirizana/famakiana miverina ao amin'ny tontolo fitsapana, tsy fahombiazan'ny API, fanafoanana, ary fisafidianana loharano Notion |
| E2E mpamatsy mivantana | Fampandehanana tanana amin'ny Mac ampiantranoin'ny GitHub miaraka amin'ny tsiambaratelo natokana | Fandraisana Todoist, Notion, Microsoft, ary Google tena izy sy famakiana miverina avy any amin'ny mpamatsy; tsy mahomby raha tsy misy ny kaonty |
| Fampidirana rindranasa solosaina misy fahazoan-dalana | Kaonty eto an-toerana natokana | Fiantsoana UI sy fitahirizana ho an'ny Things 3, OmniFocus 4, ary Alfred |
| E2E teratany amin'ny solosaina | `macos-15-intel` ampiantranoin'ny GitHub | Boaty fifampiresahana Automator tena izy; angona Reminders sy Calendar voatahiry; famerenana isan-kerinandro; fanisana ao amin'ny menio; GTDLib voaangona; hetsika teratany Alfred voafono; fahataperana sy fanafoanana fameram-potoana launchd tena izy |
| UI Alfred azo isafidianana | Kaonty eto an-toerana natokana, Alfred 5 + Powerpack | Fanafarana fizotran'asa, fiantsoana teny fanalahidy, ary famakiana miverina fampahatsiahivana amin'ny alalan'ny UI misy fahazoan-dalana |

Ny [fampandehanana fanavaozana API voamarina](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) dia nahomby tamin'ny **fitsapana fanamarinana 35 isaky ny sehatra fanamarinana sy fitsapana E2E solosaina 26**, tsy nisy tsy fahombiazana, fahadisoana, na dingana nilaozana. Ny fandrakofana amin'ny solosaina dia ahitana fitsapana teratany 15 sy fitsapana mpampifandray mpamatsy 11, ao anatin'izany ny fahataperan'ny fe-potoana fifandraisana tena izy sy ny fanamarinana Keychain mandalo. Ny fanamarinana koa dia manatanteraka fizahana ny rafitry ny tahiry. Ireo vokatra ireo dia mandrakotra ny fomba fiasa teratany sy ny tontolo fitsapana mpamatsy; tsy manaporofo ny fifanarahana amin'ny mpamatsy mivantana na amin'ny rindranasa misy fahazoan-dalana izy ireo. Ny sata ankehitriny dia asehon'ireo marika etsy ambony.

Ny pull requests sy ny fandefasana fanovana mankany amin'ny `main` dia mampandeha fanamarinana arahin'ny E2E teratany. Ny fizotran'asa E2E koa dia mandeha isan'alina sy amin'ny fampandehanana atao tanana, ao anatin'izany ny fitsapana mpampifandray mpamatsy azo vinavinaina. Ny fitsapana mpamatsy mivantana dia mampiasa ny fizotran'asa atao tanana misaraka `live-e2e.yml`. Ny CI mahazatra dia mampiasa Mac ampiantranoin'ny GitHub azo ariana, tontolo fitsapana mitokana, ary zana-dingana voafetra; tsy ilaina ny mpampandeha ampiantranoina manokana na ny mari-pamantarana kaonty ivelany ho an'ny andian-tsedra mahazatra. Ny andian-tsedra mivantana atao tanana dia mitaky tsiambaratelo mpamatsy natokana.

Tsy voamarina amin'ny CI ankehitriny ireo dika macOS taloha kokoa. Mitaky tsiambaratelo natokana ny fampandehanana mpamatsy mivantana ary mbola tsy voamarina. Ny Shortcuts/Siri sy ny rindranasa solosaina misy fahazoan-dalana dia ivelan'ny andian-tsedra ampiantranoina mahazatra. Ny fitsapana hetsika teratany dia mampandeha mivantana ireo script Alfred voafono; tsy manaporofo fifanarahana feno amin'ny UI Alfred izy ireo. Jereo ny [fanomanana fitsapana, fepetra takiana mialoha, ary fandrakofana](../../../tests/e2e/README.md).

## Fampifanarahana amin'ny fiteny

Ireo lahatsoratra aseho amin'ny mpampiasa ho an'ny CLI, mpampandeha fitsapana, ary tsipika menio dia misy amin'ny fiteny sy faritra 45 (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) ao anatin'ny `locales/` amin'ny alalan'ny `scripts/i18n.py` ary tsy miankina amin'ny tranomboky ivelany. Ny famaritana ny fiteny dia mijery ny `--lang`, avy eo ny `LC_ALL`, `LC_MESSAGES`, ary `LANG`, ka miverina amin'ny `en` raha tsy misy.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Fampandrosoana

Apetraho ny [mise](https://mise.jdx.dev/) ary ampiasao ny dika Python voafaritra ao amin'ny `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Ny fanamarinana dia manoratra tatitra ao anatin'ny `test-results/`; ny script fanamboarana dia manoratra ao amin'ny `dist/`. Raha hampandeha ny andian-tsedra solosaina ampiantranoina amin'ny `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Ny E2E solosaina eto an-toerana dia mitaky kaonty fitsapana natokana efa tafiditra sy ireo alalana voalaza ao amin'ny [tari-dalana E2E](../../../tests/e2e/README.md). Ny script fanomanana alalana ampiantranoina dia voafetra ho an'ny asa GitHub ampiantranoina azo ariana ihany.

Mampiasà [Conventional Commits](https://www.conventionalcommits.org/) ary araho ny [CONTRIBUTING.md](../../../CONTRIBUTING.md). Ny fanovana vao haingana dia voarakitra ao amin'ny [CHANGELOG.md](../../../CHANGELOG.md).

Ny fanaraha-maso ara-piarovana, ny fanamarinana sonian'ny dika navoaka, ary ny fetran'ny Scorecard mbola tavela dia voarakitra ao amin'ny [fanombanana ara-piarovana](../../../docs/security-assessment.md). Ny fizotran'asa famoahana dia manamboatra sy manamarina ireo fonosana alohan'ny hamoronana volavolan-dika navoaka, ao anatin'izany ny porofon'ny fiaviana in-toto voasonia sy ny fonosana Sigstore voamarina mifanaraka amin'ny commit sy ref loharano. Ny porofon'ny fiaviana vaovao dia mihatra amin'ireo fanamboarana avy amin'izany fizotran'asa izany, fa tsy amin'ireo fampidinana taloha.

## Tantaran'ny tetikasa sy fahazoan-dalana

Ny MacGTD dia manambatra ireo tahiry taloha MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, ary AlfredGTD. Eo ambanin'ny [MIT License](../../../LICENSE) no fahazoan-dalana hampiasana azy.
