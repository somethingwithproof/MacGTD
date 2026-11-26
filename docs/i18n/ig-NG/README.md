# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · **Igbo** · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD bụ nchịkọta usoro ọrụ macOS maka idekọ ọrụ, ịhazi ihe ncheta, na ịgba oge itinye uche nwere oge a kara aka site n'iji ngwa ndị ị na-ejibu.**

E wuru ya dabere na [Getting Things Done](https://gettingthingsdone.com/), ọ na-eweta ndekọ igbe mkparịta ụka, clipboard, na ọtụtụ ahịrị n'otu oge na Apple Reminders; ndekọ mmemme na Calendar; yana iwu ọrụ, ndetu, ọrụ ngo, na itinye uche na Alfred. AppleScript na Automator na-eme ka usoro ọrụ dị n'ime ya rụọ ọrụ n'ụzọ kwekọrọ na macOS. Ihe njikọ API na-eji Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, na Google Keep v1. A gụnyekwara ihe njikọ Things na OmniFocus. Nnwale ndị a na-agba na sava na-enyochapụta ihe njikọ API site n'iji ngwa nnwale HTTPS nke mpaghara; ndakọrịta n'ọrụ ndụ ka chọrọ akaụntụ ndị na-enye ọrụ pụrụ iche.

## Ihe ị nwere ike ime

- **Dekọọ n'agbanweghị ngwa.** Jiri Automator Service, okwu igodo Alfred, ma ọ bụ clipboard tinye ọrụ. Ndekọ ọtụtụ ahịrị na-emepụta otu ihe ncheta maka ahịrị ọ bụla na-adịghị oghere.
- **Gbanwee ederede ka ọ bụrụ ọrụ a haziri ahazi.** Kewaa ma ghọta ụbọchị ndị dị nso na nke ISO, oge, ọkwa mkpa, ọnọdụ, na ọrụ ngo site n'iji ihe nkewa ederede AppleScript nke mmepụta nke ndekọ ngwa ngwa nke macOS na ndekọ Calendar jikọrọ aka eji.
- **Dekọọ mmemme ma nyochaa igbe mbata gị.** Mepụta mmemme Calendar nwere oge, ogologo oge, na ebe; gbaa nyocha kwa izu nwere nzọụkwụ ise yana mbupụ echiche niile n'ime Reminders.
- **Rụọ ọrụ n'oge itinye uche nwere oge a kara aka.** Malite, nyochaa, ma kwụsị oge itinye uche n'etiti usoro dị iche iche. Oge ngụkọ launchd nke oge itinye uche nwe na-elekọta njedebe oge na ịkagbu; ndekọ JSONL na-enye nnyocha ogologo oge.
- **Jiri Alfred mee ihe karịrị naanị ọrụ.** Mepụta ndepụta Reminders maka ọrụ ngo, chekwaa ndetu ntụaka, mepee igbe mbata maka nyocha, dekọọ ederede dị na clipboard, ma dezie nhọrọ ndị nwere ụdị data doro anya.
- **Hụ igbe mbata gị site n'ogwe menu.** Ihe nkwụnye SwiftBar/xbar nke nhọrọ na-egosi ọnụọgụ ihe ndị na-emezubeghị n'igbe mbata na njikọ gaa na usoro ọrụ ndekọ.

A na-enyocha omume usoro dị n'ime ya na kọmputa Mac n'ezie nke GitHub na-akwado: nnwale na-arụ ọrụ n'igbe mkparịta ụka Automator, wee gụghachi ndekọ Reminders na Calendar. Lee [nnwale na ndakọrịta](#testing-and-compatibility) maka ebe ihe akaebe ahụ ruru.

## Mbido ngwa ngwa: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Mepee usoro ọrụ ahụ na Automator ma gbaa ya iji nwalee ndekọ. Iji mee ka ọ dị njikere dịka Service, wụnye ngwugwu ahụ n'okpuru `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Nye ya ụzọ mkpirisi na **System Settings → Keyboard → Keyboard Shortcuts → Services**. Kwe ka Automation nweta ohere na Reminders mgbe macOS jụrụ. Tinye:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Usoro ọrụ dị n'ime ya na-emepụta ihe ncheta dị oke mkpa nke oge ya ga-eru echi, ziga ya na ndepụta `shopping`, ma dekọọ ọnọdụ ya. Enweghị akara ọrụ ngo ma ọ bụ ọnọdụ, ndekọ ngwa ngwa na-eji `Inbox`.

## Usoro ndekọ

Ihe nkewa ederede ọrụ dị n'ime ya na ndekọ ọrụ Alfred na-amata akara ndị a. Ihe njikọ nke ndị na-enye ọrụ nwere nkwado mpaghara data na ntụziaka nke ha.

| Ntinye | Mpụtara | Ọmụmaatụ |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Ọkwa mkpa dị elu, nke etiti, ma ọ bụ nke dị ala | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Ụbọchị ngwụcha dị nso | `Call dentist tomorrow` |
| Ụbọchị izu ma ọ bụ `next weekday` | Ụbọchị ngwụcha nke ụbọchị izu | `Send report next monday` |
| `due:YYYY-MM-DD` | Ụbọchị ngwụcha a kpọrọ aha | `Renew membership due:2027-03-15` |
| Oge so ụbọchị | Oge ngwụcha | `Call Alex tomorrow at 3pm` |
| `@context` | Akara ọnọdụ | `Buy milk @errands` |
| `+project` | Ntụziaka ọrụ ngo/ndepụta | `Draft outline +website` |

A na-anabatakwa `due:today` na `due:tomorrow`. Jiri mkpụrụedemede, nọmba, ahịrị okpuru, ma ọ bụ akara njikọ na akara ọnọdụ na ọrụ ngo. Ndekọ ngwa ngwa nke dị n'ime ya na-enye ntụziaka ọrụ ngo ibu ụzọ karịa ntụziaka ọnọdụ.

Ndekọ Calendar na-eji `@` maka ebe mmemme ahụ ga-eme ma na-anabata ogologo oge na nkeji ma ọ bụ elekere:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Enweghị oge ma ọ bụ ogologo oge a kpọrọ aha, ndekọ Calendar na-eji elekere 9:00 ụtụtụ na otu elekere, na kalịnda mbụ a pụrụ ide ihe na ya.

## Họrọ usoro ọrụ

### Usoro ọrụ Apple dị n'ime ya

| Usoro ọrụ | Omume | Ngwugwu |
| --- | --- | --- |
| Ndekọ ngwa ngwa | Kewaa ederede ọrụ ma mepụta ihe ncheta | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Ndekọ clipboard | Mepụta ihe ncheta site na ederede clipboard | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Ndekọ ọtụtụ ahịrị | Mepụta ihe ncheta site n'ọtụtụ ahịrị | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Ndekọ mmemme | Mepụta mmemme Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Nyocha kwa izu | Nyocha nwere nduzi na mbupụ echiche n'ihe ncheta | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Mepee ngwugwu na Automator iji nwalee ya, ma ọ bụ wụnye ya n'okpuru `~/Library/Services` maka ojiji ahụigodo. Reminders na Calendar chọrọ ikike Automation nke macOS kwesịrị ekwesị.

### Alfred

Ọ chọrọ Alfred nwere Powerpack. Wuo ngwugwu ahụ site na koodu isi dị ugbu a:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Ị nwekwara ike ibudata ngwugwu ahụ site na [mbipụta](https://github.com/somethingwithproof/MacGTD/releases). Ngwugwu mbipụta na-egosipụta koodu isi ha e nyere akara; atụmatụ ndị a gbakwụnyere na `main` mgbe mbipụta gasịrị chọrọ iwulite site na koodu isi.

| Okwu igodo | Omume |
| --- | --- |
| `task` | Dekọọ ọrụ nwere nkewa ụbọchị, ọnọdụ, ọrụ ngo, na ọkwa mkpa |
| `note` | Chekwaa ndetu ntụaka na Reminders |
| `project` | Mepụta ndepụta Reminders |
| `gtd process` | Mepee Inbox maka nyocha mmadụ |
| `clip` | Dekọọ ederede clipboard |
| `gtd focus` | Malite oge itinye uche, nyochaa ọnọdụ, ma ọ bụ kwụsị |
| `gtd analytics` | Nyochaa ogologo oge itinye uche e dekọrọ |
| `gtd preferences` | Dezie nhọrọ usoro ọrụ |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Nhọrọ dị na `~/Library/Preferences/com.alfredgtd.plist`; ọnọdụ itinye uche na ndekọ dị n'okpuru `~/.gtd`. Nhọrọ nwere ntọala e tinyere n'ime ya, nyocha ụdị data, mbubata a kwadoro, na ndedebe zuru oke n'otu mgbe. Oge itinye uche anaghị agbanwe ntọala ọkwa sistemụ. Nhazi igbe mbata na-emepe ndepụta ahụ maka nyocha; ọ naghị ebugharị ma ọ bụ mezue ọrụ n'onwe ya.

Lee [akwụkwọ ntuziaka Alfred](../../../workflows/alfred/README.md) na [akwụkwọ ọba akwụkwọ GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Ihe njikọ ndekọ nke mpụga

A na-anwale usoro ọrụ ndekọ API anọ niile site n'igbe mkparịta ụka Automator n'ezie na ngwa nnwale TLS nke mpaghara na E2E a na-agba na sava. Otu ngwa nnwale aka dị iche na-anwale nchekwa data n'ezie nke ndị na-enye ọrụ mgbe e haziri akaụntụ pụrụ iche. Things na OmniFocus chọrọ ngwa nnwale njikọ desktọpụ nwere ikike ojiji.

| Ebe a na-eziga | Usoro ọrụ | Nhazi / koodu isi |
| --- | --- | --- |
| Todoist | Ndekọ API | [Nhazi usoro ọrụ na Keychain](../../../workflows/todoist/) |
| Notion | Ndekọ API isi iyi data | [Nhazi usoro ọrụ na Keychain](../../../workflows/notion/) |
| Things 3 | Atụmatụ URL | [Usoro ọrụ](../../../workflows/things/) |
| OmniFocus | AppleScript / atụmatụ URL | [Usoro ọrụ](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Usoro ọrụ](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Usoro ọrụ](../../../workflows/google/) |

Ihe njikọ API chọrọ nhazi nzere nbanye; Microsoft chọrọ ikike OAuth e nyefere na Google Keep chọrọ ohere Workspace ruru eru:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Lee [nhazi API, mbugharị data, na ihe a chọrọ maka ikike nbanye](../../../workflows/api/README.md). Nọmba njirimara nchekwa data Notion ndị dị adị na-akwaga naanị mgbe a chọtara kpọmkwem otu isi iyi data. Ndekọ Microsoft na Google na-eji API kama ụzọ mkpirisi ihe nchọgharị na-enweghị akwụkwọ nkọwa. Token nnweta OAuth chọrọ mmegharị site na ngwa ahịa OAuth gị. Data a na-eziga na-eji igodo JSON doro anya, arịrịọ HTTPS nwere oke, na nkwenye azịza. Ozi njehie na-edobe nkọwa ọdịda ebe ọ na-ezochi token API e haziri. Lee [SECURITY.md](../../../SECURITY.md) maka ịkọ nsogbu nchekwa.

### Ogwe menu na Shortcuts

[Akwụkwọ ntuziaka ogwe menu](../../../workflows/menubar/README.md) na-akọwa ihe nkwụnye SwiftBar/xbar nke nhọrọ. Wụnye Apple Services mbụ, wee hazie folda ihe nkwụnye n'ime ngwa ogwe menu gị ma jikọọ `workflows/menubar/gtd-menubar.sh` n'ime ya.

[Akwụkwọ ntuziaka Shortcuts](../../../workflows/shortcuts/README.md) na-enye nhazi aka maka ndekọ ederede, clipboard, na Siri na macOS 12+. Shortcuts na mbido olu Siri dị na mpụga ngwa nnwale a na-agba na sava.

## Nhazi usoro

Ngwugwu Automator na-etinye AppleScript n'ime ha ka ha nwee ike ịrụ ọrụ dịka Services nke macOS. Alfred na-achịkọta skriptị omume ma na-eziga ntinye onye ọrụ dịka arụmụka. GTDLib na-enye ọrụ Reminders dị n'ime ya a na-ekerịta site na koodu isi AppleScript a pụrụ idezi na ngwugwu skriptị a chịkọtara.

- **Otu ihe nkewa ederede nke mmepụta:** `scripts/sync-native-parser.py` na-etinye ihe nkewa ederede a na-ekerịta n'ime Quick Capture na Event Capture; nnyocha nkwenye na-achọpụta mgbanwe dị iche na koodu isi.
- **Ọnọdụ itinye uche na-adịgide adịgide:** oku dị iche iche na-ekerịta ọnọdụ oge itinye uche, yana ọrụ launchd ha nwe na ngụkọta oge gafere nwere oke.
- **Ngwugwu a pụrụ imepụtaghachi:** nchịkọta ngwugwu na-ewu faịlụ nchekwa ọhụrụ, na nnwale na-atụnyere ihe dị n'ime ya na koodu isi. Ọba akwụkwọ ahụ nwere skriptị nchịkọta dị iche.
- **Nnwale a pụrụ ịhụ:** a na-edobe akụkọ JUnit, ndekọ iwu, na ngwaahịa nrụpụta e nwalere maka ụbọchị 14 na GitHub Actions.

| Folda | Ọrụ ya |
| --- | --- |
| [`workflows/`](../../../workflows/) | Ngwugwu dị n'ime ya, ihe njikọ ndị na-enye ọrụ, Alfred, Shortcuts, na skriptị ogwe menu |
| [`scripts/`](../../../scripts/) | Nchịkọta ngwugwu, nchịkọta ọba akwụkwọ, mmekọrịta ihe nkewa ederede, na nkwadebe nnwale na sava |
| [`tests/`](../../../tests/) | Nnyocha nkwenye, nyocha akụkụ dị iche iche, na E2E desktọpụ nke macOS |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E kwa abalị/aka, na ndozi ebe nchekwa koodu |
| [`infra/`](../../../infra/) | Nhazi onye na-agba ọrụ Mac nke mpaghara na EC2 nke nhọrọ; CI a na-agba na sava achọghị ya |

<a name="testing-and-compatibility"></a>

## Nnwale na ndakọrịta

| Mpaghara nnwale | Gburugburu | Ihe a na-enyocha |
| --- | --- | --- |
| Nnyocha nkwenye | macOS 15 na 26 nke GitHub na-akwado | Nchịkọta AppleScript, ngwugwu, ihe nkewa ederede nke mmepụta, ebe omume, nhọrọ, ọnọdụ itinye uche, mbufe API nke ngwa nnwale, na nchịkọta na ntọghe ngwugwu |
| Nyocha nchekwa | Ubuntu na macOS 15 nke GitHub na-akwado | Python CodeQL, ShellCheck, na nnwale Atheris fuzzing nwere oke nke ihe nkewa ederede mmepụta a chịkọtara |
| E2E nke ihe njikọ onye na-enye ọrụ | `macos-15-intel` nke GitHub na-akwado | Igbe mkparịta ụka API mmepụta anọ niile, mbufe TLS, nchekwa na ngụghachi ngwa nnwale, ọdịda API, ịkagbu, na nhọrọ isi iyi Notion |
| E2E onye na-enye ọrụ n'ọrụ ndụ | Ngba Mac aka nke GitHub na-akwado nwere ihe nzuzo pụrụ iche | Ndekọ Todoist, Notion, Microsoft, na Google n'ezie na ngụghachi site n'aka onye na-enye ọrụ; ọ na-ada ma ọ bụrụ na akaụntụ adịghị |
| Njikọ desktọpụ nwere ikike ojiji | Akaụntụ mpaghara pụrụ iche | Ọkpụkpọ na nchekwa nke Things 3, OmniFocus 4, na Alfred UI |
| E2E desktọpụ nke macOS | `macos-15-intel` nke GitHub na-akwado | Igbe mkparịta ụka Automator n'ezie; data Reminders na Calendar e chekwara; nyocha kwa izu; ọnụọgụ menu; GTDLib a chịkọtara; omume Alfred dị n'ime ya a chịkọtara; njedebe oge na ịkagbu oge ngụkọ launchd n'ezie |
| Alfred UI nke nhọrọ | Akaụntụ mpaghara pụrụ iche, Alfred 5 + Powerpack | Mbubata usoro ọrụ, ọkpụkpọ okwu igodo, na ngụghachi ihe ncheta site na UI nwere ikike ojiji |

[Ngba nnwale mmelite API a kwadoro](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) gafere **nnwale nkwenye 35 n'elu ikpo okwu nnyocha nkwenye ọ bụla na nnwale E2E desktọpụ 26**, n'enweghị ọdịda, njehie, ma ọ bụ mwụpụ. Nnwale desktọpụ gụnyere nnwale dị n'ime ya 15 na nnwale ihe njikọ onye na-enye ọrụ 11, gụnyere ngwụcha oge mbufe n'ezie na nyocha Keychain nwa oge. Nnyocha nkwenye na-agbakwa nyocha nhazi ebe nchekwa koodu. Nsonaazụ ndị a na-ekpuchi omume dị n'ime ya na ngwa nnwale nke ndị na-enye ọrụ; ha anaghị egosipụta ndakọrịta n'ọrụ ndụ nke onye na-enye ọrụ ma ọ bụ ngwa nwere ikike ojiji. Akara dị n'elu na-egosi ọnọdụ dị ugbu a.

Pull requests na nzipụ na `main` na-agba nnyocha nkwenye nke E2E nke macOS na-esochi. Usoro ọrụ E2E na-agbakwa kwa abalị na mgbe a malitere ya n'aka, gụnyere nnwale ihe njikọ onye na-enye ọrụ a pụrụ ibu amụma nsonaazụ ya. Nnwale onye na-enye ọrụ n'ọrụ ndụ na-eji usoro ọrụ aka dị iche bụ `live-e2e.yml`. CI nke ntọala na-eji kọmputa Mac nke GitHub na-akwado a na-ekpochapụ mgbe e jichara ya, ngwa nnwale dịpụrụ adịpụ, na obere usoro nwere oke; ọ dịghị mkpa onye na-agba ọrụ nke onwe ma ọ bụ nzere akaụntụ mpụga maka ngwa nnwale ntọala ahụ. Ngwa nnwale ọrụ ndụ nke aka chọrọ ihe nzuzo pụrụ iche nke onye na-enye ọrụ.

CI dị ugbu a anaghị enyochapụta ụdị macOS ndị tọrọ. Ngba nnwale onye na-enye ọrụ n'ọrụ ndụ chọrọ ihe nzuzo pụrụ iche ma a kwadobeghị ha ugbu a. Shortcuts/Siri na ngwa desktọpụ nwere ikike ojiji dị na mpụga ngwa nnwale ntọala a na-agba na sava. Nnwale omume dị n'ime ya na-anwale skriptị Alfred a chịkọtara ozugbo; ha anaghị egosipụta ndakọrịta zuru oke nke Alfred UI. Lee [nhazi nnwale, ihe a chọrọ tupu mgbe ahụ, na mpaghara nnwale](../../../tests/e2e/README.md).

## Nhazi asụsụ mpaghara

Ederede CLI nke onye ọrụ na-ahụ, onye na-agba nnwale, na ogwe menu na-abịa n'asụsụ mpaghara 45 (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) n'okpuru `locales/` site na `scripts/i18n.py` n'enweghị ngwa ndị ọzọ a dabere na ha. Nhọpụta asụsụ mpaghara na-enyocha `--lang`, wee lelee `LC_ALL`, `LC_MESSAGES`, na `LANG`, tupu ọ laghachi na `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Mmepe

Wụnye [mise](https://mise.jdx.dev/) ma jiri ụdị Python a kpọchiri na `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Nnyocha nkwenye na-ede akụkọ n'okpuru `test-results/`; skriptị nrụpụta na-ede n'ime `dist/`. Iji gbaa ngwa nnwale desktọpụ a na-agba na sava na `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

E2E desktọpụ nke mpaghara chọrọ akaụntụ nnwale pụrụ iche abanyelarị na ya na ikike ndị a kọwara na [akwụkwọ ntuziaka E2E](../../../tests/e2e/README.md). A machibidoro skriptị nkwadebe ikike nke sava naanị n'ọrụ GitHub a na-ekpochapụ mgbe e jichara ha.

Jiri [Conventional Commits](https://www.conventionalcommits.org/) ma soro [CONTRIBUTING.md](../../../CONTRIBUTING.md). E dekọrọ mgbanwe ndị e mere n'oge na-adịbeghị anya na [CHANGELOG.md](../../../CHANGELOG.md).

E dekọrọ njikwa nchekwa, nkwenye mbinye aka mbipụta, na oke Scorecard
ndị fọdụrụnụ na [nnyocha nchekwa](../../../docs/security-assessment.md).
Usoro ọrụ mbipụta na-ewu ma na-akwado ngwugwu tupu o mepụta mbipụta nwa oge,
gụnyere ihe akaebe mmalite in-toto e binyere aka na ngwugwu Sigstore a kwadoro
megide koodu commit isi na ref. Ihe akaebe mmalite ọhụrụ na-emetụta nrụpụta
usoro ọrụ ndị ahụ, ọ bụghị nbudata ochie.

## Akụkọ ihe mere eme nke ọrụ ngo na ikike ojiji

MacGTD na-ejikọta ebe nchekwa koodu mbụ bụ MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, na AlfredGTD. O nwere ikike ojiji n'okpuru [MIT License](../../../LICENSE).
