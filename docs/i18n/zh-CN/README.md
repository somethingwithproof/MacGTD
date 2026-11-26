# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · **简体中文** · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD 是一套 macOS 工作流合集，帮助你借助已在使用的应用收集任务、整理提醒事项，并运行定时专注会话。**

它围绕 [Getting Things Done](https://gettingthingsdone.com/) 方法构建，为 Apple 提醒事项带来对话框、剪贴板和批量收集功能，为“日历”带来日程收集功能，并为 Alfred 提供任务、笔记、项目与专注命令。AppleScript 和 Automator 让原生工作流与 macOS 深度贴合。API 适配器使用 Todoist API v1、Notion API 2026-03-11、Microsoft Graph v1.0 和 Google Keep v1，同时还包含 Things 与 OmniFocus 适配器。托管测试会针对本地 HTTPS 测试夹具验证这些 API 适配器；实际线上兼容性仍需专用的服务商账号。

## 主要功能

- **无需切换应用即可收集。** 通过 Automator 服务、Alfred 关键词或剪贴板添加任务。批量收集会为每个非空行创建一条提醒事项。
- **将文本转为结构化任务。** 使用原生快速收集与日历收集共用的生产级 AppleScript 解析器，解析相对日期与 ISO 日期、时间、优先级、情境和项目。
- **收集日程并回顾收件箱。** 创建带有时间、时长和地点的日历日程；运行五步每周回顾，并将头脑风暴内容清空录入提醒事项。
- **开展定时专注会话。** 跨进程启动、查看和停止会话。会话专属的 launchd 定时器负责处理到期与取消，JSONL 日志提供时长分析数据。
- **用 Alfred 完成更多操作。** 为项目创建提醒事项列表、保存参考笔记、打开收件箱进行回顾、收集剪贴板文本，以及编辑带类型校验的偏好设置。
- **在菜单栏查看收件箱。** 可选的 SwiftBar/xbar 插件会显示未完成收件箱事项数量，并提供前往收集工作流的快捷入口。

原生行为会在真实的 GitHub 托管 Mac 上接受检查：测试会操作 Automator 对话框，然后回读“提醒事项”与“日历”中的记录。关于这些验证范围的说明，请参阅[测试与兼容性](#testing-and-compatibility)。

## 快速开始：Apple 提醒事项

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

在 Automator 中打开工作流并运行，即可试用收集功能。如需将其作为系统“服务”使用，请将该工作流包安装到 `~/Library/Services` 目录下：

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

在**系统设置 → 键盘 → 键盘快捷键 → 服务**中为其分配快捷键。当 macOS 弹出提示时，允许其通过“自动化”访问“提醒事项”。输入以下内容：

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

原生工作流会创建一条明天到期的高优先级提醒事项，将其归入 `shopping` 列表，并记录情境信息。若未指定项目或情境标记，快速收集将默认使用 `Inbox`。

## 收集语法

原生任务解析器和 Alfred 任务收集都会识别以下标记。各服务商适配器各自支持不同的字段与路由规则。

| 输入 | 含义 | 示例 |
| --- | --- | --- |
| `!1`、`!2`、`!3` | 高、中或低优先级 | `Fix login !1` |
| `today`、`tomorrow`、`next week` | 相对截止日期 | `Call dentist tomorrow` |
| 星期几或 `next weekday` | 按星期的截止日期 | `Send report next monday` |
| `due:YYYY-MM-DD` | 显式指定截止日期 | `Renew membership due:2027-03-15` |
| 日期旁附加时间 | 截止时间 | `Call Alex tomorrow at 3pm` |
| `@context` | 情境标记 | `Buy milk @errands` |
| `+project` | 项目/列表路由 | `Draft outline +website` |

同样支持 `due:today` 和 `due:tomorrow`。情境和项目标记中请使用字母、数字、下划线或连字符。在原生快速收集中，项目路由的优先级高于情境路由。

日历收集使用 `@` 指定日程地点，并支持以分钟或小时为单位指定时长：

```text
Planning tomorrow 2pm 45m @Conference Room
```

如果未显式指定时间或时长，日历收集默认使用上午 9:00 和一小时时长，并写入第一个可写日历。

## 选择工作流

### 原生 Apple 工作流

| 工作流 | 行为 | 工作流包 |
| --- | --- | --- |
| 快速收集 | 解析任务文本并创建提醒事项 | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| 剪贴板收集 | 根据剪贴板文本创建提醒事项 | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| 批量收集 | 从多行文本批量创建提醒事项 | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| 日程收集 | 创建“日历”日程 | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| 每周回顾 | 引导式回顾与提醒事项头脑风暴录入 | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

可在 Automator 中打开工作流包直接试用，或安装到 `~/Library/Services` 目录下以通过快捷键调用。“提醒事项”和“日历”均需要相应的 macOS 自动化权限。

### Alfred

需要带有 Powerpack 的 Alfred。从当前源码构建安装包：

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

你也可以从 [releases](https://github.com/somethingwithproof/MacGTD/releases) 下载安装包。发布包对应其打标时的源码；某次发布之后合入 `main` 的新功能需要从源码构建。

| 关键词 | 操作 |
| --- | --- |
| `task` | 收集任务，支持日期、情境、项目与优先级解析 |
| `note` | 在“提醒事项”中保存参考笔记 |
| `project` | 创建提醒事项列表 |
| `gtd process` | 打开收件箱以便人工回顾处理 |
| `clip` | 收集剪贴板文本 |
| `gtd focus` | 启动专注会话、查看状态或停止会话 |
| `gtd analytics` | 查看已记录的专注时长统计 |
| `gtd preferences` | 编辑工作流偏好设置 |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

偏好设置保存在 `~/Library/Preferences/com.alfredgtd.plist`；专注状态和日志保存在 `~/.gtd` 目录下。偏好设置具备内置默认值、类型检查、导入校验和原子写入机制。专注会话不会修改系统通知设置。收件箱处理操作仅打开列表供回顾，不会自动移动或完成任务。

请参阅 [Alfred 指南](../../../workflows/alfred/README.md) 和 [GTDLib 库文档](../../../workflows/alfred/GTDLib.scptd/README.md)。

### 外部收集适配器

所有四个 API 收集工作流都在托管端到端测试（E2E）中通过真实的 Automator 对话框与本地 TLS 测试夹具进行了验证。在配置专用账号后，还有一套独立的手动测试套件用于验证真实服务商的持久化写入。Things 和 OmniFocus 则需要通过已授权的桌面集成测试套件进行测试。

| 目标应用 | 实现机制 | 配置 / 源码 |
| --- | --- | --- |
| Todoist | API 收集 | [工作流与钥匙串配置](../../../workflows/todoist/) |
| Notion | 数据源 API 收集 | [工作流与钥匙串配置](../../../workflows/notion/) |
| Things 3 | URL Scheme | [工作流](../../../workflows/things/) |
| OmniFocus | AppleScript / URL Scheme | [工作流](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [工作流](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [工作流](../../../workflows/google/) |

API 适配器需要先完成凭据配置；Microsoft 需要委托 OAuth 授权，Google Keep 则需要具备相应权限的 Workspace 访问资格：

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

请参阅 [API 配置、迁移与授权要求](../../../workflows/api/README.md)。仅当找到唯一一个数据源时，现有的 Notion 数据库 ID 才会迁移。Microsoft 和 Google 收集通过官方 API 实现，而非未公开的浏览器快捷方式。OAuth 访问令牌需要通过你的 OAuth 客户端进行续期。请求载荷使用显式 JSON 键、带边界限制的 HTTPS 请求以及响应确认机制。错误信息在保留失败详情的同时，会对已配置的 API 令牌进行脱敏处理。如需报告安全问题，请参阅 [SECURITY.md](../../../SECURITY.md)。

### 菜单栏与快捷指令

[菜单栏指南](../../../workflows/menubar/README.md)介绍了可选的 SwiftBar/xbar 插件。请先安装 Apple 服务，然后在菜单栏应用中配置插件目录，并将 `workflows/menubar/gtd-menubar.sh` 链接到该目录中。

[快捷指令指南](../../../workflows/shortcuts/README.md)提供了在 macOS 12+ 上手动配置文本、剪贴板和 Siri 收集的步骤。快捷指令和 Siri 语音触发不在托管测试套件的覆盖范围内。

## 架构

Automator 工作流包内嵌 AppleScript，使其能够作为原生系统“服务”运行。Alfred 打包了操作脚本，并将用户输入作为参数传入。GTDLib 通过可编辑的 AppleScript 源码和已编译的脚本包对外提供共享的原生“提醒事项”操作能力。

- **单一生产解析器：** `scripts/sync-native-parser.py` 将共享解析器嵌入到快速收集和日程收集中；校验流程会检测源码漂移。
- **持久化专注状态：** 多次独立调用之间共享会话状态，并配有专属的 launchd 作业和带边界限制的已用时长统计。
- **可复现的构建包：** 打包流程会构建全新的归档文件，测试会将其内容与源码进行比对。该库还配有独立的编译脚本。
- **可观测的测试：** JUnit 测试报告、命令日志以及经过测试的构建产物会在 GitHub Actions 中保留 14 天。

| 目录 | 职责 |
| --- | --- |
| [`workflows/`](../../../workflows/) | 原生工作流包、服务商适配器、Alfred、快捷指令与菜单栏脚本 |
| [`scripts/`](../../../scripts/) | 打包、库编译、解析器同步以及托管测试环境准备 |
| [`tests/`](../../../tests/) | 校验、组件检查以及原生桌面端到端测试 |
| [`.github/workflows/`](../../../.github/workflows/) | CI、每日定时/手动端到端测试以及仓库维护 |
| [`infra/`](../../../infra/) | 可选的本地及 EC2 Mac 运行器配置；托管 CI 无需使用 |

## 测试与兼容性

| 范围 | 环境 | 检查内容 |
| --- | --- | --- |
| 校验 | GitHub 托管 macOS 15 与 26 | AppleScript 编译、工作流包、生产解析器、操作目标、偏好设置、专注状态、夹具 API 传输以及打包往返一致性 |
| 安全检查 | GitHub 托管 Ubuntu 与 macOS 15 | Python CodeQL、ShellCheck，以及针对已编译生产解析器的有界 Atheris 模糊测试 |
| 服务商适配器 E2E | GitHub 托管 `macos-15-intel` | 全部四个生产级 API 对话框、TLS 传输、夹具持久化/回读、API 故障、取消操作及 Notion 数据源选择 |
| 线上服务商 E2E | 使用专用密钥手动触发的 GitHub 托管 Mac | 真实的 Todoist、Notion、Microsoft 与 Google 收集及服务商端回读；若缺少账号则测试失败 |
| 授权桌面应用集成 | 专用本地账号 | Things 3、OmniFocus 4 和 Alfred UI 的调用与持久化 |
| 原生桌面 E2E | GitHub 托管 `macos-15-intel` | 真实 Automator 对话框；“提醒事项”与“日历”数据持久化；每周回顾；菜单栏计数；已编译的 GTDLib；打包后的 Alfred 原生操作；真实的 launchd 定时器到期与取消 |
| 可选 Alfred UI | 专用本地账号，Alfred 5 + Powerpack | 通过已授权的 UI 完成工作流导入、关键词调用与提醒事项回读 |

[已验证的 API 现代化改造运行](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916)在**每个校验平台上通过了 35 项校验测试，并通过了 26 项桌面 E2E 测试**，零失败、零错误、零跳过。桌面测试涵盖 15 项原生测试和 11 项服务商适配器测试，其中包括真实的传输超时和瞬态钥匙串检查。校验阶段还会执行仓库结构检查。这些结果覆盖了原生行为与服务商测试夹具，并不代表已验证线上服务商或授权应用的实际兼容性。当前运行状态如上方徽章所示。

向 `main` 提交 Pull Request 或推送代码时，会先运行校验流程，再运行原生 E2E 测试。E2E 工作流还会在每日定时以及手动触发时运行，其中包括确定性的服务商适配器测试。线上服务商测试使用独立的手动工作流 `live-e2e.yml`。默认 CI 使用一次性 GitHub 托管 Mac、隔离的测试夹具以及有界子进程；运行默认测试套件无需自托管运行器或外部账号凭据。手动线上测试套件则需要专用的服务商密钥。

当前 CI 不对更早版本的 macOS 进行校验。线上服务商测试需要专用密钥，目前尚未经过验证。快捷指令/Siri 以及授权桌面应用不在默认托管测试套件范围内。原生操作测试直接调用打包后的 Alfred 脚本，因此并不能证明与 Alfred UI 的完全兼容性。请参阅[测试配置、前置条件与覆盖范围](../../../tests/e2e/README.md)。

## 本地化

面向用户的 CLI、测试运行器及菜单栏字符串内置 45 种语言环境（`en`、`de`、`es`、`fr`、`it`、`pt-BR`、`nl`、`ru`、`uk`、`ja`、`ko`、`zh-CN`、`zh-TW`、`ar`、`hi`、`pl`、`tr`、`sv`、`vi`、`id`、`af-ZA`、`am-ET`、`ar-EG`、`ar-MA`、`fr-MA`、`fr-SN`、`ha-NG`、`ig-NG`、`mg-MG`、`rw-RW`、`so-SO`、`sw-KE`、`xh-ZA`、`yo-NG`、`zu-ZA`、`bn`、`fa`、`he`、`mr`、`ta`、`te`、`th`、`ur`、`ms`、`fil`），存放在 `locales/` 目录下，并通过零第三方依赖的 `scripts/i18n.py` 提供支持。语言环境解析顺序为依次检查 `--lang`、`LC_ALL`、`LC_MESSAGES` 和 `LANG`，最终回退到 `en`。

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## 开发

安装 [mise](https://mise.jdx.dev/) 并使用 `.mise.toml` 中固定的 Python 版本：

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

校验流程会将报告写入 `test-results/`；构建脚本会输出至 `dist/`。如需在 `main` 分支上运行托管桌面测试套件：

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

本地桌面 E2E 测试需要一个专用的已登录测试账号，以及 [E2E 指南](../../../tests/e2e/README.md)中所述的权限。托管权限配置脚本仅限用于一次性的 GitHub 托管任务。

请遵循 [Conventional Commits](https://www.conventionalcommits.org/) 规范及 [CONTRIBUTING.md](../../../CONTRIBUTING.md)。近期变更记录在 [CHANGELOG.md](../../../CHANGELOG.md) 中。

安全控制措施、发布签名验证以及其余 Scorecard 限制均记录在[安全评估](../../../docs/security-assessment.md)中。发布工作流会在创建草稿发布前完成构建包生成与认证，其中包括对照源码提交与引用验证的已签名 in-toto 来源证明及 Sigstore 捆绑包。新的来源证明仅适用于通过该工作流构建的产物，不适用于较早期的下载文件。

## 项目历史与许可证

MacGTD 整合了此前的 MacGTD-Native、MacGTD-Microsoft、MacGTD-Google 和 AlfredGTD 仓库，并依据 [MIT 许可证](../../../LICENSE)授权发布。
