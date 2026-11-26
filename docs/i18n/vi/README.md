# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · **Tiếng Việt** · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD là bộ sưu tập các quy trình làm việc (workflow) trên macOS giúp ghi nhận tác vụ, sắp xếp lời nhắc và chạy các phiên tập trung theo thời gian với chính những ứng dụng bạn đang sử dụng.**

Được xây dựng xoay quanh phương pháp [Getting Things Done](https://gettingthingsdone.com/), công cụ mang khả năng ghi nhận qua hộp thoại, bảng nhớ tạm (clipboard) và xử lý hàng loạt đến Apple Reminders; ghi nhận sự kiện đến Calendar; cùng các lệnh tác vụ, ghi chú, dự án và phiên tập trung đến Alfred. AppleScript và Automator giúp các workflow gốc bám sát hệ điều hành macOS. Các bộ điều hợp (adapter) API sử dụng Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 và Google Keep v1. Các adapter cho Things và OmniFocus cũng được tích hợp sẵn. Các bài kiểm thử trên hạ tầng lưu trữ xác minh những adapter API dựa trên một fixture HTTPS cục bộ; khả năng tương thích thực tế vẫn yêu cầu tài khoản riêng từ từng nhà cung cấp.

## Bạn có thể làm gì

- **Ghi nhận mà không cần chuyển ứng dụng.** Dùng Automator Service, từ khóa Alfred hoặc bảng nhớ tạm để thêm tác vụ. Chế độ ghi nhận hàng loạt tạo một lời nhắc cho mỗi dòng không trống.
- **Biến văn bản thành tác vụ có cấu trúc.** Phân tích cú pháp ngày tương đối và ngày theo chuẩn ISO, giờ, mức độ ưu tiên, ngữ cảnh và dự án bằng trình phân tích AppleScript phiên bản production dùng chung cho ghi nhận nhanh gốc và ghi nhận trên Calendar.
- **Ghi nhận sự kiện và rà soát hộp thư đến.** Tạo sự kiện Calendar kèm thời gian, thời lượng và địa điểm; chạy quy trình rà soát hàng tuần gồm năm bước kèm thao tác trút toàn bộ ý tưởng (brain dump) vào Reminders.
- **Làm việc theo phiên tập trung tính giờ.** Bắt đầu, kiểm tra và dừng phiên giữa các tiến trình khác nhau. Các bộ đếm thời gian launchd thuộc quyền sở hữu của phiên sẽ xử lý việc hết hạn và hủy bỏ; nhật ký JSONL cung cấp số liệu phân tích thời lượng.
- **Dùng Alfred cho nhiều việc hơn ngoài tác vụ.** Tạo danh sách Reminders cho dự án, lưu ghi chú tham khảo, mở hộp thư đến để rà soát, ghi nhận văn bản từ bảng nhớ tạm và chỉnh sửa các tùy chọn có kiểm tra kiểu dữ liệu.
- **Xem hộp thư đến ngay từ thanh menu.** Plugin SwiftBar/xbar tùy chọn hiển thị số lượng mục chưa hoàn thành trong hộp thư đến và liên kết đến các workflow ghi nhận.

Hành vi gốc được kiểm tra trên máy Mac thật do GitHub cung cấp: các bài kiểm thử thao tác trực tiếp trên hộp thoại Automator, sau đó đọc lại bản ghi từ Reminders và Calendar. Xem [kiểm thử và khả năng tương thích](#testing-and-compatibility) để biết phạm vi của các kết quả đó.

## Bắt đầu nhanh: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Mở workflow trong Automator và chạy thử tính năng ghi nhận. Để sử dụng dưới dạng một Service, hãy cài đặt gói vào thư mục `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Gán phím tắt trong **System Settings → Keyboard → Keyboard Shortcuts → Services**. Cho phép quyền Automation truy cập Reminders khi macOS yêu cầu. Nhập:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Workflow gốc sẽ tạo một lời nhắc có mức ưu tiên cao đến hạn vào ngày mai, điều hướng vào danh sách `shopping` và ghi lại ngữ cảnh. Nếu không có đánh dấu dự án hoặc ngữ cảnh, chế độ ghi nhận nhanh sẽ dùng `Inbox`.

## Cú pháp ghi nhận

Trình phân tích tác vụ gốc và tính năng ghi nhận tác vụ trên Alfred nhận diện các ký hiệu đánh dấu sau. Các adapter cho nhà cung cấp dịch vụ có phần hỗ trợ trường dữ liệu và điều hướng riêng.

| Đầu vào | Ý nghĩa | Ví dụ |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Ưu tiên cao, trung bình hoặc thấp | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Ngày đến hạn tương đối | `Call dentist tomorrow` |
| Tên thứ hoặc `next weekday` | Ngày đến hạn theo thứ trong tuần | `Send report next monday` |
| `due:YYYY-MM-DD` | Ngày đến hạn cụ thể | `Renew membership due:2027-03-15` |
| Thời gian đi kèm ngày | Giờ đến hạn | `Call Alex tomorrow at 3pm` |
| `@context` | Ký hiệu ngữ cảnh | `Buy milk @errands` |
| `+project` | Điều hướng dự án/danh sách | `Draft outline +website` |

`due:today` và `due:tomorrow` cũng được chấp nhận. Hãy dùng chữ cái, chữ số, dấu gạch dưới hoặc dấu gạch nối trong các ký hiệu ngữ cảnh và dự án. Chế độ ghi nhận nhanh gốc ưu tiên điều hướng theo dự án hơn là theo ngữ cảnh.

Chế độ ghi nhận trên Calendar dùng `@` cho địa điểm sự kiện và chấp nhận thời lượng theo phút hoặc giờ:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Nếu không chỉ định giờ hoặc thời lượng cụ thể, chế độ ghi nhận trên Calendar mặc định dùng 9:00 AM và thời lượng một giờ, trong lịch đầu tiên có quyền ghi.

## Chọn một workflow

### Các workflow Apple gốc

| Workflow | Hành vi | Gói (Bundle) |
| --- | --- | --- |
| Ghi nhận nhanh | Phân tích văn bản tác vụ và tạo lời nhắc | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Ghi nhận từ bảng nhớ tạm | Tạo lời nhắc từ văn bản trong bảng nhớ tạm | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Ghi nhận hàng loạt | Tạo lời nhắc từ nhiều dòng | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Ghi nhận sự kiện | Tạo sự kiện Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Rà soát hàng tuần | Rà soát có hướng dẫn và trút ý tưởng vào lời nhắc | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Mở một gói trong Automator để dùng thử, hoặc cài đặt vào `~/Library/Services` để truy cập bằng phím tắt. Reminders và Calendar cần có quyền macOS Automation tương ứng.

### Alfred

Yêu cầu Alfred kèm Powerpack. Biên dịch gói từ mã nguồn hiện tại:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Bạn cũng có thể tải gói từ mục [releases](https://github.com/somethingwithproof/MacGTD/releases). Các gói phát hành phản ánh mã nguồn tại thẻ (tag) tương ứng; các tính năng mới thêm vào `main` sau bản phát hành cần phải biên dịch từ mã nguồn.

| Từ khóa | Hành động |
| --- | --- |
| `task` | Ghi nhận tác vụ có phân tích ngày, ngữ cảnh, dự án và mức độ ưu tiên |
| `note` | Lưu ghi chú tham khảo trong Reminders |
| `project` | Tạo danh sách Reminders |
| `gtd process` | Mở Inbox để người dùng tự rà soát |
| `clip` | Ghi nhận văn bản từ bảng nhớ tạm |
| `gtd focus` | Bắt đầu phiên tập trung, kiểm tra trạng thái hoặc dừng |
| `gtd analytics` | Xem thời lượng tập trung đã ghi nhận |
| `gtd preferences` | Chỉnh sửa tùy chọn workflow |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Tùy chọn được lưu trong `~/Library/Preferences/com.alfredgtd.plist`; trạng thái phiên tập trung và nhật ký nằm trong `~/.gtd`. Hệ thống tùy chọn có sẵn giá trị mặc định, kiểm tra kiểu dữ liệu, nhập cấu hình có xác thực và ghi nguyên tử (atomic write). Phiên tập trung không làm thay đổi cài đặt thông báo của hệ thống. Quy trình xử lý hộp thư đến chỉ mở danh sách để bạn rà soát; nó không tự động di chuyển hay đánh dấu hoàn thành tác vụ.

Xem [hướng dẫn Alfred](../../../workflows/alfred/README.md) và [tài liệu thư viện GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Các adapter ghi nhận bên ngoài

Cả bốn workflow ghi nhận qua API đều được kiểm thử qua hộp thoại Automator thật và một fixture TLS cục bộ trong bộ kiểm thử E2E trên hạ tầng lưu trữ. Một bộ kiểm thử thủ công riêng biệt kiểm tra khả năng lưu trữ thực tế trên dịch vụ khi đã cấu hình tài khoản chuyên dụng. Things và OmniFocus yêu cầu bộ kiểm thử tích hợp desktop có bản quyền.

| Đích | Cơ chế | Cài đặt / mã nguồn |
| --- | --- | --- |
| Todoist | Ghi nhận qua API | [Workflow và cài đặt Keychain](../../../workflows/todoist/) |
| Notion | Ghi nhận qua Data source API | [Workflow và cài đặt Keychain](../../../workflows/notion/) |
| Things 3 | URL scheme | [Workflow](../../../workflows/things/) |
| OmniFocus | AppleScript / URL scheme | [Workflow](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Workflow](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Workflow](../../../workflows/google/) |

Các adapter API yêu cầu thiết lập thông tin xác thực; Microsoft cần ủy quyền OAuth được cấp quyền đại diện (delegated) và Google Keep cần quyền truy cập Workspace hợp lệ:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Xem [hướng dẫn cài đặt API, chuyển đổi dữ liệu và yêu cầu ủy quyền](../../../workflows/api/README.md). ID cơ sở dữ liệu Notion hiện có chỉ được di chuyển (migrate) khi tìm thấy đúng một nguồn dữ liệu duy nhất. Tính năng ghi nhận cho Microsoft và Google sử dụng API chính thức thay vì các phím tắt trình duyệt không có tài liệu. Token truy cập OAuth cần được gia hạn thông qua ứng dụng khách OAuth của bạn. Dữ liệu gửi đi (payload) sử dụng các khóa JSON tường minh, yêu cầu HTTPS có giới hạn thời gian và xác nhận phản hồi. Thông báo lỗi giữ lại chi tiết lỗi đồng thời che giấu API token đã cấu hình. Xem [SECURITY.md](../../../SECURITY.md) để biết cách báo cáo các vấn đề bảo mật.

### Thanh menu và Shortcuts

[Hướng dẫn thanh menu](../../../workflows/menubar/README.md) trình bày về plugin SwiftBar/xbar tùy chọn. Trước tiên hãy cài đặt Apple Services, sau đó cấu hình thư mục plugin trong ứng dụng thanh menu của bạn và liên kết `workflows/menubar/gtd-menubar.sh` vào đó.

[Hướng dẫn Shortcuts](../../../workflows/shortcuts/README.md) cung cấp cách cài đặt thủ công để ghi nhận văn bản, bảng nhớ tạm và Siri trên macOS 12+. Shortcuts và kích hoạt bằng giọng nói Siri nằm ngoài bộ kiểm thử trên hạ tầng lưu trữ.

## Kiến trúc

Các gói Automator nhúng mã AppleScript để có thể chạy như các Service gốc. Alfred đóng gói các script hành động và truyền dữ liệu đầu vào của người dùng dưới dạng tham số. GTDLib cung cấp các thao tác Reminders gốc dùng chung từ mã nguồn AppleScript có thể chỉnh sửa và một gói script đã biên dịch.

- **Một trình phân tích production duy nhất:** `scripts/sync-native-parser.py` nhúng trình phân tích dùng chung vào Quick Capture và Event Capture; bước xác thực sẽ phát hiện sự sai lệch mã nguồn.
- **Trạng thái tập trung bền vững:** các lần gọi riêng biệt chia sẻ trạng thái phiên, với các tác vụ launchd thuộc sở hữu riêng và tính toán thời gian đã trôi qua có giới hạn.
- **Gói có thể tái lập:** quá trình đóng gói tạo ra một tệp lưu trữ mới và các bài kiểm thử so sánh nội dung bên trong với mã nguồn. Thư viện có một script biên dịch riêng.
- **Kiểm thử có thể quan sát:** báo cáo JUnit, nhật ký lệnh và các sản phẩm build đã kiểm thử được lưu giữ trong 14 ngày trên GitHub Actions.

| Thư mục | Trách nhiệm |
| --- | --- |
| [`workflows/`](../../../workflows/) | Các gói gốc, adapter nhà cung cấp, Alfred, Shortcuts và script thanh menu |
| [`scripts/`](../../../scripts/) | Đóng gói, biên dịch thư viện, đồng bộ hóa trình phân tích và cấp phát môi trường kiểm thử |
| [`tests/`](../../../tests/) | Kiểm thử xác thực, kiểm thử thành phần và E2E desktop gốc |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E hàng đêm/thủ công và bảo trì kho lưu trữ |
| [`infra/`](../../../infra/) | Thiết lập runner Mac cục bộ và EC2 tùy chọn; CI trên hạ tầng lưu trữ không yêu cầu thành phần này |

<a name="testing-and-compatibility"></a>

## Kiểm thử và khả năng tương thích

| Phạm vi | Môi trường | Nội dung được kiểm tra |
| --- | --- | --- |
| Xác thực (Validation) | macOS 15 và 26 trên GitHub | Biên dịch AppleScript, các gói, trình phân tích production, đích hành động, tùy chọn, trạng thái tập trung, truyền tải API fixture và kiểm tra khứ hồi đóng gói (package round trip) |
| Kiểm tra bảo mật | Ubuntu và macOS 15 trên GitHub | Python CodeQL, ShellCheck và Atheris fuzzing có giới hạn trên trình phân tích production đã biên dịch |
| E2E adapter nhà cung cấp | `macos-15-intel` trên GitHub | Cả bốn hộp thoại API production, truyền tải TLS, lưu trữ/đọc lại từ fixture, lỗi API, thao tác hủy và chọn nguồn Notion |
| E2E nhà cung cấp thực tế | Chạy thủ công trên Mac do GitHub cung cấp kèm secret riêng | Ghi nhận thực tế lên Todoist, Notion, Microsoft, Google và đọc lại từ nhà cung cấp; thất bại nếu thiếu tài khoản |
| Tích hợp desktop có bản quyền | Tài khoản cục bộ chuyên dụng | Khởi chạy và lưu trữ trên giao diện Things 3, OmniFocus 4 và Alfred |
| E2E desktop gốc | `macos-15-intel` trên GitHub | Hộp thoại Automator thật; dữ liệu Reminders và Calendar đã lưu; rà soát hàng tuần; số đếm menu; GTDLib đã biên dịch; hành động gốc Alfred đã đóng gói; hết hạn và hủy bộ đếm launchd thật |
| Giao diện Alfred tùy chọn | Tài khoản cục bộ chuyên dụng, Alfred 5 + Powerpack | Nhập workflow, gọi bằng từ khóa và đọc lại lời nhắc qua giao diện có bản quyền |

[Lần chạy hiện đại hóa API đã xác minh](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) đã vượt qua **35 bài kiểm thử xác thực trên mỗi nền tảng xác thực và 26 bài kiểm thử E2E desktop**, không có lỗi, thất bại hay bỏ qua nào. Phạm vi kiểm thử desktop bao gồm 15 bài kiểm thử gốc và 11 bài kiểm thử adapter nhà cung cấp, bao gồm kiểm tra hết thời gian truyền tải thực tế và kiểm tra Keychain tạm thời. Quá trình xác thực cũng chạy kiểm tra cấu trúc kho lưu trữ. Các kết quả này bao phủ hành vi gốc và fixture nhà cung cấp; chúng không chứng minh khả năng tương thích với nhà cung cấp thực tế hay ứng dụng có bản quyền. Trạng thái hiện tại được hiển thị qua các huy hiệu (badge) ở trên.

Các pull request và thao tác push vào `main` sẽ chạy kiểm thử xác thực, tiếp theo là E2E gốc. Workflow E2E cũng chạy hàng đêm và khi kích hoạt thủ công, bao gồm các bài kiểm thử adapter nhà cung cấp có tính xác định (deterministic). Các bài kiểm thử nhà cung cấp thực tế sử dụng workflow thủ công riêng biệt `live-e2e.yml`. CI mặc định dùng máy Mac dùng một lần do GitHub cung cấp, các fixture cô lập và tiến trình con có giới hạn; không cần runner tự lưu trữ (self-hosted) hay thông tin xác thực tài khoản bên ngoài cho bộ kiểm thử mặc định. Bộ kiểm thử thực tế thủ công yêu cầu các secret riêng của nhà cung cấp.

Các phiên bản macOS cũ hơn không được xác thực bởi CI hiện tại. Các lượt chạy với nhà cung cấp thực tế yêu cầu secret chuyên dụng và chưa được xác minh. Shortcuts/Siri và các ứng dụng desktop có bản quyền nằm ngoài bộ kiểm thử mặc định trên hạ tầng lưu trữ. Các bài kiểm thử hành động gốc trực tiếp chạy các script Alfred đã đóng gói; chúng không chứng minh khả năng tương thích đầy đủ với giao diện Alfred. Xem [hướng dẫn thiết lập kiểm thử, điều kiện tiên quyết và phạm vi](../../../tests/e2e/README.md).

## Bản địa hóa

Các chuỗi văn bản hướng tới người dùng của CLI, trình chạy kiểm thử và thanh menu hỗ trợ sẵn 45 ngôn ngữ/khu vực (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) trong thư mục `locales/` thông qua `scripts/i18n.py` mà không phụ thuộc thư viện bên thứ ba. Cơ chế xác định ngôn ngữ sẽ kiểm tra `--lang`, sau đó đến `LC_ALL`, `LC_MESSAGES` và `LANG`, rồi quay về mặc định `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Phát triển

Cài đặt [mise](https://mise.jdx.dev/) và sử dụng phiên bản Python được ghim trong `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Quá trình xác thực ghi báo cáo vào `test-results/`; các script biên dịch ghi đầu ra vào `dist/`. Để chạy bộ kiểm thử desktop trên hạ tầng lưu trữ tại nhánh `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Việc chạy E2E desktop cục bộ yêu cầu một tài khoản kiểm thử đã đăng nhập chuyên dụng và các quyền được mô tả trong [hướng dẫn E2E](../../../tests/e2e/README.md). Script cấp quyền trên hạ tầng lưu trữ bị giới hạn chỉ dùng cho các job dùng một lần do GitHub cung cấp.

Hãy sử dụng [Conventional Commits](https://www.conventionalcommits.org/) và tuân thủ [CONTRIBUTING.md](../../../CONTRIBUTING.md). Các thay đổi gần đây được ghi lại trong [CHANGELOG.md](../../../CHANGELOG.md).

Các biện pháp kiểm soát bảo mật, xác minh chữ ký phát hành và các giới hạn còn tồn tại của Scorecard được ghi chép trong [báo cáo đánh giá bảo mật](../../../docs/security-assessment.md). Workflow phát hành biên dịch và chứng thực (attest) các gói trước khi tạo bản nháp phát hành, bao gồm nguồn gốc (provenance) theo chuẩn in-toto đã ký và các gói Sigstore được xác minh đối chiếu với commit và ref nguồn. Thông tin nguồn gốc mới áp dụng cho các bản dựng từ workflow đó, không áp dụng cho các bản tải xuống cũ hơn.

## Lịch sử dự án và giấy phép

MacGTD hợp nhất các kho lưu trữ trước đây gồm MacGTD-Native, MacGTD-Microsoft, MacGTD-Google và AlfredGTD. Dự án được cấp phép theo [MIT License](../../../LICENSE).
