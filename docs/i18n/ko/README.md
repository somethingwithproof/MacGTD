# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · **한국어** · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD는 이미 사용 중인 앱으로 작업을 캡처하고, 미리 알림을 정리하며, 시간 지정 집중 세션을 실행하기 위한 macOS 워크플로 모음입니다.**

[Getting Things Done](https://gettingthingsdone.com/) 방법론을 기반으로 설계되었으며, Apple Reminders에는 대화상자, 클립보드, 일괄 캡처 기능을, Calendar에는 이벤트 캡처 기능을, Alfred에는 작업, 메모, 프로젝트 및 집중 명령을 제공합니다. AppleScript와 Automator를 통해 네이티브 워크플로를 macOS에 밀착하여 통합했습니다. API 어댑터는 Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, Google Keep v1을 사용합니다. Things 및 OmniFocus 어댑터도 포함되어 있습니다. 호스팅 테스트는 로컬 HTTPS 픽스처(fixture)를 대상으로 API 어댑터를 검증하며, 실제 라이브 호환성을 확인하려면 각 공급자의 전용 계정이 필요합니다.

## 주요 기능

- **앱을 전환하지 않고 캡처하세요.** Automator 서비스, Alfred 키워드 또는 클립보드를 사용하여 작업을 추가할 수 있습니다. 일괄 캡처는 비어 있지 않은 각 줄마다 미리 알림을 하나씩 생성합니다.
- **텍스트를 구조화된 작업으로 변환하세요.** 네이티브 빠른 캡처와 Calendar 캡처가 공유하는 프로덕션 AppleScript 파서를 사용하여 상대 날짜와 ISO 날짜, 시간, 우선순위, 컨텍스트, 프로젝트를 파싱합니다.
- **이벤트를 캡처하고 받은 편지함을 검토하세요.** 시간, 기간, 위치를 지정하여 Calendar 이벤트를 생성하고, Reminders로 브레인 덤프를 수행하는 5단계 주간 리뷰를 실행할 수 있습니다.
- **시간 지정 집중 세션으로 작업하세요.** 여러 프로세스 간에 세션을 시작, 확인, 중지할 수 있습니다. 세션이 소유한 launchd 타이머가 만료 및 취소를 처리하며, JSONL 로그는 지속 시간 분석 데이터를 제공합니다.
- **작업 관리 이상으로 Alfred를 활용하세요.** 프로젝트용 Reminders 목록을 생성하고, 참고 메모를 저장하며, 검토를 위해 Inbox를 열고, 클립보드 텍스트를 캡처하고, 타입이 지정된 환경설정을 편집할 수 있습니다.
- **메뉴 막대에서 받은 편지함을 확인하세요.** 선택 사항인 SwiftBar/xbar 플러그인은 미완료 Inbox 항목 수를 표시하고 캡처 워크플로로 연결해 줍니다.

네이티브 동작은 실제 GitHub 호스팅 Mac에서 검증됩니다. 테스트가 Automator 대화상자를 직접 조작한 뒤 Reminders와 Calendar 레코드를 다시 읽어 확인합니다. 해당 검증 범위는 [테스트 및 호환성](#테스트-및-호환성)을 참고하세요.

## 빠른 시작: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Automator에서 워크플로를 열어 실행하면 캡처를 시험해 볼 수 있습니다. 서비스(Service)로 사용하려면 `~/Library/Services` 아래에 번들을 설치하세요:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

**시스템 설정 → 키보드 → 키보드 단축키 → 서비스**에서 단축키를 지정하세요. macOS가 요청하면 Reminders에 대한 자동화(Automation) 접근을 허용하세요. 다음 내용을 입력합니다:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

네이티브 워크플로는 내일이 마감인 높은 우선순위 미리 알림을 생성하고, 이를 `shopping` 목록으로 라우팅하며 컨텍스트를 기록합니다. 프로젝트나 컨텍스트 마커가 없으면 빠른 캡처는 `Inbox`를 사용합니다.

## 캡처 구문

네이티브 작업 파서와 Alfred 작업 캡처는 다음 마커들을 인식합니다. 각 공급자 어댑터는 자체 필드 및 라우팅 지원 범위를 가집니다.

| 입력 | 의미 | 예시 |
| --- | --- | --- |
| `!1`, `!2`, `!3` | 높음, 보통, 낮음 우선순위 | `Fix login !1` |
| `today`, `tomorrow`, `next week` | 상대 마감일 | `Call dentist tomorrow` |
| 요일 또는 `next weekday` | 요일 기준 마감일 | `Send report next monday` |
| `due:YYYY-MM-DD` | 명시적 마감일 | `Renew membership due:2027-03-15` |
| 날짜와 함께 입력한 시간 | 마감 시간 | `Call Alex tomorrow at 3pm` |
| `@context` | 컨텍스트 마커 | `Buy milk @errands` |
| `+project` | 프로젝트/목록 라우팅 | `Draft outline +website` |

`due:today`와 `due:tomorrow`도 허용됩니다. 컨텍스트 및 프로젝트 마커에는 문자, 숫자, 밑줄 또는 하이픈을 사용하세요. 네이티브 빠른 캡처에서는 프로젝트 라우팅이 컨텍스트 라우팅보다 우선합니다.

Calendar 캡처는 이벤트 위치에 `@`를 사용하며 분 또는 시간 단위의 기간을 지원합니다:

```text
Planning tomorrow 2pm 45m @Conference Room
```

시간이나 기간을 명시하지 않으면 Calendar 캡처는 쓰기 가능한 첫 번째 캘린더에 오전 9:00와 1시간 기본값을 사용합니다.

## 워크플로 선택

### 네이티브 Apple 워크플로

| 워크플로 | 동작 | 번들 |
| --- | --- | --- |
| 빠른 캡처 | 작업 텍스트를 파싱하여 미리 알림 생성 | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| 클립보드 캡처 | 클립보드 텍스트로 미리 알림 생성 | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| 일괄 캡처 | 여러 줄에서 여러 개의 미리 알림 생성 | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| 이벤트 캡처 | Calendar 이벤트 생성 | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| 주간 리뷰 | 안내형 리뷰 및 미리 알림 브레인 덤프 | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Automator에서 번들을 열어 시험해 보거나, 키보드 단축키로 사용하려면 `~/Library/Services` 아래에 설치하세요. Reminders와 Calendar에는 적절한 macOS 자동화 권한이 필요합니다.

### Alfred

Powerpack이 포함된 Alfred가 필요합니다. 현재 소스에서 패키지를 빌드하려면 다음을 실행하세요:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

[releases](https://github.com/somethingwithproof/MacGTD/releases)에서 패키지를 다운로드할 수도 있습니다. 릴리스 패키지는 해당 태그 시점의 소스를 반영하므로, 릴리스 이후 `main`에 추가된 기능을 사용하려면 소스에서 직접 빌드해야 합니다.

| 키워드 | 동작 |
| --- | --- |
| `task` | 날짜, 컨텍스트, 프로젝트, 우선순위를 파싱하여 작업 캡처 |
| `note` | Reminders에 참고 메모 저장 |
| `project` | Reminders 목록 생성 |
| `gtd process` | 수동 검토를 위해 Inbox 열기 |
| `clip` | 클립보드 텍스트 캡처 |
| `gtd focus` | 집중 세션 시작, 상태 확인 또는 중지 |
| `gtd analytics` | 기록된 집중 시간 조회 |
| `gtd preferences` | 워크플로 환경설정 편집 |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

환경설정은 `~/Library/Preferences/com.alfredgtd.plist`에 저장되며, 집중 세션 상태와 로그는 `~/.gtd` 아래에 저장됩니다. 환경설정은 기본값 내장, 타입 검사, 검증된 가져오기, 원자적 쓰기(atomic write)를 지원합니다. 집중 세션은 시스템 알림 설정을 변경하지 않습니다. Inbox 처리는 검토를 위해 목록을 열 뿐이며 작업을 자동으로 이동하거나 완료 처리하지 않습니다.

자세한 내용은 [Alfred 가이드](../../../workflows/alfred/README.md)와 [GTDLib 라이브러리 문서](../../../workflows/alfred/GTDLib.scptd/README.md)를 참고하세요.

### 외부 캡처 어댑터

4개의 API 캡처 워크플로는 모두 호스팅 E2E 환경에서 실제 Automator 대화상자와 로컬 TLS 픽스처를 통해 검증됩니다. 전용 계정이 구성된 경우 별도의 수동 테스트 스위트가 실제 공급자 저장소 반영 여부를 테스트합니다. Things와 OmniFocus는 라이선스가 있는 데스크톱 통합 테스트 스위트가 필요합니다.

| 대상 | 방식 | 설정 / 소스 |
| --- | --- | --- |
| Todoist | API 캡처 | [워크플로 및 Keychain 설정](../../../workflows/todoist/) |
| Notion | 데이터 소스 API 캡처 | [워크플로 및 Keychain 설정](../../../workflows/notion/) |
| Things 3 | URL 스킴 | [워크플로](../../../workflows/things/) |
| OmniFocus | AppleScript / URL 스킴 | [워크플로](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [워크플로](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [워크플로](../../../workflows/google/) |

API 어댑터는 자격 증명 설정이 필요합니다. Microsoft는 위임된(delegated) OAuth 권한 부여가 필요하며, Google Keep은 지원되는 Workspace 접근 권한이 필요합니다:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[API 설정, 마이그레이션 및 권한 요구 사항](../../../workflows/api/README.md)을 참고하세요. 기존 Notion 데이터베이스 ID는 데이터 소스가 정확히 하나만 검색될 때만 마이그레이션됩니다. Microsoft와 Google 캡처는 비공식 브라우저 단축 방식 대신 공식 API를 사용합니다. OAuth 액세스 토큰은 OAuth 클라이언트를 통해 갱신해야 합니다. 페이로드는 명시적인 JSON 키, 시간 제한이 적용된 HTTPS 요청, 응답 확인을 사용합니다. 오류 메시지는 실패 세부 정보를 유지하면서도 구성된 API 토큰을 마스킹합니다. 보안 문제 제보는 [SECURITY.md](../../../SECURITY.md)를 참고하세요.

### 메뉴 막대 및 Shortcuts

[메뉴 막대 가이드](../../../workflows/menubar/README.md)에서 선택 사항인 SwiftBar/xbar 플러그인을 다룹니다. 먼저 Apple 서비스를 설치한 다음, 메뉴 막대 앱에서 플러그인 디렉터리를 설정하고 `workflows/menubar/gtd-menubar.sh`를 해당 디렉터리에 연결하세요.

[Shortcuts 가이드](../../../workflows/shortcuts/README.md)는 macOS 12 이상에서 텍스트, 클립보드, Siri 캡처를 수동으로 설정하는 방법을 안내합니다. Shortcuts와 Siri 음성 호출은 호스팅 테스트 스위트 범위에 포함되지 않습니다.

## 아키텍처

Automator 번들은 AppleScript를 내장하여 네이티브 서비스로 실행됩니다. Alfred는 액션 스크립트를 패키징하고 사용자 입력을 인자로 전달합니다. GTDLib는 편집 가능한 AppleScript 소스와 컴파일된 스크립트 번들을 통해 공통 네이티브 Reminders 작업을 제공합니다.

- **단일 프로덕션 파서:** `scripts/sync-native-parser.py`가 공통 파서를 빠른 캡처(Quick Capture)와 이벤트 캡처(Event Capture)에 내장하며, 검증 단계에서 소스 불일치를 감지합니다.
- **영구적인 집중 세션 상태:** 서로 다른 실행 호출 간에 세션 상태를 공유하며, 자체 launchd 작업과 상한이 지정된 경과 시간 집계를 사용합니다.
- **재현 가능한 패키지:** 패키징 시 새 아카이브를 빌드하며 테스트에서 소스와의 내용 일치 여부를 비교합니다. 라이브러리에는 별도의 컴파일 스크립트가 있습니다.
- **관찰 가능한 테스트:** JUnit 리포트, 명령 로그 및 테스트된 빌드 아티팩트는 GitHub Actions에 14일간 보관됩니다.

| 디렉터리 | 역할 |
| --- | --- |
| [`workflows/`](../../../workflows/) | 네이티브 번들, 공급자 어댑터, Alfred, Shortcuts 및 메뉴 막대 스크립트 |
| [`scripts/`](../../../scripts/) | 패키징, 라이브러리 컴파일, 파서 동기화 및 호스팅 테스트 프로비저닝 |
| [`tests/`](../../../tests/) | 검증, 컴포넌트 검사 및 네이티브 데스크톱 E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, 야간/수동 E2E 및 저장소 유지 관리 |
| [`infra/`](../../../infra/) | 선택적 로컬 및 EC2 Mac 러너 설정 (호스팅 CI에는 불필요) |

## 테스트 및 호환성

| 범위 | 환경 | 검증 항목 |
| --- | --- | --- |
| 검증 | GitHub 호스팅 macOS 15 및 26 | AppleScript 컴파일, 번들, 프로덕션 파서, 액션 대상, 환경설정, 집중 상태, 픽스처 API 전송 및 패키지 라운드트립 |
| 보안 검사 | GitHub 호스팅 Ubuntu 및 macOS 15 | Python CodeQL, ShellCheck 및 컴파일된 프로덕션 파서에 대한 제한된 Atheris 퍼징 |
| 공급자 어댑터 E2E | GitHub 호스팅 `macos-15-intel` | 4개 프로덕션 API 대화상자 전체, TLS 전송, 픽스처 저장/재조회, API 오류, 취소 및 Notion 소스 선택 |
| 라이브 공급자 E2E | 전용 시크릿을 사용한 수동 GitHub 호스팅 Mac 실행 | 실제 Todoist, Notion, Microsoft, Google 캡처 및 공급자 재조회 (계정이 누락되면 실패) |
| 라이선스 데스크톱 통합 | 전용 로컬 계정 | Things 3, OmniFocus 4 및 Alfred UI 호출과 영구 저장 |
| 네이티브 데스크톱 E2E | GitHub 호스팅 `macos-15-intel` | 실제 Automator 대화상자, 저장된 Reminders 및 Calendar 데이터, 주간 리뷰, 메뉴 카운트, 컴파일된 GTDLib, 패키징된 Alfred 네이티브 액션, 실제 launchd 타이머 만료 및 취소 |
| 선택적 Alfred UI | 전용 로컬 계정, Alfred 5 + Powerpack | 라이선스 UI를 통한 워크플로 가져오기, 키워드 호출 및 미리 알림 재조회 |

[검증된 API 현대화 실행](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916)은 실패, 오류 또는 건너뜀 없이 **각 검증 플랫폼에서 35개의 검증 테스트와 26개의 데스크톱 E2E 테스트를 통과**했습니다. 데스크톱 테스트 범위에는 15개의 네이티브 테스트와 실제 전송 타임아웃 및 일시적 Keychain 검사를 포함한 11개의 공급자 어댑터 테스트가 포함됩니다. 검증 단계에서는 저장소 구조 검사도 함께 수행합니다. 이러한 결과는 네이티브 동작과 공급자 픽스처에 대한 검증이며, 실제 라이브 공급자나 라이선스 앱과의 호환성을 보장하지는 않습니다. 현재 상태는 상단 배지에 표시됩니다.

Pull Request와 `main` 푸시 시 검증에 이어 네이티브 E2E가 실행됩니다. E2E 워크플로는 매일 밤 및 수동 실행으로도 실행되며, 결정론적 공급자 어댑터 테스트를 포함합니다. 라이브 공급자 테스트는 별도의 수동 `live-e2e.yml` 워크플로를 사용합니다. 기본 CI는 일회용 GitHub 호스팅 Mac, 격리된 픽스처 및 제한된 하위 프로세스를 사용하므로, 기본 테스트 스위트에는 자체 호스팅 러너나 외부 계정 자격 증명이 필요하지 않습니다. 수동 라이브 스위트에는 전용 공급자 시크릿이 필요합니다.

이전 macOS 버전은 현재 CI에서 검증되지 않습니다. 라이브 공급자 실행에는 전용 시크릿이 필요하며 아직 검증되지 않았습니다. Shortcuts/Siri 및 라이선스 데스크톱 앱은 기본 호스팅 스위트 범위 밖입니다. 네이티브 액션 테스트는 패키징된 Alfred 스크립트를 직접 실행하므로 전체 Alfred UI 호환성을 보증하지는 않습니다. 자세한 내용은 [테스트 설정, 사전 요구 사항 및 커버리지](../../../tests/e2e/README.md)를 참고하세요.

## 현지화

사용자용 CLI, 테스트 러너 및 메뉴 막대 문자열은 서드파티 의존성 없이 `scripts/i18n.py`를 통해 `locales/` 아래 45개 로케일(`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`)로 제공됩니다. 로케일 결정은 `--lang`, `LC_ALL`, `LC_MESSAGES`, `LANG` 순으로 확인하며, 해당하는 값이 없으면 `en`으로 대체됩니다.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## 개발

[mise](https://mise.jdx.dev/)를 설치하고 `.mise.toml`에 고정된 Python 버전을 사용하세요:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

검증은 `test-results/` 아래에 리포트를 기록하고, 빌드 스크립트는 `dist/`에 결과물을 생성합니다. `main`에서 호스팅 데스크톱 스위트를 실행하려면 다음을 실행하세요:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

로컬 데스크톱 E2E를 실행하려면 전용 로그인 테스트 계정과 [E2E 가이드](../../../tests/e2e/README.md)에 설명된 권한이 필요합니다. 호스팅 권한 프로비저닝 스크립트는 일회용 GitHub 호스팅 작업으로 제한됩니다.

[Conventional Commits](https://www.conventionalcommits.org/) 규칙을 사용하고 [CONTRIBUTING.md](../../../CONTRIBUTING.md)를 따르세요. 최근 변경 사항은 [CHANGELOG.md](../../../CHANGELOG.md)에 기록되어 있습니다.

보안 제어, 릴리스 서명 검증 및 남아 있는 Scorecard
제한 사항은 [보안 평가](../../../docs/security-assessment.md) 문서에 정리되어 있습니다.
릴리스 워크플로는 초안 릴리스를 생성하기 전에 패키지를 빌드하고 증명하며,
소스 커밋 및 ref를 기준으로 검증된 서명된 in-toto 출처 정보와
Sigstore 번들이 포함됩니다. 새 출처 정보는 해당 워크플로 빌드에 적용되며
이전 다운로드 파일에는 적용되지 않습니다.

## 프로젝트 이력 및 라이선스

MacGTD는 기존의 MacGTD-Native, MacGTD-Microsoft, MacGTD-Google 및 AlfredGTD 저장소를 하나로 통합한 프로젝트입니다. [MIT License](../../../LICENSE)에 따라 라이선스가 부여됩니다.
