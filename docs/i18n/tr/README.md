# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · **Türkçe** · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · [ไทย](../th/README.md) · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD, hâlihazırda kullandığınız uygulamalarla görev yakalamak, anımsatıcıları düzenlemek ve süreli odaklanma oturumları yürütmek için hazırlanmış bir macOS iş akışı koleksiyonudur.**

[Getting Things Done](https://gettingthingsdone.com/) metodolojisi etrafında oluşturulan bu proje; Apple Reminders'a iletişim kutusu, pano ve toplu yakalama özelliklerini, Calendar'a etkinlik yakalamayı ve Alfred'e görev, not, proje ve odaklanma komutlarını getirir. AppleScript ve Automator, yerel iş akışlarını macOS ile sıkı bir uyum içinde tutar. API bağdaştırıcıları Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 ve Google Keep v1 kullanır. Things ve OmniFocus bağdaştırıcıları da dahildir. Barındırılan testler API bağdaştırıcılarını yerel bir HTTPS test düzeneğine karşı doğrular; canlı uyumluluk için yine de özel sağlayıcı hesapları gerekir.

## Neler yapabilirsiniz

- **Uygulama değiştirmeden yakalayın.** Görev eklemek için bir Automator Service, bir Alfred anahtar sözcüğü veya panoyu kullanın. Toplu yakalama, boş olmayan her satır için bir anımsatıcı oluşturur.
- **Metni yapılandırılmış görevlere dönüştürün.** Yerel hızlı yakalama ve Calendar yakalama tarafından paylaşılan üretim AppleScript ayrıştırıcısını kullanarak göreli ve ISO tarihlerini, saatleri, öncelikleri, bağlamları ve projeleri ayrıştırın.
- **Etkinlikleri yakalayın ve gelen kutunuzu gözden geçirin.** Saat, süre ve konum içeren Calendar etkinlikleri oluşturun; Reminders'a zihin boşaltımı içeren beş adımlı bir haftalık gözden geçirme çalıştırın.
- **Süreli odaklanma oturumlarında çalışın.** Süreçler arasında oturumları başlatın, inceleyin ve durdurun. Oturuma ait launchd zamanlayıcıları süre dolumunu ve iptali yönetir; JSONL günlükleri süre analizleri sağlar.
- **Alfred'i görevlerden fazlası için kullanın.** Projeler için Reminders listeleri oluşturun, referans notları kaydedin, gözden geçirme için gelen kutusunu açın, pano metnini yakalayın ve tür denetimli tercihleri düzenleyin.
- **Gelen kutunuzu menü çubuğundan görün.** İsteğe bağlı SwiftBar/xbar eklentisi tamamlanmamış gelen kutusu sayılarını gösterir ve yakalama iş akışlarına bağlantılar sunar.

Yerel davranış gerçek GitHub barındırmalı Mac'lerde denetlenir: testler Automator iletişim kutularını çalıştırır, ardından Reminders ve Calendar kayıtlarını geri okur. Bu kanıtın kapsamı için [test ve uyumluluk](#testing-and-compatibility) bölümüne bakın.

## Hızlı başlangıç: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

İş akışını Automator'da açın ve yakalamayı denemek için çalıştırın. Bir Service olarak kullanılabilir hale getirmek için paketi `~/Library/Services` altına yükleyin:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

**Sistem Ayarları → Klavye → Klavye Kestirmeleri → Servisler** altından bir kestirme atayın. macOS sorduğunda Reminders için Automation erişimine izin verin. Şunu girin:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

Yerel iş akışı, son tarihi yarın olan yüksek öncelikli bir anımsatıcı oluşturur, onu `shopping` listesine yönlendirir ve bağlamı kaydeder. Proje veya bağlam işaretçisi olmadığında hızlı yakalama `Inbox` kullanır.

## Yakalama sözdizimi

Yerel görev ayrıştırıcısı ve Alfred görev yakalama bu işaretçileri tanır. Sağlayıcı bağdaştırıcılarının kendi alan ve yönlendirme desteği vardır.

| Girdi | Anlamı | Örnek |
| --- | --- | --- |
| `!1`, `!2`, `!3` | Yüksek, orta veya düşük öncelik | `Fix login !1` |
| `today`, `tomorrow`, `next week` | Göreli son tarih | `Call dentist tomorrow` |
| Haftanın günü veya `next weekday` | Haftanın gününe göre son tarih | `Send report next monday` |
| `due:YYYY-MM-DD` | Açık son tarih | `Renew membership due:2027-03-15` |
| Tarihle birlikte saat | Son saat | `Call Alex tomorrow at 3pm` |
| `@context` | Bağlam işaretçisi | `Buy milk @errands` |
| `+project` | Proje/liste yönlendirmesi | `Draft outline +website` |

`due:today` ve `due:tomorrow` da kabul edilir. Bağlam ve proje işaretçilerinde harfler, rakamlar, alt çizgiler veya tireler kullanın. Yerel hızlı yakalama, proje yönlendirmesine bağlam yönlendirmesinden daha yüksek öncelik verir.

Calendar yakalama, etkinlik konumu için `@` kullanır ve dakika veya saat cinsinden bir süre kabul eder:

```text
Planning tomorrow 2pm 45m @Conference Room
```

Açık bir saat veya süre verilmediğinde Calendar yakalama, yazılabilir ilk takvimde saat 09:00'ı ve bir saatlik süreyi kullanır.

## Bir iş akışı seçin

### Yerel Apple iş akışları

| İş akışı | Davranış | Paket |
| --- | --- | --- |
| Hızlı yakalama | Görev metnini ayrıştırır ve anımsatıcı oluşturur | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| Pano yakalama | Pano metninden anımsatıcı oluşturur | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| Toplu yakalama | Birden fazla satırdan anımsatıcılar oluşturur | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| Etkinlik yakalama | Bir Calendar etkinliği oluşturur | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| Haftalık gözden geçirme | Kılavuzlu gözden geçirme ve anımsatıcı zihin boşaltımı | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

Denemek için Automator'da bir paket açın veya klavye erişimi için `~/Library/Services` altına yükleyin. Reminders ve Calendar uygun macOS Automation izinlerini gerektirir.

### Alfred

Powerpack ile Alfred gerektirir. Paketi güncel kaynaktan derleyin:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

Paketi [sürümler](https://github.com/somethingwithproof/MacGTD/releases) sayfasından da indirebilirsiniz. Sürüm paketleri etiketlenmiş kaynaklarını yansıtır; bir sürümden sonra `main` dalına eklenen özellikler kaynak koddan derleme gerektirir.

| Anahtar sözcük | Eylem |
| --- | --- |
| `task` | Tarih, bağlam, proje ve öncelik ayrıştırmasıyla bir görev yakalayın |
| `note` | Reminders'da bir referans notu saklayın |
| `project` | Bir Reminders listesi oluşturun |
| `gtd process` | İnsan tarafından gözden geçirilmek üzere Inbox'ı açın |
| `clip` | Pano metnini yakalayın |
| `gtd focus` | Bir odaklanma oturumu başlatın, durumu inceleyin veya durdurun |
| `gtd analytics` | Kaydedilen odaklanma sürelerini inceleyin |
| `gtd preferences` | İş akışı tercihlerini düzenleyin |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

Tercihler `~/Library/Preferences/com.alfredgtd.plist` dosyasında; odaklanma durumu ve günlükler `~/.gtd` altında saklanır. Tercihler yerleşik varsayılanlara, tür denetimlerine, doğrulanmış içe aktarmalara ve atomik yazmalara sahiptir. Odaklanma oturumları sistem bildirim ayarlarını değiştirmez. Gelen kutusu işleme, listeyi gözden geçirme için açar; görevleri otomatik olarak taşımaz veya tamamlamaz.

[Alfred kılavuzuna](../../../workflows/alfred/README.md) ve [GTDLib kitaplık belgelerine](../../../workflows/alfred/GTDLib.scptd/README.md) bakın.

### Harici yakalama bağdaştırıcıları

Dört API yakalama iş akışının tümü, barındırılan E2E'de gerçek Automator iletişim kutuları ve yerel bir TLS test düzeneği üzerinden çalıştırılır. Ayrı bir manuel test paketi, özel hesaplar yapılandırıldığında gerçek sağlayıcı kalıcılığını test eder. Things ve OmniFocus lisanslı masaüstü tümleştirme paketini gerektirir.

| Hedef | Mekanizma | Kurulum / kaynak |
| --- | --- | --- |
| Todoist | API yakalama | [İş akışı ve Keychain kurulumu](../../../workflows/todoist/) |
| Notion | Veri kaynağı API yakalama | [İş akışı ve Keychain kurulumu](../../../workflows/notion/) |
| Things 3 | URL şeması | [İş akışı](../../../workflows/things/) |
| OmniFocus | AppleScript / URL şeması | [İş akışı](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [İş akışı](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [İş akışı](../../../workflows/google/) |

API bağdaştırıcıları kimlik bilgisi kurulumu gerektirir; Microsoft yetkilendirilmiş OAuth yetkilendirmesine, Google Keep ise uygun Workspace erişimine ihtiyaç duyar:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

[API kurulumu, geçiş ve yetkilendirme gereksinimlerine](../../../workflows/api/README.md) bakın. Mevcut Notion veritabanı kimlikleri yalnızca tam olarak bir veri kaynağı bulunduğunda geçirilir. Microsoft ve Google yakalama, belgelenmemiş tarayıcı kestirmeleri yerine API'leri kullanır. OAuth erişim belirteçleri OAuth istemciniz üzerinden yenilenmelidir. Yükler açık JSON anahtarları, sınırlı HTTPS istekleri ve yanıt onayı kullanır. Hata iletileri yapılandırılan API belirtecini gizlerken hata ayrıntılarını korur. Güvenlik sorunlarını bildirmek için [SECURITY.md](../../../SECURITY.md) dosyasına bakın.

### Menü çubuğu ve Shortcuts

[Menü çubuğu kılavuzu](../../../workflows/menubar/README.md) isteğe bağlı SwiftBar/xbar eklentisini kapsar. Önce Apple Services'ı yükleyin, ardından menü çubuğu uygulamanızda eklenti dizinini yapılandırın ve `workflows/menubar/gtd-menubar.sh` betiğini bu dizine bağlayın.

[Shortcuts kılavuzu](../../../workflows/shortcuts/README.md) macOS 12+ üzerinde metin, pano ve Siri yakalama için manuel kurulumu sunar. Shortcuts ve Siri sesle etkinleştirme, barındırılan test paketinin kapsamı dışındadır.

## Mimari

Automator paketleri yerel Services olarak çalışabilmeleri için AppleScript gömer. Alfred eylem betiklerini paketler ve kullanıcı girdisini argüman olarak iletir. GTDLib, düzenlenebilir AppleScript kaynağından ve derlenmiş bir betik paketinden paylaşılan yerel Reminders işlemlerini sunar.

- **Tek üretim ayrıştırıcısı:** `scripts/sync-native-parser.py` paylaşılan ayrıştırıcıyı Quick Capture ve Event Capture içine gömer; doğrulama kaynak kaymasını algılar.
- **Kalıcı odaklanma durumu:** ayrı çağrılar, sahip olunan launchd işleri ve sınırlı geçen süre muhasebesiyle oturum durumunu paylaşır.
- **Yeniden üretilebilir paketler:** paketleme yeni bir arşiv oluşturur ve testler içeriğini kaynakla karşılaştırır. Kitaplığın ayrı bir derleme betiği vardır.
- **Gözlemlenebilir testler:** JUnit raporları, komut günlükleri ve test edilmiş derleme yapıtları GitHub Actions'ta 14 gün boyunca saklanır.

| Dizin | Sorumluluk |
| --- | --- |
| [`workflows/`](../../../workflows/) | Yerel paketler, sağlayıcı bağdaştırıcıları, Alfred, Shortcuts ve menü çubuğu betikleri |
| [`scripts/`](../../../scripts/) | Paketleme, kitaplık derleme, ayrıştırıcı eşitleme ve barındırılan test sağlama |
| [`tests/`](../../../tests/) | Doğrulama, bileşen denetimleri ve yerel masaüstü E2E |
| [`.github/workflows/`](../../../.github/workflows/) | CI, gecelik/manuel E2E ve depo bakımı |
| [`infra/`](../../../infra/) | İsteğe bağlı yerel ve EC2 Mac çalıştırıcı kurulumu; barındırılan CI bunu gerektirmez |

<a name="testing-and-compatibility"></a>

## Test ve uyumluluk

| Kapsam | Ortam | Denetlenenler |
| --- | --- | --- |
| Doğrulama | GitHub barındırmalı macOS 15 ve 26 | AppleScript derlemesi, paketler, üretim ayrıştırıcısı, eylem hedefleri, tercihler, odaklanma durumu, test düzeneği API aktarımı ve paket gidiş-dönüşleri |
| Güvenlik denetimleri | GitHub barındırmalı Ubuntu ve macOS 15 | Python CodeQL, ShellCheck ve derlenmiş üretim ayrıştırıcısının sınırlı Atheris fuzzing testleri |
| Sağlayıcı bağdaştırıcısı E2E | GitHub barındırmalı `macos-15-intel` | Dört üretim API iletişim kutusunun tümü, TLS aktarımı, test düzeneği kalıcılığı/geri okuması, API hataları, iptal ve Notion kaynak seçimi |
| Canlı sağlayıcı E2E | Özel gizli anahtarlarla manuel GitHub barındırmalı Mac çalıştırması | Gerçek Todoist, Notion, Microsoft ve Google yakalaması ve sağlayıcı geri okuması; hesaplar eksikse başarısız olur |
| Lisanslı masaüstü tümleştirmeleri | Özel yerel hesap | Things 3, OmniFocus 4 ve Alfred kullanıcı arayüzü çağrısı ve kalıcılığı |
| Yerel masaüstü E2E | GitHub barındırmalı `macos-15-intel` | Gerçek Automator iletişim kutuları; kalıcı hale getirilen Reminders ve Calendar verileri; haftalık gözden geçirme; menü sayıları; derlenmiş GTDLib; paketlenmiş Alfred yerel eylemleri; gerçek launchd zamanlayıcı süre dolumu ve iptali |
| İsteğe bağlı Alfred UI | Özel yerel hesap, Alfred 5 + Powerpack | Lisanslı kullanıcı arayüzü üzerinden iş akışı içe aktarma, anahtar sözcük çağrısı ve anımsatıcı geri okuması |

[Doğrulanmış API modernizasyonu çalıştırması](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) **her doğrulama platformunda 35 doğrulama testini ve 26 masaüstü E2E testini** sıfır başarısızlık, hata veya atlama ile geçmiştir. Masaüstü kapsamı, gerçek aktarım zaman aşımı ve geçici Keychain denetimleri dahil olmak üzere 15 yerel test ve 11 sağlayıcı bağdaştırıcısı testi içerir. Doğrulama ayrıca depo yapısı denetimlerini de çalıştırır. Bu sonuçlar yerel davranışı ve sağlayıcı test düzeneklerini kapsar; canlı sağlayıcı veya lisanslı uygulama uyumluluğunu kanıtlamaz. Güncel durum yukarıdaki rozetlerle gösterilmektedir.

Çekme istekleri ve `main` dalına yapılan göndermeler, doğrulamayı ve ardından yerel E2E'yi çalıştırır. E2E iş akışı ayrıca gecelik olarak ve manuel tetiklemede, belirlenimci sağlayıcı bağdaştırıcısı testleri dahil olmak üzere çalışır. Canlı sağlayıcı testleri ayrı manuel `live-e2e.yml` iş akışını kullanır. Varsayılan CI tek kullanımlık GitHub barındırmalı Mac'ler, yalıtılmış test düzenekleri ve sınırlı alt süreçler kullanır; varsayılan paket için kendi kendine barındırılan bir çalıştırıcı veya harici hesap kimlik bilgileri gerekmez. Manuel canlı paket özel sağlayıcı gizli anahtarları gerektirir.

Daha eski macOS sürümleri mevcut CI tarafından doğrulanmaz. Canlı sağlayıcı çalıştırmaları özel gizli anahtarlar gerektirir ve henüz doğrulanmamıştır. Shortcuts/Siri ve lisanslı masaüstü uygulamaları varsayılan barındırılan paketin dışındadır. Yerel eylem testleri paketlenmiş Alfred betiklerini doğrudan çalıştırır; tam Alfred UI uyumluluğunu kanıtlamaz. [Test kurulumu, önkoşullar ve kapsam](../../../tests/e2e/README.md) belgesine bakın.

## Yerelleştirme

Kullanıcıya dönük CLI, test çalıştırıcı ve menü çubuğu dizeleri, sıfır üçüncü taraf bağımlılıkla `scripts/i18n.py` aracılığıyla `locales/` altında 45 yerel ayarda (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) sunulur. Yerel ayar çözümlemesi önce `--lang`, ardından `LC_ALL`, `LC_MESSAGES` ve `LANG` değişkenlerini denetler; hiçbiri yoksa `en` değerine geri döner.

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## Geliştirme

[mise](https://mise.jdx.dev/) aracını yükleyin ve `.mise.toml` dosyasında sabitlenen Python sürümünü kullanın:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

Doğrulama raporları `test-results/` altına yazar; derleme betikleri `dist/` dizinine yazar. Barındırılan masaüstü paketini `main` üzerinde çalıştırmak için:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

Yerel masaüstü E2E, oturum açılmış özel bir test hesabı ve [E2E kılavuzunda](../../../tests/e2e/README.md) açıklanan izinleri gerektirir. Barındırılan izin sağlama betiği tek kullanımlık GitHub barındırmalı işlerle sınırlandırılmıştır.

[Conventional Commits](https://www.conventionalcommits.org/) standardını kullanın ve [CONTRIBUTING.md](../../../CONTRIBUTING.md) dosyasını izleyin. Son değişiklikler [CHANGELOG.md](../../../CHANGELOG.md) dosyasında kayıtlıdır.

Güvenlik denetimleri, sürüm imzası doğrulaması ve kalan Scorecard sınırlamaları [güvenlik değerlendirmesinde](../../../docs/security-assessment.md) belgelenmiştir. Sürüm iş akışı, kaynak commit ve ref ile doğrulanan imzalı in-toto provenance ve Sigstore paketleri dahil olmak üzere bir taslak sürüm oluşturmadan önce paketleri derler ve onaylar. Yeni provenance verileri eski indirmeler için değil, bu iş akışı derlemeleri için geçerlidir.

## Proje geçmişi ve lisans

MacGTD; eski MacGTD-Native, MacGTD-Microsoft, MacGTD-Google ve AlfredGTD depolarını birleştirir. [MIT Lisansı](../../../LICENSE) altında lisanslanmıştır.
