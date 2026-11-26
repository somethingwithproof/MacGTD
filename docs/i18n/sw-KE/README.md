# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · **Kiswahili** · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD ni mkusanyiko wa michakato ya kazi ya macOS ya kunasa majukumu, kupanga vikumbusho, na kuendesha vipindi vya umakini vilivyopangiwa muda ukitumia programu ambazo tayari unatumia.**

Imejengwa kwa msingi wa [Getting Things Done](https://gettingthingsdone.com/), inaleta unasa kupitia kidirisha, ubao wa kunakili, na makundi kwenye Apple Reminders; unasa wa matukio kwenye Calendar; na amri za majukumu, madokezo, miradi, na umakini kwenye Alfred. AppleScript na Automator huweka michakato asilia karibu na macOS. Adapta za API hutumia Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, na Google Keep v1. Adapta za Things na OmniFocus pia zimejumuishwa. Majaribio yanayoendeshwa kwenye seva huthibitisha adapta za API dhidi ya kiigizo cha HTTPS cha ndani; upatanifu wa moja kwa moja bado unahitaji akaunti mahususi za watoa huduma.

## Unachoweza kufanya

- **Nasa bila kubadilisha programu.** Tumia Huduma ya Automator, neno kuu la Alfred, au ubao wa kunakili kuongeza jukumu. Unasa wa makundi huunda kikumbusho kimoja kwa kila mstari usio tupu.
- **Geuza maandishi kuwa majukumu yaliyopangwa.** Changanua tarehe za kuhusiana na za ISO, nyakati, vipaumbele, miktadha, na miradi ukitumia kichanganuzi cha AppleScript cha uzalishaji kinachotumiwa pamoja na unasa wa haraka wa asilia na unasa wa Calendar.
- **Nasa matukio na kagua kikasha chako.** Unda matukio ya Calendar yenye saa, muda wa tukio, na mahali; endesha ukaguzi wa kila wiki wa hatua tano ukiwa na kumwaga mawazo kwenye Reminders.
- **Fanya kazi katika vipindi vya umakini vyenye muda.** Anzisha, kagua, na simamisha vipindi katika michakato mbalimbali. Vipima muda vya launchd vinavyomilikiwa na kipindi hushughulikia kuisha kwa muda na kughairi; kumbukumbu za JSONL hutoa takwimu za muda wa vipindi.
- **Tumia Alfred kwa zaidi ya majukumu.** Unda orodha za Reminders kwa miradi, hifadhi madokezo ya marejeleo, fungua kikasha kwa ukaguzi, nasa maandishi ya ubao wa kunakili, na hariri mapendeleo yenye aina bayana.
- **Ona kikasha chako kutoka kwenye upau wa menyu.** Programu-jalizi ya hiari ya SwiftBar/xbar huonyesha idadi ya vipengee vya kikasha visivyokamilika na viungo vya michakato ya unasa.

Mwenendo wa asilia hukaguliwa kwenye kompyuta halisi za Mac zinazopangishwa na GitHub: majaribio huendesha vidirisha vya Automator, kisha husoma tena rekodi za Reminders na Calendar. Tazama [majaribio na upatanifu](#testing-and-compatibility) kwa wigo wa ushahidi huo.

## Mwanzo wa haraka: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Fungua mchakato wa kazi katika Automator na uendeshe ili kujaribu unasa. Ili kuufanya upatikane kama Huduma, sakinisha kifurushi chini ya `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Weka njia ya mkato katika **System Settings → Keyboard → Keyboard Shortcuts → Services**. Ruhusu ufikiaji wa Automation kwa Reminders wakati macOS inapouliza. Ingiza:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Mchakato wa asilia huunda kikumbusho cha kipaumbele cha juu chenye tarehe ya mwisho kesho, hukielekeza kwenye orodha ya `shopping`, na kurekodi muktadha. Bila alama ya mradi au muktadha, unasa wa haraka hutumia `Inbox`.

## Sintaksia ya unasa

Kichanganuzi cha majukumu cha asilia na unasa wa majukumu wa Alfred hutambua alama hizi. Adapta za watoa huduma zina usaidizi wake wa sehemu na uelekezaji.

| Ingizo | Maana | Mfano |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Kipaumbele cha juu, kati, au chini | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Tarehe ya mwisho ya kuhusiana | `Call dentist tomorrow` |
| Siku ya wiki au `next weekday` | Tarehe ya mwisho ya siku ya wiki | `Send report next monday` |
| `due:YYYY-MM-DD` | Tarehe ya mwisho bayana | `Renew membership due:2027-03-15` |
| Muda pamoja na tarehe | Saa ya mwisho | `Call Alex tomorrow at 3pm` |
| `@context` | Alama ya muktadha | `Buy milk @errands` |
| `+project` | Uelekezaji wa mradi/orodha | `Draft outline +website` |

`due:today` na `due:tomorrow` pia hukubaliwa. Tumia herufi, nambari, mistari chini, au vistari katika alama za muktadha na mradi. Unasa wa haraka wa asilia huupa uelekezaji wa mradi kipaumbele kuliko uelekezaji wa muktadha.

Unasa wa Calendar hutumia `@` kwa mahali pa tukio na hukubali muda wa tukio kwa dakika au saa:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Bila saa au muda bayana, unasa wa Calendar hutumia saa 9:00 AM na saa moja, katika kalenda ya kwanza inayoweza kuandikwa.

## Chagua mchakato wa kazi

### Michakato asilia ya Apple

| Mchakato wa kazi | Mwenendo | Kifurushi |
| --- | --- | --- |
| Unasa wa haraka | Changanua maandishi ya jukumu na unda kikumbusho | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Unasa wa ubao wa kunakili | Unda kikumbusho kutoka kwenye maandishi ya ubao wa kunakili | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Unasa wa makundi | Unda vikumbusho kutoka kwenye mistari mingi | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Unasa wa matukio | Unda tukio la Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Ukaguzi wa kila wiki | Ukaguzi wenye mwongozo na kumwaga mawazo ya vikumbusho | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Fungua kifurushi katika Automator ili kukijaribu, au kisakinishe chini ya `~/Library/Services` kwa ufikiaji wa kibodi. Reminders na Calendar zinahitaji ruhusa zinazofaa za macOS Automation.

### Alfred

Inahitaji Alfred yenye Powerpack. Jenga kifurushi kutoka kwa msimbo chanzo wa sasa:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Unaweza pia kupakua kifurushi kutoka [matoleo](https://github.com/somethingwithproof/MacGTD/releases). Vifurushi vya matoleo huakisi msimbo chanzo uliowekwa lebo; vipengele vilivyoongezwa kwenye `main` baada ya toleo huhitaji ujenzi kutoka kwa msimbo chanzo.

| Neno kuu | Kitendo |
| --- | --- |
| `task` | Nasa jukumu kwa uchanganuzi wa tarehe, muktadha, mradi, na kipaumbele |
| `note` | Hifadhi dokezo la marejeleo katika Reminders |
| `project` | Unda orodha ya Reminders |
| `gtd process` | Fungua Inbox kwa ukaguzi wa binadamu |
| `clip` | Nasa maandishi ya ubao wa kunakili |
| `gtd focus` | Anzisha kipindi cha umakini, kagua hali, au simamisha |
| `gtd analytics` | Kagua muda wa vipindi vya umakini uliorekodiwa |
| `gtd preferences` | Hariri mapendeleo ya mchakato wa kazi |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Mapendeleo yanapatikana katika `~/Library/Preferences/com.alfredgtd.plist`; hali ya umakini na kumbukumbu ziko chini ya `~/.gtd`. Mapendeleo yana chaguo-msingi zilizojengewa ndani, ukaguzi wa aina, uingizaji uliothibitishwa, na uandishi wa atomiki. Vipindi vya umakini havibadilishi mipangilio ya arifa za mfumo. Uchakataji wa kikasha hufungua orodha kwa ukaguzi; hauhamishi wala kukamilisha majukumu kiotomatiki.

Tazama [mwongozo wa Alfred](../../../workflows/alfred/README.md) na [nyaraka za maktaba ya GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Adapta za unasa wa nje

Michakato yote minne ya unasa wa API hujaribiwa kupitia vidirisha halisi vya Automator na kiigizo cha TLS cha ndani katika E2E zinazopangishwa. Seti tofauti ya majaribio ya mikono hujaribu uhifadhi halisi wa wachuuzi wakati akaunti mahususi zimesanidiwa. Things na OmniFocus zinahitaji seti ya muunganisho wa eneo-kazi yenye leseni.

| Lengwa | Utaratibu | Usanidi / chanzo |
| --- | --- | --- |
| Todoist | Unasa wa API | [Usanidi wa mchakato na Keychain](../../../workflows/todoist/) |
| Notion | Unasa wa Data source API | [Usanidi wa mchakato na Keychain](../../../workflows/notion/) |
| Things 3 | Mpango wa URL | [Mchakato wa kazi](../../../workflows/things/) |
| OmniFocus | AppleScript / mpango wa URL | [Mchakato wa kazi](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Mchakato wa kazi](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Mchakato wa kazi](../../../workflows/google/) |

Adapta za API zinahitaji usanidi wa vitambulisho; Microsoft inahitaji uidhinishaji wa OAuth uliokabidhiwa na Google Keep inahitaji ufikiaji unaostahiki wa Workspace:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Tazama [usanidi wa API, uhamishaji, na mahitaji ya uidhinishaji](../../../workflows/api/README.md). Vitambulisho vilivyopo vya hifadhidata ya Notion huhamishwa tu pale ambapo chanzo kimoja pekee cha data kinapopatikana. Unasa wa Microsoft na Google hutumia API badala ya njia za mkato za kivinjari zisizo na nyaraka. Tokeni za ufikiaji za OAuth zinahitaji kuhuishwa kupitia mteja wako wa OAuth. Data zinazotumwa hutumia funguo bayana za JSON, maombi ya HTTPS yenye mipaka, na uthibitisho wa majibu. Ujumbe wa hitilafu huhifadhi maelezo ya kushindwa huku ukificha tokeni ya API iliyosanidiwa. Tazama [SECURITY.md](../../../SECURITY.md) kwa kuripoti masuala ya usalama.

### Upau wa menyu na Shortcuts

[Mwongozo wa upau wa menyu](../../../workflows/menubar/README.md) hushughulikia programu-jalizi ya hiari ya SwiftBar/xbar. Sakinisha Apple Services kwanza, kisha usanidi saraka ya programu-jalizi katika programu yako ya upau wa menyu na uunganishe `workflows/menubar/gtd-menubar.sh` ndani yake.

[Mwongozo wa Shortcuts](../../../workflows/shortcuts/README.md) hutoa usanidi wa mikono wa unasa wa maandishi, ubao wa kunakili, na Siri kwenye macOS 12+. Uwashaji wa sauti wa Shortcuts na Siri hauko ndani ya seti ya majaribio yanayopangishwa.

## Muundo wa mfumo

Vifurushi vya Automator hupachika AppleScript ili viweze kuendeshwa kama Huduma asilia. Alfred hufunga hati za vitendo na hupitisha ingizo la mtumiaji kama hoja. GTDLib hutoa shughuli za asilia za Reminders zinazoshirikiwa kutoka kwa msimbo chanzo wa AppleScript unaohaririwa na kifurushi cha hati kilichokusanywa.

- **Kichanganuzi kimoja cha uzalishaji:** `scripts/sync-native-parser.py` hupachika kichanganuzi kinachoshirikiwa katika Quick Capture na Event Capture; uthibitishaji hugundua mabadiliko yasiyolingana ya chanzo.
- **Hali endelevu ya umakini:** maombi tofauti hushiriki hali ya kipindi, pamoja na kazi za launchd zinazomilikiwa na uhesabuji wa muda uliopita wenye mipaka.
- **Vifurushi vinavyoweza kuzalishwa tena:** ufungaji hujenga kumbukumbu mpya, na majaribio hulinganisha yaliyomo na msimbo chanzo. Maktaba ina hati tofauti ya ukusanyaji.
- **Majaribio yanayoweza kufuatiliwa:** Ripoti za JUnit, kumbukumbu za amri, na vitu vilivyojengwa na kujaribiwa huhifadhiwa kwa siku 14 katika GitHub Actions.

| Saraka | Jukumu |
| --- | --- |
| [`workflows/`](../../../workflows/) | Vifurushi asilia, adapta za watoa huduma, Alfred, Shortcuts, na hati za upau wa menyu |
| [`scripts/`](../../../scripts/) | Ufungaji, ukusanyaji wa maktaba, usawazishaji wa kichanganuzi, na utoaji wa majaribio yanayopangishwa |
| [`tests/`](../../../tests/) | Uthibitishaji, ukaguzi wa vipengele, na E2E ya asilia ya eneo-kazi |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E ya usiku/mikono, na matengenezo ya hazina |
| [`infra/`](../../../infra/) | Usanidi wa hiari wa mwendeshaji wa Mac wa ndani na EC2; CI inayopangishwa haihitaji |

## Majaribio na upatanifu

| Wigo | Mazingira | Kinachokaguliwa |
| --- | --- | --- |
| Uthibitishaji | macOS 15 na 26 zinazopangishwa na GitHub | Ukusanyaji wa AppleScript, vifurushi, kichanganuzi cha uzalishaji, malengo ya vitendo, mapendeleo, hali ya umakini, usafirishaji wa API ya kiigizo, na majaribio ya kufunga na kufungua vifurushi |
| Ukaguzi wa usalama | Ubuntu na macOS 15 zinazopangishwa na GitHub | Python CodeQL, ShellCheck, na Atheris fuzzing yenye mipaka ya kichanganuzi cha uzalishaji kilichokusanywa |
| E2E ya adapta za watoa huduma | `macos-15-intel` inayopangishwa na GitHub | Vidirisha vyote vinne vya API ya uzalishaji, usafirishaji wa TLS, uhifadhi/usomaji wa kiigizo, kushindwa kwa API, kughairi, na uteuzi wa chanzo cha Notion |
| E2E ya watoa huduma halisi | Uendeshaji wa mikono wa Mac inayopangishwa na GitHub na siri mahususi | Unasa halisi wa Todoist, Notion, Microsoft, na Google na usomaji wa mchuuzi; hushindwa kama akaunti hazipo |
| Miunganisho ya eneo-kazi yenye leseni | Akaunti mahususi ya ndani | Things 3, OmniFocus 4, na uanzishaji na uhifadhi kupitia UI ya Alfred |
| E2E ya asilia ya eneo-kazi | `macos-15-intel` inayopangishwa na GitHub | Vidirisha halisi vya Automator; data iliyohifadhiwa ya Reminders na Calendar; ukaguzi wa kila wiki; idadi kwenye menyu; GTDLib iliyokusanywa; vitendo asilia vya Alfred vilivyofungwa; kuisha kwa muda na kughairi kwa kipima muda halisi cha launchd |
| UI ya hiari ya Alfred | Akaunti mahususi ya ndani, Alfred 5 + Powerpack | Uingizaji wa mchakato, uanzishaji wa neno kuu, na usomaji wa kikumbusho kupitia UI yenye leseni |

[Uendeshaji uliothibitishwa wa uboreshaji wa API](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ulifaulu **majaribio 35 ya uthibitishaji kwenye kila jukwaa la uthibitishaji na majaribio 26 ya E2E ya eneo-kazi**, bila kushindwa, hitilafu, au kurukwa. Ufikiaji wa eneo-kazi unajumuisha majaribio 15 asilia na majaribio 11 ya adapta za watoa huduma, ikiwa ni pamoja na muda halisi wa kuisha kwa usafirishaji na ukaguzi wa hitilafu za muda za Keychain. Uthibitishaji pia huendesha ukaguzi wa muundo wa hazina. Matokeo haya yanashughulikia mwenendo wa asilia na viigizo vya watoa huduma; hayathibitishi upatanifu wa mchuuzi halisi au programu yenye leseni. Hali ya sasa inaonyeshwa na beji zilizo hapo juu.

Pull requests na pushes kwenye `main` huendesha uthibitishaji ukifuatiwa na E2E ya asilia. Mchakato wa E2E pia huendeshwa kila usiku na kwa kutuma kwa mikono, ikijumuisha majaribio yanayotabirika ya adapta za watoa huduma. Majaribio ya wachuuzi halisi hutumia mchakato tofauti wa mikono `live-e2e.yml`. CI chaguo-msingi hutumia kompyuta za Mac za muda zinazopangishwa na GitHub, viigizo vilivyotengwa, na michakato midogo yenye mipaka; hakuna mwendeshaji anayejipangishia au vitambulisho vya akaunti za nje vinavyohitajika kwa seti chaguo-msingi. Seti ya moja kwa moja ya mikono inahitaji siri mahususi za watoa huduma.

Matoleo ya awali ya macOS hayathibitishwi na CI ya sasa. Uendeshaji wa watoa huduma halisi unahitaji siri mahususi na bado haujathibitishwa. Shortcuts/Siri na programu za eneo-kazi zenye leseni ziko nje ya seti chaguo-msingi inayopangishwa. Majaribio ya vitendo asilia hujaribu hati za Alfred zilizofungwa moja kwa moja; hayathibitishi upatanifu kamili wa UI ya Alfred. Tazama [usanidi wa majaribio, masharti ya awali, na wigo](../../../tests/e2e/README.md).

## Ujanibishaji

Mifuatano ya CLI inayowakabili watumiaji, mwendeshaji wa majaribio, na upau wa menyu hutolewa katika lugha 45 (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) chini ya `locales/` kupitia `scripts/i18n.py` bila vitegemezi vyovyote vya wahusika wengine. Utatuzi wa lugha hukagua `--lang`, kisha `LC_ALL`, `LC_MESSAGES`, na `LANG`, ukirudi kwenye `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Uendelezaji

Sakinisha [mise](https://mise.jdx.dev/) na utumie toleo la Python lililowekwa katika `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Uthibitishaji huandika ripoti chini ya `test-results/`; hati za ujenzi huandika kwenye `dist/`. Ili kuendesha seti ya eneo-kazi inayopangishwa kwenye `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

E2E ya eneo-kazi la ndani inahitaji akaunti mahususi ya majaribio iliyoingia na ruhusa zilizoelezwa katika [mwongozo wa E2E](../../../tests/e2e/README.md). Hati ya utoaji wa ruhusa inayopangishwa imezuiliwa kwa kazi za muda zinazopangishwa na GitHub.

Tumia [Conventional Commits](https://www.conventionalcommits.org/) na ufuate [CONTRIBUTING.md](../../../CONTRIBUTING.md). Mabadiliko ya hivi karibuni yamerekodiwa katika [CHANGELOG.md](../../../CHANGELOG.md).

Vidhibiti vya usalama, uthibitishaji wa saini ya toleo, na mapungufu yaliyosalia ya Scorecard yameandikwa katika [tathmini ya usalama](../../../docs/security-assessment.md).
Mchakato wa toleo hujenga na kuthibitisha vifurushi kabla ya kuunda toleo la rasimu,
ikiwa ni pamoja na uthibitisho wa chanzo wa in-toto uliosainiwa na vifurushi vya Sigstore vilivyothibitishwa dhidi ya
commit ya chanzo na ref. Uthibitisho mpya unatumika kwa miundo hiyo ya mchakato, si
matoleo ya awali yaliyopakuliwa.

## Historia ya mradi na leseni

MacGTD inaunganisha hazina za zamani za MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, na AlfredGTD. Imepewa leseni chini ya [Leseni ya MIT](../../../LICENSE).
