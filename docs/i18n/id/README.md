# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · **Bahasa Indonesia**

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD adalah kumpulan alur kerja macOS untuk menangkap tugas, mengatur pengingat, dan menjalankan sesi fokus berbatas waktu dengan aplikasi yang sudah Anda gunakan.**

Dibangun berdasarkan metode [Getting Things Done](https://gettingthingsdone.com/), MacGTD menghadirkan penangkapan lewat dialog, papan klip, dan tangkap massal ke Apple Reminders; penangkapan acara ke Calendar; serta perintah tugas, catatan, proyek, dan fokus ke Alfred. AppleScript dan Automator menjaga alur kerja bawaan tetap terintegrasi erat dengan macOS. Adaptor API menggunakan Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, dan Google Keep v1. Adaptor untuk Things dan OmniFocus juga disertakan. Pengujian terkelola memverifikasi adaptor API terhadap fixture HTTPS lokal; kompatibilitas langsung tetap memerlukan akun penyedia khusus.

## Apa yang dapat Anda lakukan

- **Tangkap tugas tanpa berpindah aplikasi.** Gunakan Automator Service, kata kunci Alfred, atau papan klip untuk menambahkan tugas. Tangkap massal membuat satu pengingat untuk setiap baris yang tidak kosong.
- **Ubah teks menjadi tugas terstruktur.** Urai tanggal relatif dan ISO, waktu, prioritas, konteks, dan proyek menggunakan parser AppleScript produksi yang dipakai bersama oleh tangkap cepat bawaan dan tangkap Calendar.
- **Tangkap acara dan tinjau kotak masuk Anda.** Buat acara Calendar dengan waktu, durasi, dan lokasi; jalankan tinjauan mingguan lima langkah disertai pencatatan ide bebas ke Reminders.
- **Bekerja dalam sesi fokus berbatas waktu.** Mulai, periksa, dan hentikan sesi lintas proses. Timer launchd milik sesi menangani kedaluwarsa dan pembatalan; log JSONL menyediakan analitik durasi.
- **Gunakan Alfred untuk lebih dari sekadar tugas.** Buat daftar Reminders untuk proyek, simpan catatan referensi, buka kotak masuk untuk ditinjau, tangkap teks papan klip, dan ubah preferensi bertipe.
- **Lihat kotak masuk Anda dari bilah menu.** Plugin SwiftBar/xbar opsional menampilkan jumlah kotak masuk yang belum selesai dan tautan ke alur kerja penangkapan.

Perilaku bawaan diperiksa pada Mac sungguhan yang di-host di GitHub: pengujian mengoperasikan dialog Automator, lalu membaca kembali data Reminders dan Calendar. Lihat [pengujian dan kompatibilitas](#testing-and-compatibility) untuk cakupan bukti tersebut.

## Panduan cepat: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Buka alur kerja di Automator dan jalankan untuk mencoba penangkapan. Agar tersedia sebagai Service, pasang bundel di bawah `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Tetapkan pintasan di **System Settings → Keyboard → Keyboard Shortcuts → Services**. Izinkan akses Automation ke Reminders saat macOS memintanya. Masukkan:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Alur kerja bawaan membuat pengingat berprioritas tinggi yang jatuh tempo besok, mengarahkannya ke daftar `shopping`, dan mencatat konteksnya. Tanpa penanda proyek atau konteks, tangkap cepat menggunakan `Inbox`.

## Sintaks penangkapan

Parser tugas bawaan dan penangkapan tugas Alfred mengenali penanda-penanda ini. Adaptor penyedia memiliki dukungan kolom dan perutean masing-masing.

| Masukan | Arti | Contoh |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Prioritas tinggi, sedang, atau rendah | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Tanggal jatuh tempo relatif | `Call dentist tomorrow` |
| Hari dalam seminggu atau `next weekday` | Tanggal jatuh tempo hari tertentu | `Send report next monday` |
| `due:YYYY-MM-DD` | Tanggal jatuh tempo eksplisit | `Renew membership due:2027-03-15` |
| Waktu bersama tanggal | Jam jatuh tempo | `Call Alex tomorrow at 3pm` |
| `@context` | Penanda konteks | `Buy milk @errands` |
| `+project` | Perutean proyek/daftar | `Draft outline +website` |

`due:today` dan `due:tomorrow` juga diterima. Gunakan huruf, angka, garis bawah, atau tanda hubung pada penanda konteks dan proyek. Tangkap cepat bawaan memprioritaskan perutean proyek dibandingkan perutean konteks.

Penangkapan Calendar menggunakan `@` untuk lokasi acara dan menerima durasi dalam menit atau jam:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Tanpa waktu atau durasi eksplisit, penangkapan Calendar menggunakan pukul 09.00 dan durasi satu jam, di kalender pertama yang dapat ditulis.

## Pilih alur kerja

### Alur kerja bawaan Apple

| Alur kerja | Perilaku | Bundel |
| --- | --- | --- |
| Tangkap cepat | Mengurai teks tugas dan membuat pengingat | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Tangkap papan klip | Membuat pengingat dari teks papan klip | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Tangkap massal | Membuat pengingat dari beberapa baris sekaligus | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Tangkap acara | Membuat acara Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Tinjauan mingguan | Tinjauan terpandu dan pencatatan ide bebas ke pengingat | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Buka bundel di Automator untuk mencobanya, atau pasang di bawah `~/Library/Services` untuk akses lewat papan tik. Reminders dan Calendar memerlukan izin Automation macOS yang sesuai.

### Alfred

Memerlukan Alfred dengan Powerpack. Bangun paket dari sumber saat ini:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Anda juga dapat mengunduh paket dari [rilis](https://github.com/somethingwithproof/MacGTD/releases). Paket rilis mencerminkan kode sumber pada tag-nya; fitur yang ditambahkan ke `main` setelah rilis memerlukan pembangunan dari sumber.

| Kata kunci | Tindakan |
| --- | --- |
| `task` | Menangkap tugas dengan penguraian tanggal, konteks, proyek, dan prioritas |
| `note` | Menyimpan catatan referensi di Reminders |
| `project` | Membuat daftar Reminders |
| `gtd process` | Membuka Inbox untuk peninjauan manual |
| `clip` | Menangkap teks papan klip |
| `gtd focus` | Memulai sesi fokus, memeriksa status, atau menghentikannya |
| `gtd analytics` | Memeriksa durasi fokus yang tercatat |
| `gtd preferences` | Mengubah preferensi alur kerja |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Preferensi disimpan di `~/Library/Preferences/com.alfredgtd.plist`; status fokus dan log disimpan di bawah `~/.gtd`. Preferensi memiliki nilai bawaan, pemeriksaan tipe, impor tervalidasi, dan penulisan atomik. Sesi fokus tidak mengubah pengaturan notifikasi sistem. Pemrosesan kotak masuk hanya membuka daftar untuk ditinjau; fitur ini tidak memindahkan atau menyelesaikan tugas secara otomatis.

Lihat [panduan Alfred](../../../workflows/alfred/README.md) dan [dokumentasi pustaka GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Adaptor penangkapan eksternal

Keempat alur kerja penangkapan API diuji melalui dialog Automator sungguhan dan fixture TLS lokal dalam E2E terkelola. Rangkaian pengujian manual terpisah menguji persistensi vendor sungguhan saat akun khusus dikonfigurasi. Things dan OmniFocus memerlukan rangkaian integrasi desktop berlisensi.

| Target | Mekanisme | Penyiapan / sumber |
| --- | --- | --- |
| Todoist | Penangkapan API | [Penyiapan alur kerja dan Keychain](../../../workflows/todoist/) |
| Notion | Penangkapan API sumber data | [Penyiapan alur kerja dan Keychain](../../../workflows/notion/) |
| Things 3 | Skema URL | [Alur kerja](../../../workflows/things/) |
| OmniFocus | AppleScript / skema URL | [Alur kerja](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Alur kerja](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Alur kerja](../../../workflows/google/) |

Adaptor API memerlukan penyiapan kredensial; Microsoft memerlukan otorisasi OAuth terdelegasi dan Google Keep memerlukan akses Workspace yang memenuhi syarat:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Lihat [penyiapan API, migrasi, dan persyaratan otorisasi](../../../workflows/api/README.md). ID basis data Notion yang sudah ada hanya dimigrasikan apabila ditemukan tepat satu sumber data. Penangkapan Microsoft dan Google menggunakan API, bukan pintasan peramban yang tidak terdokumentasi. Token akses OAuth memerlukan pembaruan melalui klien OAuth Anda. Payload menggunakan kunci JSON eksplisit, permintaan HTTPS berbatas, dan konfirmasi respons. Pesan galat mempertahankan detail kegagalan sambil menyensor token API yang dikonfigurasi. Lihat [SECURITY.md](../../../SECURITY.md) untuk melaporkan masalah keamanan.

### Bilah menu dan Shortcuts

[Panduan bilah menu](../../../workflows/menubar/README.md) membahas plugin SwiftBar/xbar opsional. Pasang Apple Services terlebih dahulu, lalu konfigurasikan direktori plugin di aplikasi bilah menu Anda dan tautkan `workflows/menubar/gtd-menubar.sh` ke dalamnya.

[Panduan Shortcuts](../../../workflows/shortcuts/README.md) menyediakan penyiapan manual untuk penangkapan teks, papan klip, dan Siri pada macOS 12+. Shortcuts dan aktivasi suara Siri berada di luar rangkaian pengujian terkelola.

## Arsitektur

Bundel Automator menyematkan AppleScript sehingga dapat berjalan sebagai Service bawaan. Alfred memaketkan skrip tindakan dan meneruskan masukan pengguna sebagai argumen. GTDLib menyediakan operasi Reminders bawaan bersama dari sumber AppleScript yang dapat disunting dan bundel skrip terkompilasi.

- **Satu parser produksi:** `scripts/sync-native-parser.py` menyematkan parser bersama di Quick Capture dan Event Capture; validasi mendeteksi penyimpangan sumber.
- **Status fokus persisten:** pemanggilan terpisah berbagi status sesi, dengan tugas launchd yang dimiliki sesi dan pencatatan waktu berlalu yang terukur.
- **Paket yang dapat direproduksi:** pemaketan membangun arsip baru, dan pengujian membandingkan isinya dengan sumber. Pustaka memiliki skrip kompilasi terpisah.
- **Pengujian yang dapat diamati:** laporan JUnit, log perintah, dan artefak build yang diuji disimpan selama 14 hari di GitHub Actions.

| Direktori | Tanggung jawab |
| --- | --- |
| [`workflows/`](../../../workflows/) | Bundel bawaan, adaptor penyedia, Alfred, Shortcuts, dan skrip bilah menu |
| [`scripts/`](../../../scripts/) | Pemaketan, kompilasi pustaka, sinkronisasi parser, dan penyediaan pengujian terkelola |
| [`tests/`](../../../tests/) | Validasi, pemeriksaan komponen, dan E2E desktop bawaan |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E malam/manual, dan pemeliharaan repositori |
| [`infra/`](../../../infra/) | Penyiapan runner Mac lokal dan EC2 opsional; CI terkelola tidak memerlukannya |

## Pengujian dan kompatibilitas

| Cakupan | Lingkungan | Yang diperiksa |
| --- | --- | --- |
| Validasi | macOS 15 dan 26 yang di-host di GitHub | Kompilasi AppleScript, bundel, parser produksi, target tindakan, preferensi, status fokus, transpor API fixture, dan uji bolak-balik paket |
| Pemeriksaan keamanan | Ubuntu dan macOS 15 yang di-host di GitHub | CodeQL Python, ShellCheck, dan fuzzing Atheris berbatas pada parser produksi terkompilasi |
| E2E adaptor penyedia | `macos-15-intel` yang di-host di GitHub | Keempat dialog API produksi, transpor TLS, persistensi/pembacaan kembali fixture, kegagalan API, pembatalan, dan pemilihan sumber Notion |
| E2E penyedia langsung | Eksekusi Mac terkelola GitHub manual dengan secret khusus | Penangkapan Todoist, Notion, Microsoft, dan Google sungguhan serta pembacaan kembali dari vendor; gagal jika akun tidak tersedia |
| Integrasi desktop berlisensi | Akun lokal khusus | Pemanggilan UI dan persistensi Things 3, OmniFocus 4, dan Alfred |
| E2E desktop bawaan | `macos-15-intel` yang di-host di GitHub | Dialog Automator sungguhan; data Reminders dan Calendar persisten; tinjauan mingguan; hitungan menu; GTDLib terkompilasi; tindakan bawaan Alfred terpaket; kedaluwarsa dan pembatalan timer launchd sungguhan |
| UI Alfred opsional | Akun lokal khusus, Alfred 5 + Powerpack | Impor alur kerja, pemanggilan kata kunci, dan pembacaan kembali pengingat melalui UI berlisensi |

[Eksekusi modernisasi API terverifikasi](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) meluluskan **35 pengujian validasi pada setiap platform validasi dan 26 pengujian E2E desktop**, tanpa kegagalan, galat, atau pengujian yang dilewati. Cakupan desktop mencakup 15 pengujian bawaan dan 11 pengujian adaptor penyedia, termasuk batas waktu transpor aktual dan pemeriksaan Keychain sementara. Validasi juga menjalankan pemeriksaan struktur repositori. Hasil ini mencakup perilaku bawaan dan fixture penyedia; hasil ini tidak membuktikan kompatibilitas vendor langsung atau aplikasi berlisensi. Status terkini ditunjukkan oleh lencana di atas.

Pull request dan push ke `main` menjalankan validasi diikuti oleh E2E bawaan. Alur kerja E2E juga berjalan setiap malam dan melalui pemicu manual, termasuk pengujian adaptor penyedia yang deterministik. Pengujian vendor langsung menggunakan alur kerja manual terpisah `live-e2e.yml`. CI bawaan menggunakan Mac sekali pakai yang di-host di GitHub, fixture terisolasi, dan subproses berbatas; tidak diperlukan runner yang di-host sendiri atau kredensial akun eksternal untuk rangkaian pengujian bawaan. Rangkaian langsung manual memerlukan secret penyedia khusus.

Versi macOS yang lebih lama tidak divalidasi oleh CI saat ini. Eksekusi penyedia langsung memerlukan secret khusus dan belum diverifikasi. Shortcuts/Siri dan aplikasi desktop berlisensi berada di luar rangkaian pengujian terkelola bawaan. Pengujian tindakan bawaan menguji skrip Alfred yang dipaketkan secara langsung; pengujian ini tidak membuktikan kompatibilitas UI Alfred secara penuh. Lihat [penyiapan pengujian, prasyarat, dan cakupan](../../../tests/e2e/README.md).

## Pelokalan

String CLI yang menghadap pengguna, test runner, dan bilah menu tersedia dalam 45 lokal (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) di bawah `locales/` melalui `scripts/i18n.py` tanpa dependensi pihak ketiga. Resolusi lokal memeriksa `--lang`, lalu `LC_ALL`, `LC_MESSAGES`, dan `LANG`, dengan cadangan ke `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Pengembangan

Pasang [mise](https://mise.jdx.dev/) dan gunakan versi Python yang disematkan di `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Validasi menulis laporan di bawah `test-results/`; skrip build menulis ke `dist/`. Untuk menjalankan rangkaian desktop terkelola di `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

E2E desktop lokal memerlukan akun pengujian khusus yang sedang masuk dan izin yang dijelaskan dalam [panduan E2E](../../../tests/e2e/README.md). Skrip penyediaan izin terkelola dibatasi hanya untuk pekerjaan sekali pakai yang di-host di GitHub.

Gunakan [Conventional Commits](https://www.conventionalcommits.org/) dan ikuti [CONTRIBUTING.md](../../../CONTRIBUTING.md). Perubahan terbaru dicatat di [CHANGELOG.md](../../../CHANGELOG.md).

Kontrol keamanan, verifikasi tanda tangan rilis, dan keterbatasan Scorecard
yang tersisa didokumentasikan dalam [penilaian keamanan](../../../docs/security-assessment.md).
Alur kerja rilis membangun dan mengesahkan paket sebelum membuat draf rilis,
termasuk provenance in-toto yang ditandatangani dan bundel Sigstore yang diverifikasi
terhadap komit sumber dan ref. Provenance baru berlaku untuk build alur kerja tersebut,
bukan unduhan yang lebih lama.

## Riwayat proyek dan lisensi

MacGTD menggabungkan repositori MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, dan AlfredGTD yang sebelumnya terpisah. Proyek ini dilisensikan di bawah [MIT License](../../../LICENSE).
