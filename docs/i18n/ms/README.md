# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · **Bahasa Melayu** · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD ialah koleksi aliran kerja macOS untuk merakam tugasan, menyusun peringatan, dan menjalankan sesi fokus bermasa menggunakan aplikasi yang sudah anda gunakan.**

Dibina berasaskan [Getting Things Done](https://gettingthingsdone.com/), ia membawakan rakaman dialog, papan keratan, dan kelompok ke Apple Reminders; rakaman acara ke Calendar; serta perintah tugasan, nota, projek, dan fokus ke Alfred. AppleScript dan Automator memastikan aliran kerja asli kekal rapat dengan macOS. Penyesuai API menggunakan Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0, dan Google Keep v1. Penyesuai Things dan OmniFocus turut disertakan. Ujian terhos mengesahkan penyesuai API terhadap lekapan HTTPS tempatan; keserasian langsung masih memerlukan akaun pembekal khusus.

## Perkara yang boleh anda lakukan

- **Rakam tanpa bertukar aplikasi.** Gunakan Automator Service, kata kunci Alfred, atau papan keratan untuk menambah tugasan. Rakaman kelompok mencipta satu peringatan bagi setiap baris tidak kosong.
- **Tukar teks menjadi tugasan berstruktur.** Huraikan tarikh relatif dan ISO, masa, keutamaan, konteks, dan projek menggunakan penghurai AppleScript pengeluaran yang dikongsi oleh rakaman pantas asli dan rakaman Calendar.
- **Rakam acara dan semak peti masuk anda.** Cipta acara Calendar dengan masa, tempoh, dan lokasi; jalankan semakan mingguan lima langkah dengan curahan minda ke dalam Reminders.
- **Bekerja dalam sesi fokus bermasa.** Mulakan, periksa, dan hentikan sesi merentasi proses. Pemasa launchd milik sesi mengendalikan tamat tempoh dan pembatalan; log JSONL menyediakan analitik tempoh.
- **Gunakan Alfred untuk lebih daripada sekadar tugasan.** Cipta senarai Reminders untuk projek, simpan nota rujukan, buka peti masuk untuk semakan, rakam teks papan keratan, dan sunting keutamaan berjenis.
- **Lihat peti masuk anda daripada bar menu.** Pemalam SwiftBar/xbar pilihan memaparkan kiraan peti masuk yang belum selesai dan memautkan ke aliran kerja rakaman.

Kelakuan asli disemak pada Mac terhos GitHub sebenar: ujian mengendalikan dialog Automator, kemudian membaca semula rekod Reminders dan Calendar. Lihat [ujian dan keserasian](#ujian-dan-keserasian) untuk skop bukti tersebut.

## Mula pantas: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

Buka aliran kerja dalam Automator dan jalankannya untuk mencuba rakaman. Untuk menjadikannya tersedia sebagai Service, pasang himpunan tersebut di bawah `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

Tetapkan pintasan dalam **Seting Sistem → Papan Kekunci → Pintasan Papan Kekunci → Perkhidmatan**. Benarkan akses Automasi kepada Reminders apabila macOS meminta. Masukkan:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Aliran kerja asli mencipta peringatan berkeutamaan tinggi yang perlu disiapkan esok, menghalakannya ke senarai `shopping`, dan merekodkan konteksnya. Tanpa penanda projek atau konteks, rakaman pantas menggunakan `Inbox`.

## Sintaks rakaman

Penghurai tugasan asli dan rakaman tugasan Alfred mengenali penanda ini. Penyesuai pembekal mempunyai sokongan medan dan penghalaan tersendiri.

| Input | Maksud | Contoh |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Keutamaan tinggi, sederhana, atau rendah | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Tarikh akhir relatif | `Call dentist tomorrow` |
| Hari dalam minggu atau `next weekday` | Tarikh akhir hari dalam minggu | `Send report next monday` |
| `due:YYYY-MM-DD` | Tarikh akhir eksplisit | `Renew membership due:2027-03-15` |
| Masa bersama tarikh | Masa akhir | `Call Alex tomorrow at 3pm` |
| `@context` | Penanda konteks | `Buy milk @errands` |
| `+project` | Penghalaan projek/senarai | `Draft outline +website` |

`due:today` dan `due:tomorrow` juga diterima. Gunakan huruf, nombor, garis bawah, atau tanda sempang dalam penanda konteks dan projek. Rakaman pantas asli memberikan keutamaan kepada penghalaan projek berbanding penghalaan konteks.

Rakaman Calendar menggunakan `@` untuk lokasi acara dan menerima tempoh dalam minit atau jam:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Tanpa masa atau tempoh eksplisit, rakaman Calendar menggunakan 9:00 AM dan satu jam, dalam kalendar boleh tulis yang pertama.

## Pilih aliran kerja

### Aliran kerja Apple asli

| Aliran kerja | Kelakuan | Himpunan |
| --- | --- | --- |
| Rakaman pantas | Huraikan teks tugasan dan cipta peringatan | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Rakaman papan keratan | Cipta peringatan daripada teks papan keratan | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Rakaman kelompok | Cipta peringatan daripada berbilang baris | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Rakaman acara | Cipta acara Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Semakan mingguan | Semakan berpandu dan curahan minda peringatan | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Buka himpunan dalam Automator untuk mencubanya, atau pasangkannya di bawah `~/Library/Services` untuk akses papan kekunci. Reminders dan Calendar memerlukan kebenaran Automasi macOS yang sesuai.

### Alfred

Memerlukan Alfred dengan Powerpack. Bina pakej daripada sumber semasa:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Anda juga boleh memuat turun pakej daripada [keluaran](https://github.com/somethingwithproof/MacGTD/releases). Pakej keluaran mencerminkan sumber bertag masing-masing; ciri yang ditambahkan pada `main` selepas sesuatu keluaran memerlukan binaan daripada sumber.

| Kata kunci | Tindakan |
| --- | --- |
| `task` | Rakam tugasan dengan penghuraian tarikh, konteks, projek, dan keutamaan |
| `note` | Simpan nota rujukan dalam Reminders |
| `project` | Cipta senarai Reminders |
| `gtd process` | Buka Inbox untuk semakan manusia |
| `clip` | Rakam teks papan keratan |
| `gtd focus` | Mulakan sesi fokus, periksa status, atau hentikan |
| `gtd analytics` | Periksa tempoh fokus yang direkodkan |
| `gtd preferences` | Sunting keutamaan aliran kerja |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Keutamaan disimpan dalam `~/Library/Preferences/com.alfredgtd.plist`; keadaan dan log fokus disimpan di bawah `~/.gtd`. Keutamaan mempunyai nilai lalai terbina dalam, semakan jenis, import yang disahkan, dan penulisan atomik. Sesi fokus tidak mengubah tetapan pemberitahuan sistem. Pemprosesan peti masuk membuka senarai untuk semakan; ia tidak memindahkan atau melengkapkan tugasan secara automatik.

Lihat [panduan Alfred](../../../workflows/alfred/README.md) dan [dokumentasi pustaka GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md).

### Penyesuai rakaman luaran

Keempat-empat aliran kerja rakaman API diuji melalui dialog Automator sebenar dan lekapan TLS tempatan dalam E2E terhos. Satu set ujian manual berasingan menguji ketekalan vendor sebenar apabila akaun khusus dikonfigurasikan. Things dan OmniFocus memerlukan set integrasi desktop berlesen.

| Sasaran | Mekanisme | Persediaan / sumber |
| --- | --- | --- |
| Todoist | Rakaman API | [Persediaan aliran kerja dan Keychain](../../../workflows/todoist/) |
| Notion | Rakaman API sumber data | [Persediaan aliran kerja dan Keychain](../../../workflows/notion/) |
| Things 3 | Skema URL | [Aliran kerja](../../../workflows/things/) |
| OmniFocus | AppleScript / skema URL | [Aliran kerja](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [Aliran kerja](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [Aliran kerja](../../../workflows/google/) |

Penyesuai API memerlukan persediaan kelayakan; Microsoft memerlukan keizinan OAuth terwakil dan Google Keep memerlukan akses Workspace yang layak:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

Lihat [persediaan API, migrasi, dan keperluan keizinan](../../../workflows/api/README.md). ID pangkalan data Notion sedia ada hanya berhijrah apabila tepat satu sumber data ditemui. Rakaman Microsoft dan Google menggunakan API dan bukannya pintasan pelayar yang tidak didokumentasikan. Token akses OAuth memerlukan pembaharuan melalui klien OAuth anda. Muatan menggunakan kunci JSON eksplisit, permintaan HTTPS terhad, dan pengesahan respons. Mesej ralat mengekalkan butiran kegagalan sambil menutup token API yang dikonfigurasikan. Lihat [SECURITY.md](../../../SECURITY.md) untuk melaporkan isu keselamatan.

### Bar menu dan Shortcuts

[Panduan bar menu](../../../workflows/menubar/README.md) merangkumi pemalam SwiftBar/xbar pilihan. Pasang Apple Services terlebih dahulu, kemudian konfigurasikan direktori pemalam dalam aplikasi bar menu anda dan pautkan `workflows/menubar/gtd-menubar.sh` ke dalamnya.

[Panduan Shortcuts](../../../workflows/shortcuts/README.md) menyediakan persediaan manual untuk rakaman teks, papan keratan, dan Siri pada macOS 12+. Pengaktifan suara Shortcuts dan Siri berada di luar set ujian terhos.

## Seni bina

Himpunan Automator membenamkan AppleScript supaya ia boleh dijalankan sebagai Services asli. Alfred mempakejkan skrip tindakan dan menghantar input pengguna sebagai argumen. GTDLib mendedahkan operasi Reminders asli yang dikongsi daripada sumber AppleScript boleh sunting dan himpunan skrip terkompil.

- **Satu penghurai pengeluaran:** `scripts/sync-native-parser.py` membenamkan penghurai kongsi dalam Quick Capture dan Event Capture; pengesahan mengesan hanyutan sumber.
- **Keadaan fokus berterusan:** pemanggilan berasingan berkongsi keadaan sesi, dengan tugas launchd milik sesi dan pengiraan masa berlalu yang terhad.
- **Pakej boleh dihasilkan semula:** pembungkusan membina arkib baharu, dan ujian membandingkan kandungannya dengan sumber. Pustaka ini mempunyai skrip pengkompilan yang berasingan.
- **Ujian boleh diperhatikan:** laporan JUnit, log perintah, dan artifak binaan yang diuji disimpan selama 14 hari dalam GitHub Actions.

| Direktori | Tanggungjawab |
| --- | --- |
| [`workflows/`](../../../workflows/) | Himpunan asli, penyesuai pembekal, Alfred, Shortcuts, dan skrip bar menu |
| [`scripts/`](../../../scripts/) | Pembungkusan, pengkompilan pustaka, penyegerakan penghurai, dan penyediaan ujian terhos |
| [`tests/`](../../../tests/) | Pengesahan, semakan komponen, dan E2E desktop asli |
| [`.github/workflows/`](../../../.github/workflows/) | CI, E2E malam/manual, dan penyelenggaraan repositori |
| [`infra/`](../../../infra/) | Persediaan pelaksana Mac tempatan dan EC2 pilihan; CI terhos tidak memerlukannya |

## Ujian dan keserasian

| Skop | Persekitaran | Perkara yang disemak |
| --- | --- | --- |
| Pengesahan | macOS 15 dan 26 terhos GitHub | Pengkompilan AppleScript, himpunan, penghurai pengeluaran, sasaran tindakan, keutamaan, keadaan fokus, pengangkutan API lekapan, dan pusingan balik pakej |
| Semakan keselamatan | Ubuntu dan macOS 15 terhos GitHub | Python CodeQL, ShellCheck, dan fuzzing Atheris terhad bagi penghurai pengeluaran terkompil |
| E2E penyesuai pembekal | `macos-15-intel` terhos GitHub | Keempat-empat dialog API pengeluaran, pengangkutan TLS, ketekalan/bacaan semula lekapan, kegagalan API, pembatalan, dan pemilihan sumber Notion |
| E2E pembekal langsung | Larian Mac terhos GitHub manual dengan rahsia khusus | Rakaman Todoist, Notion, Microsoft, dan Google sebenar serta bacaan semula vendor; gagal jika akaun tiada |
| Integrasi desktop berlesen | Akaun tempatan khusus | Pemanggilan UI dan ketekalan Things 3, OmniFocus 4, dan Alfred |
| E2E desktop asli | `macos-15-intel` terhos GitHub | Dialog Automator sebenar; data Reminders dan Calendar yang berterusan; semakan mingguan; kiraan menu; GTDLib terkompil; tindakan asli Alfred terpakej; tamat tempoh dan pembatalan pemasa launchd sebenar |
| UI Alfred pilihan | Akaun tempatan khusus, Alfred 5 + Powerpack | Pengimportan aliran kerja, pemanggilan kata kunci, dan bacaan semula peringatan melalui UI berlesen |

[Larian pemodenan API yang disahkan](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) lulus **35 ujian pengesahan pada setiap platform pengesahan dan 26 ujian E2E desktop**, tanpa sebarang kegagalan, ralat, atau langkauan. Liputan desktop merangkumi 15 ujian asli dan 11 ujian penyesuai pembekal, termasuk tamat masa pengangkutan sebenar dan semakan Keychain sementara. Pengesahan turut menjalankan semakan struktur repositori. Keputusan ini merangkumi kelakuan asli dan lekapan pembekal; ia tidak membuktikan keserasian vendor langsung atau aplikasi berlesen. Status semasa ditunjukkan oleh lencana di atas.

Permintaan tarik dan tolakan ke `main` menjalankan pengesahan diikuti oleh E2E asli. Aliran kerja E2E juga berjalan setiap malam dan atas penghantaran manual, termasuk ujian penyesuai pembekal deterministik. Ujian vendor langsung menggunakan aliran kerja manual `live-e2e.yml` yang berasingan. CI lalai menggunakan Mac terhos GitHub pakai buang, lekapan terasing, dan subproses terhad; tiada pelaksana hos sendiri atau kelayakan akaun luaran diperlukan untuk set lalai. Set langsung manual memerlukan rahsia pembekal khusus.

Versi macOS terdahulu tidak disahkan oleh CI semasa. Larian pembekal langsung memerlukan rahsia khusus dan belum disahkan lagi. Shortcuts/Siri dan aplikasi desktop berlesen berada di luar set terhos lalai. Ujian tindakan asli menguji skrip Alfred terpakej secara langsung; ia tidak membuktikan keserasian penuh UI Alfred. Lihat [persediaan ujian, prasyarat, dan liputan](../../../tests/e2e/README.md).

## Penyetempatan

Rentetan CLI menghadap pengguna, pelaksana ujian, dan bar menu disediakan dalam 45 lokal (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) di bawah `locales/` melalui `scripts/i18n.py` tanpa kebergantungan pihak ketiga. Penyelesaian lokal menyemak `--lang`, kemudian `LC_ALL`, `LC_MESSAGES`, dan `LANG`, dengan sandaran kepada `en`.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Pembangunan

Pasang [mise](https://mise.jdx.dev/) dan gunakan versi Python yang dipinkan dalam `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Pengesahan menulis laporan di bawah `test-results/`; skrip binaan menulis ke `dist/`. Untuk menjalankan set desktop terhos pada `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

E2E desktop tempatan memerlukan akaun ujian log masuk khusus dan kebenaran yang diterangkan dalam [panduan E2E](../../../tests/e2e/README.md). Skrip penyediaan kebenaran terhos terhad kepada tugas terhos GitHub pakai buang.

Gunakan [Conventional Commits](https://www.conventionalcommits.org/) dan ikuti [CONTRIBUTING.md](../../../CONTRIBUTING.md). Perubahan terkini direkodkan dalam [CHANGELOG.md](../../../CHANGELOG.md).

Kawalan keselamatan, pengesahan tandatangan keluaran, dan pengehadan Scorecard yang masih ada didokumentasikan dalam [penilaian keselamatan](../../../docs/security-assessment.md).
Aliran kerja keluaran membina dan memperakui pakej sebelum mencipta draf keluaran,
termasuk bukti asal in-toto bertandatangan dan himpunan Sigstore yang disahkan terhadap
komit dan rujukan sumber. Bukti asal baharu terpakai kepada binaan aliran kerja tersebut, bukan
muat turun yang lebih lama.

## Sejarah projek dan lesen

MacGTD menggabungkan bekas repositori MacGTD-Native, MacGTD-Microsoft, MacGTD-Google, dan AlfredGTD. Ia dilesenkan di bawah [Lesen MIT](../../../LICENSE).
