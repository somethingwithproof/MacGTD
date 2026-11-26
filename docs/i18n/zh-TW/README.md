# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · **繁體中文** · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD 是一套 macOS 工作流程工具集，讓你能使用現有的應用程式擷取任務、整理提醒事項，並執行計時專注時段。**

本專案以 [Getting Things Done](https://gettingthingsdone.com/) 為核心理念，為 Apple 提醒事項帶來對話框、剪貼簿與批次擷取功能；為「行事曆」提供事件擷取；並為 Alfred 加入任務、筆記、專案與專注指令。透過 AppleScript 與 Automator，原生工作流程能緊密整合 macOS。API 配接器採用 Todoist API v1、Notion API 2026-03-11、Microsoft Graph v1.0 與 Google Keep v1，同時亦內建 Things 與 OmniFocus 配接器。雲端託管測試會使用本機 HTTPS 測試夾具驗證 API 配接器；實際線上環境的相容性仍需搭配專用的服務供應商帳號進行測試。

## 功能特色

- **無需切換應用程式即可擷取任務。** 可透過 Automator 服務、Alfred 關鍵字或剪貼簿新增任務。批次擷取功能會為每一行非空白文字建立一筆提醒事項。
- **將純文字轉換為結構化任務。** 使用原生快速擷取與行事曆擷取共用的正式環境 AppleScript 解析器，自動解析相對日期、ISO 日期、時間、優先順序、情境與專案。
- **擷取行事曆事件並檢視收件匣。** 建立包含時間、持續時間與地點的「行事曆」事件；執行包含五個步驟的每週檢視，並將思緒清空紀錄直接寫入「提醒事項」。
- **在計時專注時段中工作。** 可跨程序啟動、檢視與停止專注時段。由工作時段擁有的 launchd 計時器負責處理到期與取消；JSONL 日誌則提供時長統計分析。
- **發揮 Alfred 超越任務管理的能力。** 為專案建立「提醒事項」列表、儲存參考筆記、開啟收件匣進行檢視、擷取剪貼簿文字，以及編輯具備型別檢查的偏好設定。
- **從選單列掌握收件匣狀態。** 選用的 SwiftBar/xbar 外掛程式可顯示收件匣中未完成項目的數量，並提供快速存取各擷取工作流程的連結。

原生行為皆在真實的 GitHub 託管 Mac 環境中進行檢查：測試會操作 Automator 對話框，接著讀回「提醒事項」與「行事曆」的紀錄。有關驗證涵蓋範圍的詳細說明，請參閱[測試與相容性](#testing-and-compatibility)。

## 快速開始：Apple 提醒事項

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

在 Automator 中開啟工作流程並執行，即可試用擷取功能。若要將其作為「服務」使用，請將套組安裝至 `~/Library/Services` 目錄下：

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

前往 **系統設定 → 鍵盤 → 鍵盤快速鍵 → 服務** 指派快速鍵。當 macOS 跳出提示時，請允許「自動化」存取「提醒事項」。接著輸入：

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

原生工作流程會建立一筆明天到期的高優先順序提醒事項，將其分類至 `shopping` 列表，並記錄對應的情境。若未指定專案或情境標記，快速擷取預設會使用 `Inbox`。

## 擷取語法

原生任務解析器與 Alfred 任務擷取功能皆可辨識下列標記。各服務供應商配接器則依其支援情況提供各自的欄位與分類路由功能。

| 輸入 | 意義 | 範例 |
| --- | --- | --- |
| `!1`、`!2`、`!3` | 高、中或低優先順序 | `Fix login !1` |
| `today`、`tomorrow`、`next week` | 相對到期日 | `Call dentist tomorrow` |
| 星期幾或 `next weekday` | 指定星期幾的到期日 | `Send report next monday` |
| `due:YYYY-MM-DD` | 明確指定到期日 | `Renew membership due:2027-03-15` |
| 搭配日期使用的時間 | 到期時間 | `Call Alex tomorrow at 3pm` |
| `@context` | 情境標記 | `Buy milk @errands` |
| `+project` | 專案／列表分類 | `Draft outline +website` |

系統亦支援 `due:today` 與 `due:tomorrow`。情境與專案標記中可使用英文字母、數字、底線或連字號。在原生快速擷取中，專案分類的優先權高於情境分類。

行事曆擷取會使用 `@` 來指定活動地點，並接受以分鐘或小時為單位的持續時間：

```text
Planning tomorrow 2pm 45m @Conference Room
```

若未明確指定時間或持續時間，行事曆擷取預設會使用上午 9:00 與一小時的長度，並建立於第一個可寫入的行事曆中。

## 選擇工作流程

### 原生 Apple 工作流程

| 工作流程 | 行為 | 套組 |
| --- | --- | --- |
| 快速擷取 | 解析任務文字並建立提醒事項 | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| 剪貼簿擷取 | 從剪貼簿文字建立提醒事項 | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| 批次擷取 | 從多行文字建立多筆提醒事項 | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| 事件擷取 | 建立行事曆事件 | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| 每週檢視 | 引導式檢視與提醒事項思緒清空 | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

在 Automator 中開啟套組即可試用，或將其安裝至 `~/Library/Services` 以透過鍵盤快速鍵呼叫。「提醒事項」與「行事曆」需要對應的 macOS 自動化權限。

### Alfred

需要搭配具備 Powerpack 的 Alfred。請從目前原始碼建置套件：

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

你也可以從[發行版本頁面](https://github.com/somethingwithproof/MacGTD/releases)下載套件。發行套件對應其標籤版本的原始碼；若要使用在發行後才新增至 `main` 的功能，則需自行從原始碼建置。

| 關鍵字 | 動作 |
| --- | --- |
| `task` | 擷取任務並解析日期、情境、專案與優先順序 |
| `note` | 在「提醒事項」中儲存參考筆記 |
| `project` | 建立「提醒事項」列表 |
| `gtd process` | 開啟收件匣以供人工檢視 |
| `clip` | 擷取剪貼簿文字 |
| `gtd focus` | 啟動專注時段、檢視狀態或停止計時 |
| `gtd analytics` | 檢視已記錄的專注時長 |
| `gtd preferences` | 編輯工作流程偏好設定 |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

偏好設定儲存於 `~/Library/Preferences/com.alfredgtd.plist`；專注狀態與日誌則位於 `~/.gtd` 目錄下。偏好設定具備內建預設值、型別檢查、匯入驗證與原子寫入機制。專注時段不會變更系統通知設定。收件匣處理功能僅會開啟列表供你檢視，不會自動移動或完成任務。

請參閱 [Alfred 使用指南](../../../workflows/alfred/README.md)與 [GTDLib 程式庫文件](../../../workflows/alfred/GTDLib.scptd/README.md)。

### 外部擷取配接器

在託管的 E2E 測試中，四個 API 擷取工作流程皆會透過真實的 Automator 對話框與本機 TLS 測試夾具進行驗證。當設定好專用帳號後，另有獨立的手動測試套件可驗證真實供應商端點的資料持久性。Things 與 OmniFocus 則需使用已授權的桌面整合測試套件。

| 目標平台 | 運作機制 | 設定／原始碼 |
| --- | --- | --- |
| Todoist | API 擷取 | [工作流程與鑰匙圈設定](../../../workflows/todoist/) |
| Notion | 資料來源 API 擷取 | [工作流程與鑰匙圈設定](../../../workflows/notion/) |
| Things 3 | URL scheme | [工作流程](../../../workflows/things/) |
| OmniFocus | AppleScript / URL scheme | [工作流程](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [工作流程](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [工作流程](../../../workflows/google/) |

API 配接器需要設定憑證；Microsoft 需要委派式 OAuth 授權，而 Google Keep 則需要符合資格的 Workspace 存取權限：

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

請參閱[API 設定、遷移與授權需求](../../../workflows/api/README.md)。現有的 Notion 資料庫 ID 僅在找到剛好一個資料來源時才會進行遷移。Microsoft 與 Google 擷取均透過正式 API 運作，而非未公開的瀏覽器捷徑。OAuth 存取權杖需透過你的 OAuth 用戶端進行更新。傳送的酬載採用明確的 JSON 鍵值、有限制的 HTTPS 請求與回應確認機制。錯誤訊息會保留失敗詳細資訊，同時遮罩已設定的 API 權杖。如需回報安全性問題，請參閱 [SECURITY.md](../../../SECURITY.md)。

### 選單列與「捷徑」

[選單列使用指南](../../../workflows/menubar/README.md)說明了選用的 SwiftBar/xbar 外掛程式設定方式。請先安裝 Apple 服務，接著在選單列應用程式中設定外掛程式目錄，並將 `workflows/menubar/gtd-menubar.sh` 連結至該目錄。

[捷徑使用指南](../../../workflows/shortcuts/README.md)提供 macOS 12+ 上文字、剪貼簿與 Siri 擷取的手動設定步驟。「捷徑」與 Siri 語音觸發不在雲端託管測試套件的涵蓋範圍內。

## 架構

Automator 套組內嵌 AppleScript，使其能作為原生「服務」執行。Alfred 則封裝動作指令碼並將使用者輸入作為引數傳入。GTDLib 透過可編輯的 AppleScript 原始碼與已編譯的指令碼套組，提供共用的原生「提醒事項」操作介面。

- **單一正式環境解析器：** `scripts/sync-native-parser.py` 會將共用的解析器內嵌至快速擷取與事件擷取中；驗證流程會偵測原始碼是否產生偏移。
- **持久性專注狀態：** 各次獨立呼叫之間可共享工作時段狀態，並搭配專屬於該時段的 launchd 工作與受限的經過時間計算機制。
- **可重現的套件建置：** 封裝腳本會建立全新的封存檔，且測試會將其內容與原始碼進行比對。程式庫另有獨立的編譯指令碼。
- **可觀測的測試結果：** JUnit 報告、指令日誌與通過測試的建置產物會在 GitHub Actions 中保留 14 天。

| 目錄 | 職責 |
| --- | --- |
| [`workflows/`](../../../workflows/) | 原生套組、服務供應商配接器、Alfred、捷徑與選單列指令碼 |
| [`scripts/`](../../../scripts/) | 套件封裝、程式庫編譯、解析器同步與託管測試環境佈建 |
| [`tests/`](../../../tests/) | 驗證測試、元件檢查與原生桌面 E2E 測試 |
| [`.github/workflows/`](../../../.github/workflows/) | CI、每日夜間／手動 E2E 測試與儲存庫維護 |
| [`infra/`](../../../infra/) | 選用的本機與 EC2 Mac 執行器設定；託管 CI 不需要此目錄 |

<a name="testing-and-compatibility"></a>

## 測試與相容性

| 範圍 | 環境 | 檢查項目 |
| --- | --- | --- |
| 驗證測試 | GitHub 託管的 macOS 15 與 26 | AppleScript 編譯、套組、正式環境解析器、動作目標、偏好設定、專注狀態、測試夾具 API 傳輸與套件往返驗證 |
| 安全性檢查 | GitHub 託管的 Ubuntu 與 macOS 15 | Python CodeQL、ShellCheck，以及針對已編譯正式環境解析器的有限度 Atheris 模糊測試 |
| 服務供應商配接器 E2E | GitHub 託管的 `macos-15-intel` | 全部四個正式環境 API 對話框、TLS 傳輸、測試夾具寫入與讀回、API 失敗處理、取消操作與 Notion 資料來源選擇 |
| 即時服務供應商 E2E | 搭配專用密鑰手動觸發的 GitHub 託管 Mac 執行 | 真實的 Todoist、Notion、Microsoft 與 Google 擷取及供應商讀回；若缺少帳號設定則會失敗 |
| 已授權桌面整合測試 | 專用本機帳號 | Things 3、OmniFocus 4 與 Alfred UI 呼叫及資料持久性 |
| 原生桌面 E2E | GitHub 託管的 `macos-15-intel` | 真實 Automator 對話框；已寫入的提醒事項與行事曆資料；每週檢視；選單計數；已編譯的 GTDLib；封裝的 Alfred 原生動作；真實 launchd 計時器到期與取消 |
| 選用 Alfred UI | 專用本機帳號，Alfred 5 + Powerpack | 工作流程匯入、關鍵字呼叫，以及透過已授權 UI 讀回提醒事項 |

[已驗證的 API 現代化執行紀錄](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916)在**每個驗證平台上通過 35 項驗證測試以及 26 項桌面 E2E 測試**，無任何失敗、錯誤或略過。桌面測試涵蓋 15 項原生測試與 11 項服務供應商配接器測試，包含實際的傳輸逾時與暫時性鑰匙圈檢查。驗證流程亦會執行儲存庫結構檢查。這些結果僅涵蓋原生行為與供應商測試夾具，並不代表真實線上供應商或已授權應用程式的相容性。目前狀態請見上方徽章。

建立 Pull Request 與推送至 `main` 時，會依序執行驗證測試與原生 E2E 測試。E2E 工作流程亦會於每日夜間及手動觸發時執行，其中包含具決定性的服務供應商配接器測試。即時供應商測試則使用獨立的手動 `live-e2e.yml` 工作流程。預設 CI 使用可拋棄式的 GitHub 託管 Mac、隔離的測試夾具與受限的子程序；執行預設測試套件不需要自架執行器或外部帳號憑證。手動即時測試套件則需要專用的服務供應商密鑰。

目前的 CI 尚未驗證較早版本的 macOS。即時服務供應商測試需要專用密鑰，目前尚未完成驗證。「捷徑」/ Siri 與已授權的桌面應用程式皆不在預設託管測試套件的範圍內。原生動作測試會直接執行已封裝的 Alfred 指令碼，並不代表完整的 Alfred UI 相容性。請參閱[測試設定、先決條件與涵蓋範圍](../../../tests/e2e/README.md)。

## 在地化

使用者介面的 CLI、測試執行器與選單列字串透過 `scripts/i18n.py` 以零第三方相依性的方式提供 45 種語系（`en`、`de`、`es`、`fr`、`it`、`pt-BR`、`nl`、`ru`、`uk`、`ja`、`ko`、`zh-CN`、`zh-TW`、`ar`、`hi`、`pl`、`tr`、`sv`、`vi`、`id`、`af-ZA`、`am-ET`、`ar-EG`、`ar-MA`、`fr-MA`、`fr-SN`、`ha-NG`、`ig-NG`、`mg-MG`、`rw-RW`、`so-SO`、`sw-KE`、`xh-ZA`、`yo-NG`、`zu-ZA`、`bn`、`fa`、`he`、`mr`、`ta`、`te`、`th`、`ur`、`ms`、`fil`），存放於 `locales/` 目錄下。語系解析順序會先檢查 `--lang`，接著依序檢查 `LC_ALL`、`LC_MESSAGES` 與 `LANG`，若皆未設定則退回使用 `en`。

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## 開發

安裝 [mise](https://mise.jdx.dev/) 並使用 `.mise.toml` 中指定的 Python 版本：

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

驗證測試會將報告寫入 `test-results/`；建置指令碼則會輸出至 `dist/`。若要在 `main` 上執行託管桌面測試套件：

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

本機桌面 E2E 測試需要專用的已登入測試帳號，以及 [E2E 指南](../../../tests/e2e/README.md)中所述的權限。託管環境的權限佈建指令碼僅限用於可拋棄式的 GitHub 託管作業。

請遵循 [Conventional Commits](https://www.conventionalcommits.org/) 規範並參閱 [CONTRIBUTING.md](../../../CONTRIBUTING.md)。近期變更記錄於 [CHANGELOG.md](../../../CHANGELOG.md)。

安全性控制措施、發行版簽章驗證與剩餘的 Scorecard 限制皆記錄於[安全性評估報告](../../../docs/security-assessment.md)。發行工作流程會在建立草稿發行版前建置套件並產生證明，包含經簽署的 in-toto 來源證明以及針對原始碼提交與參照驗證的 Sigstore 套組。新的來源證明僅適用於透過該工作流程建置的版本，不適用於較早期的下載檔案。

## 專案歷史與授權條款

MacGTD 整合了先前的 MacGTD-Native、MacGTD-Microsoft、MacGTD-Google 與 AlfredGTD 儲存庫，並採用 [MIT 授權條款](../../../LICENSE)釋出。
