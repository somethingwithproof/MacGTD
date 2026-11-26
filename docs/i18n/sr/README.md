# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (28 locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [Bosanski](../bs/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Hrvatski](../hr/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · **Српски** · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD је збирка macOS радних токова за унос задатака, организовање подсетника и вођење временски ограничених фокус-сесија помоћу апликација које већ користите.**

Изграђен на методологији [Getting Things Done](https://gettingthingsdone.com/), доноси унос путем дијалога, оставе и групног уноса у Apple Reminders, унос догађаја у Calendar и команде за задатке, белешке, пројекте и фокус у Alfred. AppleScript и Automator држе изворне радне токове чврсто интегрисаним са системом macOS. API адаптери користе Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 и Google Keep v1. Укључени су и адаптери за Things и OmniFocus. Хостовани тестови проверавају API адаптере на локалном HTTPS тестном серверу; компатибилност уживо и даље захтева наменске налоге код тих провајдера.

## Шта можете да урадите

- **Уносите задатке без пребацивања апликација.** Користите Automator сервис, Alfred кључну реч или оставу да додате задатак. Групни унос креира по један подсетник за сваки непразан ред.
- **Претворите текст у структуриране задатке.** Парсирајте релативне и ISO датуме, времена, приоритете, контексте и пројекте помоћу продукцијског AppleScript парсера који деле изворни брзи унос и унос у Calendar.
- **Уносите догађаје и прегледајте пристигле задатке.** Креирајте догађаје у апликацији Calendar са временом, трајањем и локацијом; спроведите недељни преглед у пет корака уз прикупљање свих идеја у Reminders.
- **Радите у временски ограниченим фокус-сесијама.** Покрените, проверите и зауставите сесије између различитих процеса. Сопствени launchd тајмери по сесији управљају истеком и отказивањем, а JSONL датотеке дневника пружају аналитику трајања.
- **Користите Alfred за више од самих задатака.** Креирајте листе у апликацији Reminders за пројекте, чувајте референтне белешке, отварајте пристигле ставке за преглед, уносите текст из оставе и уређујте типизирана подешавања.
- **Пратите пристигле задатке из траке менија.** Опциони SwiftBar/xbar додатак приказује број недовршених задатака и пречице ка радним токовима за унос.

Изворно понашање проверава се на стварним GitHub-хостованим Mac рачунарима: тестови управљају Automator дијалозима, а затим очитавају записе из апликација Reminders и Calendar. Погледајте одељак [тестирање и компатибилност](#тестирање-и-компатибилност) за обим тих доказа.

## Брзи почетак: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Отворите радни ток у апликацији Automator и покрените га да испробате унос. Да би био доступан као сервис (Service), инсталирајте пакет у `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Доделите пречицу у **System Settings → Keyboard → Keyboard Shortcuts → Services**. Одобрите Automation приступ апликацији Reminders када macOS то затражи. Унесите:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Изворни радни ток креира подсетник високог приоритета са роком за сутра, усмерава га у листу `shopping` и бележи контекст. Без ознаке пројекта или контекста, брзи унос користи `Inbox`.

## Синтакса уноса

Изворни парсер задатака и Alfred унос задатака препознају следеће ознаке. Адаптери за спољне сервисе имају сопствену подршку за поља и усмеравање.

| Унос | Значење | Пример |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Високи, средњи или ниски приоритет | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Релативни рок | `Call dentist tomorrow` |
| Дан у недељи или `next weekday` | Рок по дану у недељи | `Send report next monday` |
| `due:YYYY-MM-DD` | Експлицитни датум рока | `Renew membership due:2027-03-15` |
| Време уз датум | Време рока | `Call Alex tomorrow at 3pm` |
| `@context` | Ознака контекста | `Buy milk @errands` |
| `+project` | Усмеравање у пројекат/листу | `Draft outline +website` |

Прихватају се и `due:today` и `due:tomorrow`. У ознакама контекста и пројеката користите слова, бројеве, доње црте или цртице. Изворни брзи унос даје предност усмеравању по пројекту у односу на контекст.

Унос у Calendar користи `@` за локацију догађаја и прихвата трајање у минутима или сатима:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Без експлицитног времена или трајања, унос у Calendar користи 9:00 AM и један сат у првом календару у који је могућ упис.

## Изаберите радни ток

### Изворни Apple радни токови

| Радни ток | Понашање | Пакет |
| --- | --- | --- |
| Брзи унос | Парсира текст задатка и креира подсетник | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Унос из оставе | Креира подсетник из текста у остави | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Групни унос | Креира подсетнике из више редова | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Унос догађаја | Креира догађај у апликацији Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Недељни преглед | Вођени преглед и прикупљање подсетника | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Отворите пакет у апликацији Automator да га испробате или га инсталирајте у `~/Library/Services` за приступ путем тастатуре. Апликацијама Reminders и Calendar потребне су одговарајуће macOS Automation дозволе.

### Alfred

Захтева Alfred са Powerpack лиценцом. Направите пакет из тренутног изворног кода:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Пакет можете преузети и са странице [издања](https://github.com/somethingwithproof/MacGTD/releases). Пакети издања одражавају означени изворни код; функције додате на грану `main` након издања захтевају изградњу из изворног кода.

| Кључна реч | Радња |
| --- | --- |
| `task` | Унос задатка уз парсирање датума, контекста, пројекта и приоритета |
| `note` | Чување референтне белешке у Reminders |
| `project` | Креирање листе у апликацији Reminders |
| `gtd process` | Отварање листе Inbox за ручни преглед |
| `clip` | Унос текста из оставе |
| `gtd focus` | Покретање фокус-сесије, провера статуса или заустављање |
| `gtd analytics` | Преглед забележених трајања фокус-сесија |
| `gtd preferences` | Уређивање подешавања радног тока |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Подешавања се чувају у датотеци `~/Library/Preferences/com.alfredgtd.plist`, док се стање фокуса и дневници налазе у директоријуму `~/.gtd`. Подешавања имају уграђене подразумеване вредности, проверу типова, валидирани увоз и атомичан упис. Фокус-сесије не мењају системска подешавања обавештења. Обрада пристиглих задатака само отвара листу за преглед и не премешта нити завршава задатке аутоматски.

Погледајте [Alfred водич](../../../workflows/alfred/README.md) и [документацију библиотеке GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Спољни адаптери за унос

Сва четири API радна тока за унос проверавају се кроз праве Automator дијалоге и локални TLS тестни сервер у хостованим E2E тестовима. Посебан ручни скуп тестова проверава стварно чување код провајдера када су подешени наменски налози. Things и OmniFocus захтевају лиценцирани пакет десктоп интеграционих тестова.

| Циљ | Механизам | Подешавање / извор |
| --- | --- | --- |
| Todoist | API унос | [Радни ток и Keychain подешавање](../../../workflows/todoist/) |
| Notion | Унос путем Data Source API-ја | [Радни ток и Keychain подешавање](../../../workflows/notion/) |
| Things 3 | URL шема | [Радни ток](../../../workflows/things/) |
| OmniFocus | AppleScript / URL шема | [Радни ток](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Радни ток](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Радни ток](../../../workflows/google/) |

API адаптери захтевају подешавање акредитива; Microsoft захтева делегирану OAuth ауторизацију, а Google Keep одговарајући Workspace приступ:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Погледајте [захтеве за API подешавање, миграцију и ауторизацију](../../../workflows/api/README.md). Постојећи ID-ови Notion база података мигрирају се само када је пронађен тачно један извор података. Унос за Microsoft и Google користи званичне API-је уместо недокументованих пречица прегледача. OAuth приступни токени захтевају обнављање путем вашег OAuth клијента. Захтеви користе експлицитне JSON кључеве, временски ограничене HTTPS позиве и потврду одговора. Поруке о грешци чувају детаље отказа док скривају подешени API токен. Погледајте [SECURITY.md](../../../SECURITY.md) за пријаву безбедносних проблема.

### Трака менија и Shortcuts

[Водич за траку менија](../../../workflows/menubar/README.md) описује опциони SwiftBar/xbar додатак. Прво инсталирајте Apple сервисе, затим подесите директоријум додатака у апликацији за траку менија и повежите `workflows/menubar/gtd-menubar.sh` у њега.

[Shortcuts водич](../../../workflows/shortcuts/README.md) пружа ручно подешавање за унос текста, оставе и Siri унос на macOS 12+. Shortcuts и Siri гласовно покретање нису део хостованог скупа тестова.

## Архитектура

Automator пакети уграђују AppleScript како би могли да раде као изворни сервиси. Alfred пакује скрипте радњи и прослеђује кориснички унос као аргументе. GTDLib пружа заједничке изворне операције за Reminders из изменљивог AppleScript изворног кода и компајлираног пакета скрипти.

- **Један продукцијски парсер:** `scripts/sync-native-parser.py` уграђује заједнички парсер у Quick Capture и Event Capture; валидација открива одступања изворног кода.
- **Трајно стање фокуса:** одвојена покретања деле стање сесије уз сопствене launchd послове и ограничено праћење протеклог времена.
- **Поновљиви пакети:** паковање прави свежу архиву, а тестови пореде њен садржај са изворним кодом. Библиотека има засебну скрипту за компајлирање.
- **Прегледни тестови:** JUnit извештаји, дневници команди и тестирани артефакти изградње чувају се 14 дана у сервису GitHub Actions.

| Директоријум | Одговорност |
| --- | --- |
| [`workflows/`](../../../workflows/) | Изворни пакети, адаптери сервиса, Alfred, Shortcuts и скрипте за траку менија |
| [`scripts/`](../../../scripts/) | Паковање, компајлирање библиотеке, синхронизација парсера и припрема хостованих тестова |
| [`tests/`](../../../tests/) | Валидација, провере компоненти и изворни десктоп E2E тестови |
| [`.github/workflows/`](../../../.github/workflows/) | CI, ноћни/ручни E2E тестови и одржавање репозиторијума |
| [`infra/`](../../../infra/) | Опционо подешавање локалног и EC2 Mac извршиоца; хостовани CI га не захтева |

## Тестирање и компатибилност

| Обим | Окружење | Шта се проверава |
| --- | --- | --- |
| Валидација | GitHub-хостовани macOS 15 и 26 | Компајлирање AppleScript-а, пакети, продукцијски парсер, циљеви радњи, подешавања, стање фокуса, тестни API транспорт и провера интегритета пакета |
| Безбедносне провере | GitHub-хостовани Ubuntu и macOS 15 | Python CodeQL, ShellCheck и ограничено Atheris fuzz тестирање компајлираног продукцијског парсера |
| E2E адаптера сервиса | GitHub-хостовани `macos-15-intel` | Сва четири продукцијска API дијалога, TLS транспорт, тестно чување и читање, API грешке, отказивање и избор Notion извора |
| E2E сервиса уживо | Ручно покретање на GitHub-хостованом Mac рачунару са наменским тајнама | Стварни Todoist, Notion, Microsoft и Google унос и очитавање са сервера; пада ако налози недостају |
| Лиценциране десктоп интеграције | Наменски локални налог | Покретање и чување података кроз кориснички интерфејс апликација Things 3, OmniFocus 4 и Alfred |
| Изворни десктоп E2E | GitHub-хостовани `macos-15-intel` | Прави Automator дијалози; сачувани подаци у Reminders и Calendar; недељни преглед; бројачи у траци менија; компајлирани GTDLib; упаковане изворне Alfred радње; стварни истек и отказивање launchd тајмера |
| Опциони Alfred UI | Наменски локални налог, Alfred 5 + Powerpack | Увоз радног тока, позивање кључном речи и очитавање подсетника кроз лиценцирани интерфејс |

[Верификовано покретање модернизације API-ја](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) прошло је **35 тестова валидације на свакој платформи и 26 десктоп E2E тестова**, без неуспеха, грешака или прескакања. Десктоп покривеност обухвата 15 изворних тестова и 11 тестова адаптера сервиса, укључујући проверу стварног истека мрежног времена и привремених Keychain провера. Валидација такође извршава провере структуре репозиторијума. Ови резултати покривају изворно понашање и тестне сервере; не доказују компатибилност са сервисима уживо нити лиценцираним апликацијама. Тренутни статус приказан је на ознакама изнад.

Захтеви за спајање и слања измена на грану `main` покрећу валидацију након које следи изворни E2E. E2E радни ток такође се покреће сваке ноћи и ручно, укључујући детерминистичке тестове адаптера сервиса. Тестови сервиса уживо користе посебан ручни радни ток `live-e2e.yml`. Подразумевани CI користи једнократне GitHub-хостоване Mac рачунаре, изоловане тестне сервере и ограничене потпроцесе; за основни скуп тестова није потребан сопствени сервер за извршавање нити спољни акредитиви. Ручни пакет уживо захтева наменске тајне провајдера.

Раније верзије система macOS нису валидиране тренутним CI системом. Покретања сервиса уживо захтевају наменске тајне и још нису верификована. Shortcuts/Siri и лиценциране десктоп апликације су изван подразумеваног хостованог скупа. Тестови изворних радњи директно позивају упаковане Alfred скрипте и не доказују потпуну компатибилност са Alfred интерфејсом. Погледајте [подешавање тестова, предуслове и покривеност](../../../tests/e2e/README.md).

## Локализација

Корисничке поруке за CLI, покретач тестова и траку менија испоручују се у 48 локалитета (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`, `bs`, `hr`, `sr`) у директоријуму `locales/` путем `scripts/i18n.py` без икаквих спољних зависности. Одређивање локалитета проверава `--lang`, затим `LC_ALL`, `LC_MESSAGES` и `LANG`, уз повратак на `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Развој

Инсталирајте [mise](https://mise.jdx.dev/) и користите верзију Python-а дефинисану у датотеци `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Валидација уписује извештаје у `test-results/`, а скрипте за изградњу пишу у `dist/`. За покретање хостованог десктоп скупа на грани `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Локални десктоп E2E захтева наменски пријављени тестни налог и дозволе описане у [E2E водичу](../../../tests/e2e/README.md). Скрипта за подешавање дозвола у хостованом окружењу ограничена је на једнократне GitHub-хостоване послове.

Користите [Conventional Commits](https://www.conventionalcommits.org/) и пратите [CONTRIBUTING.md](../../../CONTRIBUTING.md). Недавне измене забележене су у [CHANGELOG.md](../../../CHANGELOG.md).

Безбедносне контроле, провера потписа издања и преостала ограничења за Scorecard документовани су у [безбедносној процени](../../../docs/security-assessment.md). Радни ток за издања гради и потврђује пакете пре креирања нацрта издања, укључујући потписано in-toto порекло и Sigstore пакете проверене према изворном комиту и референци. Ново порекло односи се на те изградње радног тока, а не на старија преузимања.

## Историја пројекта и лиценца

MacGTD обједињује некадашње репозиторијуме MacGTD-Native, MacGTD-Microsoft, MacGTD-Google и AlfredGTD. Лиценциран је под [MIT лиценцом](../../../LICENSE).
