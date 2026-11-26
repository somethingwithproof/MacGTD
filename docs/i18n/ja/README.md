# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · **日本語** · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD は、普段使っているアプリのままタスクのキャプチャ、リマインダーの整理、タイマー付きのフォーカスセッションの実行を行える macOS ワークフロー集です。**

[Getting Things Done](https://gettingthingsdone.com/) に基づいて構築されており、Apple リマインダーへのダイアログ・クリップボード・一括キャプチャ、「カレンダー」へのイベント登録、Alfred 向けのタスク・ノート・プロジェクト・フォーカスコマンドを提供します。ネイティブワークフローは AppleScript と Automator によって macOS に密接に統合されています。API アダプターは Todoist API v1、Notion API 2026-03-11、Microsoft Graph v1.0、Google Keep v1 を使用します。Things および OmniFocus アダプターも含まれています。ホスト環境でのテストではローカル HTTPS フィクスチャに対して API アダプターを検証していますが、実際のサービスでの動作確認には各プロバイダーの専用アカウントが引き続き必要です。

## 主な機能

- **アプリを切り替えずにキャプチャ。** Automator サービス、Alfred キーワード、またはクリップボードを使ってタスクを追加できます。一括キャプチャでは空行以外の各行につき 1 件のリマインダーを作成します。
- **テキストを構造化されたタスクに変換。** ネイティブのクイックキャプチャとカレンダーキャプチャで共有される本番用 AppleScript パーサーを使い、相対日付や ISO 日付、時刻、優先度、コンテキスト、プロジェクトを解析します。
- **イベントの登録と受信箱のレビュー。** 時刻、所要時間、場所を指定してカレンダーイベントを作成したり、リマインダーへのブレインダンプを含む 5 ステップの週次レビューを実行したりできます。
- **タイマー付きフォーカスセッションでの作業。** プロセスをまたいでセッションの開始、状態確認、停止を行えます。セッション固有の launchd タイマーが期限切れとキャンセルを処理し、JSONL ログによって作業時間の分析が可能です。
- **タスク以外にも Alfred を活用。** プロジェクト用のリマインダーリスト作成、参照ノートの保存、レビュー用の受信箱表示、クリップボードテキストのキャプチャ、型チェック付き設定の編集ができます。
- **メニューバーから受信箱を確認。** オプションの SwiftBar/xbar プラグインにより、未完了の受信箱件数の表示とキャプチャワークフローへのリンクが利用できます。

ネイティブの動作は実際の GitHub ホスト Mac 上で確認されています。テストでは Automator ダイアログを操作し、その後リマインダーとカレンダーのレコードを読み戻して検証しています。この検証の範囲については [テストと互換性](#testing-and-compatibility) を参照してください。

## クイックスタート: Apple リマインダー

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Automator でワークフローを開いて実行すると、キャプチャを試すことができます。サービスとして利用できるようにするには、バンドルを `~/Library/Services` 配下にインストールします:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

**システム設定 → キーボード → キーボードショートカット → サービス** でショートカットを割り当てます。macOS から確認を求められたら、リマインダーへのオートメーションアクセスを許可してください。次のテキストを入力します:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

このネイティブワークフローは、期限が明日で優先度の高いリマインダーを作成し、`shopping` リストに振り分けてコンテキストを記録します。プロジェクトやコンテキストのマーカーがない場合、クイックキャプチャは `Inbox` を使用します。

## キャプチャ構文

ネイティブのタスクパーサーと Alfred のタスクキャプチャは以下のマーカーを認識します。各プロバイダーアダプターには、それぞれ独自のフィールドおよび振り分けサポートがあります。

| 入力 | 意味 | 例 |
| --- | --- | --- |
| `!1`, `!2`, `!3` | 優先度（高、中、低） | `Fix login !1` |
| `today`, `tomorrow`, `next week` | 相対的な期限日 | `Call dentist tomorrow` |
| 曜日または `next weekday` | 曜日による期限日 | `Send report next monday` |
| `due:YYYY-MM-DD` | 明示的な期限日 | `Renew membership due:2027-03-15` |
| 日付と併記した時刻 | 期限時刻 | `Call Alex tomorrow at 3pm` |
| `@context` | コンテキストマーカー | `Buy milk @errands` |
| `+project` | プロジェクト/リストへの振り分け | `Draft outline +website` |

`due:today` と `due:tomorrow` も利用できます。コンテキストマーカーおよびプロジェクトマーカーには、英数字、アンダースコア、ハイフンを使用してください。ネイティブのクイックキャプチャでは、コンテキストによる振り分けよりもプロジェクトによる振り分けが優先されます。

カレンダーキャプチャではイベントの場所の指定に `@` を使用し、分または時間単位での所要時間を受け付けます:

```text
Planning tomorrow 2pm 45m @Conference Room
```

時刻や所要時間が明示されない場合、カレンダーキャプチャは書き込み可能な最初のカレンダーに午前 9:00 開始、所要時間 1 時間で登録します。

## ワークフローの選択

### ネイティブ Apple ワークフロー

| ワークフロー | 動作 | バンドル |
| --- | --- | --- |
| クイックキャプチャ | タスクテキストを解析してリマインダーを作成 | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| クリップボードキャプチャ | クリップボードのテキストからリマインダーを作成 | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| 一括キャプチャ | 複数行のテキストからリマインダーを作成 | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| イベントキャプチャ | カレンダーイベントを作成 | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| 週次レビュー | ガイド付きレビューとリマインダーへのブレインダンプ | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

試すには Automator でバンドルを開くか、キーボードから呼び出せるように `~/Library/Services` 配下にインストールしてください。リマインダーおよびカレンダーには適切な macOS オートメーション権限が必要です。

### Alfred

Powerpack 付き Alfred が必要です。現在のソースからパッケージをビルドするには次を実行します:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

パッケージは [releases](https://github.com/somethingwithproof/MacGTD/releases) からダウンロードすることもできます。リリースパッケージはタグ付けされた時点のソースを反映しているため、リリース後に `main` に追加された機能を利用するにはソースからのビルドが必要です。

| キーワード | アクション |
| --- | --- |
| `task` | 日付、コンテキスト、プロジェクト、優先度を解析してタスクをキャプチャ |
| `note` | リマインダーに参照ノートを保存 |
| `project` | リマインダーリストを作成 |
| `gtd process` | 確認用に Inbox を開く |
| `clip` | クリップボードのテキストをキャプチャ |
| `gtd focus` | フォーカスセッションの開始、状態確認、停止 |
| `gtd analytics` | 記録されたフォーカス時間を確認 |
| `gtd preferences` | ワークフローの設定を編集 |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

設定は `~/Library/Preferences/com.alfredgtd.plist` に保存され、フォーカスの状態とログは `~/.gtd` 配下に保存されます。設定には組み込みのデフォルト値、型チェック、検証済みインポート、アトミックな書き込みが備わっています。フォーカスセッションはシステムの通知設定を変更しません。受信箱の処理はレビュー用にリストを開くだけで、タスクを自動的に移動したり完了にしたりすることはありません。

[Alfred ガイド](../../../workflows/alfred/README.md) および [GTDLib ライブラリドキュメント](../../../workflows/alfred/GTDLib.scptd/README.md) を参照してください。

### 外部キャプチャアダプター

4 つすべての API キャプチャワークフローは、ホスト環境での E2E テストにおいて実際の Automator ダイアログとローカル TLS フィクスチャを通じて検証されています。専用アカウントが設定されている場合は、別の手動スイートで実際のベンダー環境への永続化をテストします。Things および OmniFocus には、ライセンス取得済みデスクトップ統合スイートが必要です。

| 連携先 | 仕組み | セットアップ / ソース |
| --- | --- | --- |
| Todoist | API キャプチャ | [ワークフローと Keychain のセットアップ](../../../workflows/todoist/) |
| Notion | データソース API キャプチャ | [ワークフローと Keychain のセットアップ](../../../workflows/notion/) |
| Things 3 | URL スキーム | [ワークフロー](../../../workflows/things/) |
| OmniFocus | AppleScript / URL スキーム | [ワークフロー](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [ワークフロー](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [ワークフロー](../../../workflows/google/) |

API アダプターには認証情報の設定が必要です。Microsoft には委任された OAuth 認可、Google Keep には対象の Workspace アクセス権が必要です:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[API のセットアップ、移行、認可要件](../../../workflows/api/README.md) を参照してください。既存の Notion データベース ID の移行は、データソースがちょうど 1 つだけ見つかった場合にのみ実行されます。Microsoft と Google のキャプチャは、非公開のブラウザーショートカットではなく API を使用します。OAuth アクセストークンは OAuth クライアント経由で更新する必要があります。ペイロードでは明示的な JSON キー、制限付きの HTTPS リクエスト、レスポンス確認を使用します。エラーメッセージには失敗の詳細を残しつつ、設定済みの API トークンはマスクされます。セキュリティ上の問題の報告については [SECURITY.md](../../../SECURITY.md) を参照してください。

### メニューバーとショートカット

[メニューバーガイド](../../../workflows/menubar/README.md) では、オプションの SwiftBar/xbar プラグインについて説明しています。最初に Apple サービスをインストールし、次にメニューバーアプリでプラグインディレクトリを設定して `workflows/menubar/gtd-menubar.sh` をリンクしてください。

[ショートカットガイド](../../../workflows/shortcuts/README.md) では、macOS 12 以降でのテキスト、クリップボード、Siri キャプチャの手動セットアップ方法を提供しています。ショートカットと Siri 音声起動は、ホスト環境のテストスイートの対象外です。

## アーキテクチャ

Automator バンドルは AppleScript を埋め込むことでネイティブサービスとして動作します。Alfred はアクションスクリプトをパッケージ化し、ユーザー入力を引数として渡します。GTDLib は、編集可能な AppleScript ソースおよびコンパイル済みスクリプトバンドルから、共有のネイティブリマインダー操作を公開します。

- **単一の本番パーサー:** `scripts/sync-native-parser.py` が共有パーサーをクイックキャプチャとイベントキャプチャに埋め込みます。検証処理によってソースとの乖離を検出します。
- **永続的なフォーカス状態:** 別々の呼び出し間でセッション状態を共有し、専用管理の launchd ジョブと上限付きの経過時間計測を使用します。
- **再現可能なパッケージ:** パッケージングでは新しいアーカイブをビルドし、テストでその内容とソースを比較します。ライブラリには専用のコンパイルスクリプトがあります。
- **観測可能なテスト:** JUnit レポート、コマンドログ、テスト済みビルド成果物は GitHub Actions 上に 14 日間保持されます。

| ディレクトリ | 役割 |
| --- | --- |
| [`workflows/`](../../../workflows/) | ネイティブバンドル、プロバイダーアダプター、Alfred、ショートカット、メニューバースクリプト |
| [`scripts/`](../../../scripts/) | パッケージング、ライブラリのコンパイル、パーサーの同期、ホスト環境テストのプロビジョニング |
| [`tests/`](../../../tests/) | 検証、コンポーネントチェック、ネイティブデスクトップ E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI、夜間・手動 E2E、リポジトリメンテナンス |
| [`infra/`](../../../infra/) | オプションのローカルおよび EC2 Mac ランナーのセットアップ（ホスト環境の CI では不要） |

<a name="testing-and-compatibility"></a>

## テストと互換性

| 対象範囲 | 環境 | 検証内容 |
| --- | --- | --- |
| 検証 | GitHub ホストの macOS 15 および 26 | AppleScript のコンパイル、バンドル、本番パーサー、アクションターゲット、設定、フォーカス状態、フィクスチャ API トランスポート、パッケージのラウンドトリップ |
| セキュリティチェック | GitHub ホストの Ubuntu および macOS 15 | Python CodeQL、ShellCheck、コンパイル済み本番パーサーに対する制限付き Atheris ファジング |
| プロバイダーアダプター E2E | GitHub ホストの `macos-15-intel` | 4 つすべての本番 API ダイアログ、TLS トランスポート、フィクスチャの永続化と読み戻し、API 失敗、キャンセル、Notion ソース選択 |
| 実環境プロバイダー E2E | 専用シークレットを用いた GitHub ホスト Mac での手動実行 | 実際の Todoist、Notion、Microsoft、Google へのキャプチャとベンダーからの読み戻し（アカウントが不足している場合は失敗） |
| ライセンス取得済みデスクトップ統合 | 専用のローカルアカウント | Things 3、OmniFocus 4、Alfred UI の呼び出しと永続化 |
| ネイティブデスクトップ E2E | GitHub ホストの `macos-15-intel` | 実際の Automator ダイアログ、永続化されたリマインダーとカレンダーのデータ、週次レビュー、メニュー件数、コンパイル済み GTDLib、パッケージ化された Alfred ネイティブアクション、実際の launchd タイマーの期限切れとキャンセル |
| オプションの Alfred UI | 専用のローカルアカウント、Alfred 5 + Powerpack | ライセンス取得済み UI を介したワークフローのインポート、キーワード呼び出し、リマインダーの読み戻し |

[検証済みの API モダナイズ実行](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) では、**各検証プラットフォームで 35 件の検証テストと 26 件のデスクトップ E2E テスト**が失敗・エラー・スキップなしで合格しました。デスクトップテストには 15 件のネイティブテストと 11 件のプロバイダーアダプターテストが含まれており、実際のトランスポートタイムアウトや一時的な Keychain チェックもカバーしています。検証ではリポジトリ構造のチェックも実行されます。これらの結果はネイティブの動作およびプロバイダーフィクスチャを対象としており、実際のベンダー環境やライセンスアプリとの互換性を保証するものではありません。現在のステータスは上部のバッジに表示されています。

プルリクエストおよび `main` へのプッシュ時には、検証に続いてネイティブ E2E が実行されます。E2E ワークフローは夜間および手動ディスパッチでも実行され、決定論的なプロバイダーアダプターテストを含みます。実ベンダーテストには別の手動ワークフロー `live-e2e.yml` を使用します。デフォルトの CI は使い捨ての GitHub ホスト Mac、分離されたフィクスチャ、制限付きのサブプロセスを使用するため、デフォルトスイートにセルフホストランナーや外部アカウントの認証情報は不要です。手動の実環境スイートには専用のプロバイダーシークレットが必要です。

これより古い macOS バージョンは現在の CI では検証されていません。実環境プロバイダーの実行には専用シークレットが必要であり、まだ検証されていません。ショートカット/Siri およびライセンス取得済みデスクトップアプリは、デフォルトのホスト環境スイートの対象外です。ネイティブアクションテストはパッケージ化された Alfred スクリプトを直接実行するものであり、Alfred UI 全体の互換性を保証するものではありません。[テストのセットアップ、前提条件、カバレッジ](../../../tests/e2e/README.md) を参照してください。

## ローカライズ

ユーザー向けの CLI、テストランナー、メニューバーの文字列は、サードパーティ依存なしの `scripts/i18n.py` を介して `locales/` 配下の 45 ロケール（`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`）で提供されています。ロケール解決では `--lang`、次に `LC_ALL`、`LC_MESSAGES`、`LANG` の順に確認し、最終的に `en` にフォールバックします。

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## 開発

[mise](https://mise.jdx.dev/) をインストールし、`.mise.toml` で固定された Python バージョンを使用します:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

検証では `test-results/` 配下にレポートが出力され、ビルドスクリプトでは `dist/` に出力されます。`main` でホスト環境のデスクトップスイートを実行するには次を使用します:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

ローカルでのデスクトップ E2E には、専用のログイン済みテストアカウントと [E2E ガイド](../../../tests/e2e/README.md) に記載された権限が必要です。ホスト環境向けの権限プロビジョニングスクリプトは、使い捨ての GitHub ホストジョブに限定されています。

[Conventional Commits](https://www.conventionalcommits.org/) を使用し、[CONTRIBUTING.md](../../../CONTRIBUTING.md) に従ってください。最近の変更は [CHANGELOG.md](../../../CHANGELOG.md) に記録されています。

セキュリティ制御、リリース署名の検証、および残存する Scorecard の制限事項については [セキュリティ評価](../../../docs/security-assessment.md) に記載されています。リリースワークフローは、ドラフトリリースを作成する前にパッケージをビルドしてアテステーションを付与します。これには、ソースコミットおよび ref に対して検証される署名付き in-toto プロベナンスと Sigstore バンドルが含まれます。新しいプロベナンスはこれらのワークフロービルドに適用され、過去のダウンロードには適用されません。

## プロジェクトの沿革とライセンス

MacGTD は、旧 MacGTD-Native、MacGTD-Microsoft、MacGTD-Google、および AlfredGTD の各リポジトリを統合したものです。[MIT License](../../../LICENSE) の下でライセンスされています。
