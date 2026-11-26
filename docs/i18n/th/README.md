# MacGTD

[![CI](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/ci.yml)
[![Native E2E](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml/badge.svg?branch=main)](https://github.com/somethingwithproof/MacGTD/actions/workflows/e2e.yml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=somethingwithproof_MacGTD&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=somethingwithproof_MacGTD)
[![Release](https://img.shields.io/github/v/release/somethingwithproof/MacGTD)](https://github.com/somethingwithproof/MacGTD/releases)
[![License: MIT](https://img.shields.io/badge/license-MIT-blue)](../../../LICENSE)
[![OpenSSF Scorecard](https://api.scorecard.dev/projects/github.com/somethingwithproof/MacGTD/badge)](https://scorecard.dev/viewer/?uri=github.com/somethingwithproof/MacGTD)

**Languages:** [English](../../../README.md) · [Deutsch](../de/README.md) · [Español](../es/README.md) · [Français](../fr/README.md) · [Italiano](../it/README.md) · [Português (BR)](../pt-BR/README.md) · [Nederlands](../nl/README.md) · [Русский](../ru/README.md) · [Українська](../uk/README.md) · [日本語](../ja/README.md) · [한국어](../ko/README.md) · [简体中文](../zh-CN/README.md) · [繁體中文](../zh-TW/README.md) · [العربية](../ar/README.md) · [हिन्दी](../hi/README.md) · [Polski](../pl/README.md) · [Türkçe](../tr/README.md) · [Svenska](../sv/README.md) · [Tiếng Việt](../vi/README.md) · [Bahasa Indonesia](../id/README.md)

<details><summary>More languages (25 African &amp; Asian locales)</summary>

[Afrikaans](../af-ZA/README.md) · [አማርኛ](../am-ET/README.md) · [العربية (مصر)](../ar-EG/README.md) · [العربية (المغرب)](../ar-MA/README.md) · [বাংলা](../bn/README.md) · [فارسی](../fa/README.md) · [Filipino](../fil/README.md) · [Français (Maroc)](../fr-MA/README.md) · [Français (Sénégal)](../fr-SN/README.md) · [Hausa](../ha-NG/README.md) · [עברית](../he/README.md) · [Igbo](../ig-NG/README.md) · [Malagasy](../mg-MG/README.md) · [मराठी](../mr/README.md) · [Bahasa Melayu](../ms/README.md) · [Kinyarwanda](../rw-RW/README.md) · [Soomaali](../so-SO/README.md) · [Kiswahili](../sw-KE/README.md) · [தமிழ்](../ta/README.md) · [తెలుగు](../te/README.md) · **ไทย** · [اردو](../ur/README.md) · [isiXhosa](../xh-ZA/README.md) · [Yorùbá](../yo-NG/README.md) · [isiZulu](../zu-ZA/README.md)

</details>

**MacGTD คือชุดเวิร์กโฟลว์สำหรับ macOS สำหรับการบันทึกงาน จัดระเบียบการแจ้งเตือน และเริ่มเซสชันโฟกัสแบบจับเวลาร่วมกับแอปที่คุณใช้งานอยู่แล้ว**

พัฒนาขึ้นตามแนวคิด [Getting Things Done](https://gettingthingsdone.com/) โดยนำความสามารถในการบันทึกข้อมูลผ่านกล่องโต้ตอบ คลิปบอร์ด และการบันทึกแบบกลุ่มมาสู่ Apple Reminders รวมถึงการบันทึกกิจกรรมลงใน Calendar และคำสั่งสำหรับจัดการงาน บันทึก โปรเจกต์ และโฟกัสใน Alfred การใช้ AppleScript และ Automator ช่วยให้เวิร์กโฟลว์เนทีฟทำงานร่วมกับ macOS ได้อย่างใกล้ชิด ตัวเชื่อมต่อ API รองรับ Todoist API v1, Notion API 2026-03-11, Microsoft Graph v1.0 และ Google Keep v1 นอกจากนี้ยังมีตัวเชื่อมต่อสำหรับ Things และ OmniFocus รวมอยู่ด้วย การทดสอบบนโฮสต์จะตรวจสอบตัวเชื่อมต่อ API กับฟิกซ์เจอร์ HTTPS ในเครื่อง ส่วนความเข้ากันได้กับระบบจริงยังคงต้องใช้บัญชีของผู้ให้บริการแต่ละรายโดยเฉพาะ

## สิ่งที่คุณทำได้

- **บันทึกงานได้โดยไม่ต้องสลับแอป** ใช้ Automator Service, คีย์เวิร์ดของ Alfred หรือคลิปบอร์ดเพื่อเพิ่มงาน การบันทึกแบบกลุ่มจะสร้างรายการแจ้งเตือนหนึ่งรายการต่อหนึ่งบรรทัดที่ไม่ใช่บรรทัดว่าง
- **แปลงข้อความให้เป็นงานที่มีโครงสร้าง** แยกวิเคราะห์วันที่แบบสัมพัทธ์และ ISO เวลา ระดับความสำคัญ บริบท และโปรเจกต์โดยใช้ตัวแยกวิเคราะห์ AppleScript สำหรับการใช้งานจริงที่ใช้ร่วมกันระหว่างการบันทึกด่วนแบบเนทีฟและการบันทึกใน Calendar
- **บันทึกกิจกรรมและทบทวนอินบ็อกซ์ของคุณ** สร้างกิจกรรมใน Calendar พร้อมระบุเวลา ระยะเวลา และสถานที่ รวมถึงดำเนินการทบทวนรายสัปดาห์ห้าขั้นตอนพร้อมการระดมสมองจดลงใน Reminders
- **ทำงานในเซสชันโฟกัสแบบจับเวลา** เริ่ม ตรวจสอบสถานะ และหยุดเซสชันข้ามโพรเซสได้ ตัวจับเวลา launchd ที่เซสชันเป็นเจ้าของจะจัดการการหมดเวลาและการยกเลิก ส่วนล็อก JSONL ให้ข้อมูลวิเคราะห์ระยะเวลาการทำงาน
- **ใช้ Alfred ได้มากกว่าแค่การจัดการงาน** สร้างรายการ Reminders สำหรับโปรเจกต์ บันทึกข้อมูลอ้างอิง เปิดอินบ็อกซ์เพื่อทบทวน บันทึกข้อความจากคลิปบอร์ด และแก้ไขค่ากำหนดที่มีการตรวจสอบชนิดข้อมูล
- **ดูอินบ็อกซ์ของคุณจากแถบเมนู** ปลั๊กอินเสริมสำหรับ SwiftBar/xbar จะแสดงจำนวนรายการในอินบ็อกซ์ที่ยังไม่เสร็จสมบูรณ์ พร้อมลิงก์ไปยังเวิร์กโฟลว์การบันทึกงาน

การทำงานแบบเนทีฟได้รับการตรวจสอบบนเครื่อง Mac จริงที่โฮสต์บน GitHub โดยชุดทดสอบจะสั่งงานกล่องโต้ตอบ Automator จากนั้นอ่านข้อมูล Reminders และ Calendar กลับมาตรวจสอบ ดูขอบเขตของหลักฐานการทดสอบได้ที่ [การทดสอบและความเข้ากันได้](#testing-and-compatibility)

## เริ่มต้นใช้งานอย่างรวดเร็ว: Apple Reminders

```bash
git clone https://github.com/somethingwithproof/MacGTD.git
cd MacGTD
open workflows/apple/GTD-QuickCapture.workflow
```

เปิดเวิร์กโฟลว์ใน Automator แล้วรันเพื่อทดลองบันทึกงาน หากต้องการให้ใช้งานได้เป็น Service ให้ติดตั้งบันเดิลไว้ภายใต้ `~/Library/Services`:

```bash
mkdir -p ~/Library/Services
cp -R workflows/apple/GTD-QuickCapture.workflow ~/Library/Services/
```

กำหนดปุ่มลัดใน **System Settings → Keyboard → Keyboard Shortcuts → Services** อนุญาตการเข้าถึง Automation สำหรับ Reminders เมื่อ macOS ร้องขอ จากนั้นป้อน:

```text
Buy groceries @errands +shopping !1 due:tomorrow
```

เวิร์กโฟลว์เนทีฟจะสร้างรายการแจ้งเตือนระดับความสำคัญสูงที่ครบกำหนดในวันพรุ่งนี้ ส่งไปยังรายการ `shopping` และบันทึกบริบทไว้ หากไม่มีตัวระบุโปรเจกต์หรือบริบท การบันทึกด่วนจะใช้รายการ `Inbox`

## ไวยากรณ์การบันทึก

ตัวแยกวิเคราะห์งานแบบเนทีฟและการบันทึกงานใน Alfred รองรับตัวระบุต่อไปนี้ ตัวเชื่อมต่อของผู้ให้บริการแต่ละรายมีการรองรับฟิลด์และการกำหนดเส้นทางในแบบของตนเอง

| ข้อมูลป้อนเข้า | ความหมาย | ตัวอย่าง |
| --- | --- | --- |
| `!1`, `!2`, `!3` | ความสำคัญระดับสูง ปานกลาง หรือต่ำ | `Fix login !1` |
| `today`, `tomorrow`, `next week` | วันครบกำหนดแบบสัมพัทธ์ | `Call dentist tomorrow` |
| ชื่อวันในสัปดาห์ หรือ `next weekday` | วันครบกำหนดตามวันในสัปดาห์ | `Send report next monday` |
| `due:YYYY-MM-DD` | วันครบกำหนดแบบระบุชัดเจน | `Renew membership due:2027-03-15` |
| เวลาร่วมกับวันที่ | เวลาครบกำหนด | `Call Alex tomorrow at 3pm` |
| `@context` | ตัวระบุบริบท | `Buy milk @errands` |
| `+project` | การกำหนดเส้นทางไปยังโปรเจกต์/รายการ | `Draft outline +website` |

รองรับ `due:today` และ `due:tomorrow` ด้วยเช่นกัน สามารถใช้ตัวอักษร ตัวเลข ขีดล่าง หรือขีดกลางในตัวระบุบริบทและโปรเจกต์ได้ การบันทึกด่วนแบบเนทีฟจะให้ความสำคัญกับการกำหนดเส้นทางตามโปรเจกต์ก่อนบริบท

การบันทึกใน Calendar ใช้ `@` สำหรับสถานที่จัดกิจกรรม และรองรับระยะเวลาเป็นนาทีหรือชั่วโมง:

```text
Planning tomorrow 2pm 45m @Conference Room
```

หากไม่ได้ระบุเวลาหรือระยะเวลาอย่างชัดเจน การบันทึกใน Calendar จะใช้เวลา 9:00 AM และระยะเวลาหนึ่งชั่วโมง ในปฏิทินแรกที่เขียนข้อมูลได้

## เลือกเวิร์กโฟลว์

### เวิร์กโฟลว์เนทีฟของ Apple

| เวิร์กโฟลว์ | การทำงาน | บันเดิล |
| --- | --- | --- |
| การบันทึกด่วน | แยกวิเคราะห์ข้อความงานและสร้างรายการแจ้งเตือน | [GTD-QuickCapture](../../../workflows/apple/GTD-QuickCapture.workflow) |
| การบันทึกจากคลิปบอร์ด | สร้างรายการแจ้งเตือนจากข้อความในคลิปบอร์ด | [GTD-ClipboardCapture](../../../workflows/apple/GTD-ClipboardCapture.workflow) |
| การบันทึกแบบกลุ่ม | สร้างรายการแจ้งเตือนจากหลายบรรทัด | [GTD-BatchCapture](../../../workflows/apple/GTD-BatchCapture.workflow) |
| การบันทึกกิจกรรม | สร้างกิจกรรมใน Calendar | [GTD-EventCapture](../../../workflows/apple/GTD-EventCapture.workflow) |
| การทบทวนรายสัปดาห์ | การทบทวนแบบมีขั้นตอนและการระดมสมองลงใน Reminders | [GTD-WeeklyReview](../../../workflows/apple/GTD-WeeklyReview.workflow) |

เปิดบันเดิลใน Automator เพื่อทดลองใช้งาน หรือติดตั้งไว้ภายใต้ `~/Library/Services` เพื่อเรียกใช้งานผ่านคีย์บอร์ด Reminders และ Calendar จำเป็นต้องได้รับสิทธิ์ macOS Automation ที่เหมาะสม

### Alfred

ต้องใช้ Alfred พร้อม Powerpack สร้างแพ็กเกจจากซอร์สโค้ดปัจจุบันด้วย:

```bash
./scripts/package-alfred.sh
open dist/MacGTD.alfredworkflow
```

คุณยังสามารถดาวน์โหลดแพ็กเกจได้จาก [releases](https://github.com/somethingwithproof/MacGTD/releases) แพ็กเกจรีลีสจะสะท้อนตามซอร์สโค้ดที่ติดแท็กไว้ ฟีเจอร์ที่เพิ่มเข้าใน `main` หลังจากรีลีสจะต้องสร้างแพ็กเกจจากซอร์สโค้ดเอง

| คีย์เวิร์ด | การทำงาน |
| --- | --- |
| `task` | บันทึกงานพร้อมการแยกวิเคราะห์วันที่ บริบท โปรเจกต์ และระดับความสำคัญ |
| `note` | จัดเก็บบันทึกอ้างอิงใน Reminders |
| `project` | สร้างรายการ Reminders |
| `gtd process` | เปิด Inbox เพื่อทบทวนด้วยตนเอง |
| `clip` | บันทึกข้อความจากคลิปบอร์ด |
| `gtd focus` | เริ่มเซสชันโฟกัส ตรวจสอบสถานะ หรือหยุดเซสชัน |
| `gtd analytics` | ตรวจสอบระยะเวลาโฟกัสที่บันทึกไว้ |
| `gtd preferences` | แก้ไขค่ากำหนดของเวิร์กโฟลว์ |

```text
task Prepare slides tomorrow @work +presentation !2
gtd focus @work 25
gtd focus status
gtd focus stop
```

ค่ากำหนดจะเก็บไว้ใน `~/Library/Preferences/com.alfredgtd.plist` ส่วนสถานะและล็อกของโฟกัสจะเก็บไว้ภายใต้ `~/.gtd` ค่ากำหนดมีค่าเริ่มต้นในตัว การตรวจสอบชนิดข้อมูล การนำเข้าที่ผ่านการตรวจสอบความถูกต้อง และการเขียนแบบอะตอมมิก เซสชันโฟกัสจะไม่เปลี่ยนแปลงการตั้งค่าการแจ้งเตือนของระบบ การประมวลผล Inbox จะเปิดรายการขึ้นมาเพื่อทบทวน โดยจะไม่ย้ายหรือทำเครื่องหมายงานว่าเสร็จสิ้นโดยอัตโนมัติ

ดู [คู่มือ Alfred](../../../workflows/alfred/README.md) และ [เอกสารประกอบไลบรารี GTDLib](../../../workflows/alfred/GTDLib.scptd/README.md)

### ตัวเชื่อมต่อการบันทึกภายนอก

เวิร์กโฟลว์การบันทึกผ่าน API ทั้งสี่รายการได้รับการทดสอบผ่านกล่องโต้ตอบ Automator จริงและฟิกซ์เจอร์ TLS ในเครื่องในการทดสอบ E2E บนโฮสต์ นอกจากนี้ยังมีชุดทดสอบแบบแมนนวลแยกต่างหากสำหรับทดสอบการบันทึกข้อมูลไปยังผู้ให้บริการจริงเมื่อตั้งค่าบัญชีเฉพาะแล้ว ส่วน Things และ OmniFocus จำเป็นต้องใช้ชุดทดสอบการเชื่อมต่อเดสก์ท็อปที่มีใบอนุญาต

| เป้าหมาย | กลไก | การตั้งค่า / ซอร์สโค้ด |
| --- | --- | --- |
| Todoist | การบันทึกผ่าน API | [การตั้งค่าเวิร์กโฟลว์และ Keychain](../../../workflows/todoist/) |
| Notion | การบันทึกผ่าน Data source API | [การตั้งค่าเวิร์กโฟลว์และ Keychain](../../../workflows/notion/) |
| Things 3 | URL scheme | [เวิร์กโฟลว์](../../../workflows/things/) |
| OmniFocus | AppleScript / URL scheme | [เวิร์กโฟลว์](../../../workflows/omnifocus/) |
| Microsoft To Do | Microsoft Graph v1.0 | [เวิร์กโฟลว์](../../../workflows/microsoft/) |
| Google Keep | Workspace Keep API v1 | [เวิร์กโฟลว์](../../../workflows/google/) |

ตัวเชื่อมต่อ API ต้องมีการตั้งค่าข้อมูลรับรอง โดย Microsoft ต้องใช้การอนุญาตแบบ delegated OAuth และ Google Keep ต้องใช้สิทธิ์การเข้าถึง Workspace ที่มีคุณสมบัติตรงตามเงื่อนไข:

```bash
./workflows/todoist/setup-todoist.sh
./workflows/notion/setup-notion.sh
./workflows/microsoft/setup-microsoft.sh
./workflows/google/setup-google.sh
```

ดู [ข้อกำหนดการตั้งค่า API การย้ายข้อมูล และการอนุญาตสิทธิ์](../../../workflows/api/README.md) รหัสฐานข้อมูล Notion ที่มีอยู่เดิมจะถูกย้ายข้อมูลก็ต่อเมื่อพบแหล่งข้อมูลเพียงแหล่งเดียวเท่านั้น การบันทึกข้อมูลของ Microsoft และ Google ใช้ API อย่างเป็นทางการแทนทางลัดเบราว์เซอร์ที่ไม่ได้ระบุไว้ในเอกสาร โทเค็นการเข้าถึง OAuth ต้องได้รับการต่ออายุผ่านไคลเอนต์ OAuth ของคุณ เพย์โหลดใช้คีย์ JSON ที่ระบุชัดเจน คำขอ HTTPS ที่มีขอบเขตจำกัด และการยืนยันการตอบกลับ ข้อความแสดงข้อผิดพลาดจะยังคงรายละเอียดความล้มเหลวไว้ในขณะที่ปิดบังโทเค็น API ที่กำหนดค่าไว้ ดู [SECURITY.md](../../../SECURITY.md) สำหรับการรายงานปัญหาด้านความปลอดภัย

### แถบเมนูและ Shortcuts

[คู่มือแถบเมนู](../../../workflows/menubar/README.md) อธิบายการใช้งานปลั๊กอินเสริมสำหรับ SwiftBar/xbar ให้ติดตั้ง Apple Services ก่อน จากนั้นกำหนดค่าไดเรกทอรีปลั๊กอินในแอปแถบเมนูของคุณและลิงก์ `workflows/menubar/gtd-menubar.sh` เข้าไป

[คู่มือ Shortcuts](../../../workflows/shortcuts/README.md) ให้คำแนะนำการตั้งค่าด้วยตนเองสำหรับการบันทึกข้อความ คลิปบอร์ด และ Siri บน macOS 12+ ทั้งนี้ Shortcuts และการสั่งงานด้วยเสียง Siri อยู่นอกเหนือขอบเขตชุดทดสอบบนโฮสต์

## สถาปัตยกรรม

บันเดิล Automator ฝัง AppleScript ไว้ภายในเพื่อให้สามารถทำงานเป็น Service แบบเนทีฟได้ Alfred จะแพ็กเกจสคริปต์การทำงานและส่งข้อมูลป้อนเข้าของผู้ใช้เป็นอาร์กิวเมนต์ GTDLib เปิดให้ใช้งานการดำเนินการเนทีฟของ Reminders ที่ใช้ร่วมกันได้จากซอร์สโค้ด AppleScript ที่แก้ไขได้และบันเดิลสคริปต์ที่คอมไพล์แล้ว

- **ตัวแยกวิเคราะห์สำหรับการผลิตเพียงตัวเดียว:** `scripts/sync-native-parser.py` จะฝังตัวแยกวิเคราะห์ที่ใช้ร่วมกันลงใน Quick Capture และ Event Capture โดยการตรวจสอบความถูกต้องจะตรวจจับความคลาดเคลื่อนของซอร์สโค้ด
- **สถานะโฟกัสแบบคงอยู่:** การเรียกใช้งานที่แยกกันจะใช้สถานะเซสชันร่วมกัน โดยมีงาน launchd ที่เป็นเจ้าของและการคำนวณเวลาที่ผ่านไปแบบมีขอบเขต
- **แพ็กเกจที่ทำซ้ำได้:** การแพ็กเกจจะสร้างไฟล์เก็บถาวรใหม่ และการทดสอบจะเปรียบเทียบเนื้อหาภายในกับซอร์สโค้ด ตัวไลบรารีมีสคริปต์การคอมไพล์แยกต่างหาก
- **การทดสอบที่ตรวจสอบได้:** รายงาน JUnit บันทึกล็อกคำสั่ง และอาร์ติแฟกต์การบิลด์ที่ผ่านการทดสอบจะถูกเก็บรักษาไว้เป็นเวลา 14 วันใน GitHub Actions

| ไดเรกทอรี | ความรับผิดชอบ |
| --- | --- |
| [`workflows/`](../../../workflows/) | บันเดิลเนทีฟ ตัวเชื่อมต่อผู้ให้บริการ สคริปต์ Alfred, Shortcuts และแถบเมนู |
| [`scripts/`](../../../scripts/) | การแพ็กเกจ การคอมไพล์ไลบรารี การซิงค์ตัวแยกวิเคราะห์ และการจัดเตรียมการทดสอบบนโฮสต์ |
| [`tests/`](../../../tests/) | การตรวจสอบความถูกต้อง การตรวจสอบคอมโพเนนต์ และการทดสอบ E2E บนเดสก์ท็อปแบบเนทีฟ |
| [`.github/workflows/`](../../../.github/workflows/) | CI การทดสอบ E2E รายคืน/ด้วยตนเอง และการบำรุงรักษารีโพซิทอรี |
| [`infra/`](../../../infra/) | การตั้งค่า Mac runner ในเครื่องและบน EC2 แบบเลือกใช้; CI บนโฮสต์ไม่จำเป็นต้องใช้ส่วนนี้ |

<a name="testing-and-compatibility"></a>

## การทดสอบและความเข้ากันได้

| ขอบเขต | สภาพแวดล้อม | สิ่งที่ตรวจสอบ |
| --- | --- | --- |
| การตรวจสอบความถูกต้อง | macOS 15 และ 26 ที่โฮสต์บน GitHub | การคอมไพล์ AppleScript บันเดิล ตัวแยกวิเคราะห์สำหรับการผลิต เป้าหมายการทำงาน ค่ากำหนด สถานะโฟกัส การส่งผ่าน API ของฟิกซ์เจอร์ และการทดสอบแพ็กเกจแบบไป-กลับ |
| การตรวจสอบความปลอดภัย | Ubuntu และ macOS 15 ที่โฮสต์บน GitHub | Python CodeQL, ShellCheck และการทำฟัซซิงแบบมีขอบเขตด้วย Atheris บนตัวแยกวิเคราะห์สำหรับการผลิตที่คอมไพล์แล้ว |
| E2E ของตัวเชื่อมต่อผู้ให้บริการ | `macos-15-intel` ที่โฮสต์บน GitHub | กล่องโต้ตอบ API สำหรับการผลิตทั้งสี่รายการ การส่งผ่าน TLS การบันทึก/อ่านข้อมูลกลับของฟิกซ์เจอร์ ความล้มเหลวของ API การยกเลิก และการเลือกแหล่งข้อมูลของ Notion |
| E2E กับผู้ให้บริการจริง | การรันบน Mac ที่โฮสต์บน GitHub ด้วยตนเองพร้อมข้อมูลลับเฉพาะ | การบันทึกข้อมูลและอ่านกลับจากผู้ให้บริการจริงสำหรับ Todoist, Notion, Microsoft และ Google; จะล้มเหลวหากไม่มีบัญชี |
| การเชื่อมต่อเดสก์ท็อปที่มีใบอนุญาต | บัญชีในเครื่องเฉพาะ | การเรียกใช้งานและบันทึกข้อมูลผ่าน UI ของ Things 3, OmniFocus 4 และ Alfred |
| E2E บนเดสก์ท็อปแบบเนทีฟ | `macos-15-intel` ที่โฮสต์บน GitHub | กล่องโต้ตอบ Automator จริง; ข้อมูล Reminders และ Calendar ที่บันทึกถาวร; การทบทวนรายสัปดาห์; จำนวนรายการบนเมนู; GTDLib ที่คอมไพล์แล้ว; การทำงานเนทีฟของ Alfred ที่แพ็กเกจแล้ว; การหมดเวลาและการยกเลิกตัวจับเวลา launchd จริง |
| UI ของ Alfred แบบเลือกใช้ | บัญชีในเครื่องเฉพาะ, Alfred 5 + Powerpack | การนำเข้าเวิร์กโฟลว์ การเรียกใช้งานผ่านคีย์เวิร์ด และการอ่านข้อมูลแจ้งเตือนกลับผ่าน UI ที่มีใบอนุญาต |

[การรันปรับปรุง API ที่ได้รับการยืนยันแล้ว](https://github.com/somethingwithproof/MacGTD/actions/runs/37857977916) ผ่าน **การทดสอบตรวจสอบความถูกต้อง 35 รายการบนแต่ละแพลตฟอร์มการตรวจสอบ และการทดสอบ E2E บนเดสก์ท็อป 26 รายการ** โดยไม่มีความล้มเหลว ข้อผิดพลาด หรือการข้าม การครอบคลุมบนเดสก์ท็อปประกอบด้วยการทดสอบเนทีฟ 15 รายการและการทดสอบตัวเชื่อมต่อผู้ให้บริการ 11 รายการ รวมถึงการตรวจสอบการหมดเวลาการส่งผ่านข้อมูลจริงและ Keychain ชั่วคราว การตรวจสอบความถูกต้องยังรันการตรวจสอบโครงสร้างรีโพซิทอรีด้วย ผลลัพธ์เหล่านี้ครอบคลุมพฤติกรรมเนทีฟและฟิกซ์เจอร์ของผู้ให้บริการ แต่ไม่ได้ยืนยันความเข้ากันได้กับผู้ให้บริการจริงหรือแอปที่มีใบอนุญาต สถานะปัจจุบันแสดงอยู่ในแบดจ์ด้านบน

Pull request และการพุชไปยัง `main` จะรันการตรวจสอบความถูกต้องตามด้วย E2E แบบเนทีฟ เวิร์กโฟลว์ E2E ยังทำงานทุกคืนและเมื่อสั่งรันด้วยตนเอง รวมถึงการทดสอบตัวเชื่อมต่อผู้ให้บริการแบบกำหนดผลลัพธ์ได้ การทดสอบกับผู้ให้บริการจริงใช้เวิร์กโฟลว์ `live-e2e.yml` แบบสั่งรันด้วยตนเองแยกต่างหาก CI เริ่มต้นใช้เครื่อง Mac แบบใช้แล้วทิ้งที่โฮสต์บน GitHub ฟิกซ์เจอร์ที่แยกส่วน และซับโพรเซสที่มีขอบเขต โดยไม่จำเป็นต้องใช้รันเนอร์ที่โฮสต์เองหรือข้อมูลรับรองบัญชีภายนอกสำหรับชุดทดสอบเริ่มต้น ชุดทดสอบจริงแบบสั่งรันด้วยตนเองต้องใช้ข้อมูลลับของผู้ให้บริการเฉพาะ

macOS เวอร์ชันก่อนหน้าไม่ได้รับการตรวจสอบโดย CI ปัจจุบัน การรันกับผู้ให้บริการจริงต้องใช้ข้อมูลลับเฉพาะและยังไม่ได้รับการยืนยัน Shortcuts/Siri และแอปเดสก์ท็อปที่มีใบอนุญาตอยู่นอกเหนือชุดทดสอบเริ่มต้นบนโฮสต์ การทดสอบการทำงานเนทีฟจะทดสอบสคริปต์ Alfred ที่แพ็กเกจแล้วโดยตรง จึงไม่ได้ยืนยันความเข้ากันได้กับ UI ของ Alfred ทั้งหมด ดู [การตั้งค่าการทดสอบ ข้อกำหนดเบื้องต้น และความครอบคลุม](../../../tests/e2e/README.md)

## การแปลภาษาท้องถิ่น

ข้อความ CLI ที่แสดงต่อผู้ใช้ ตัวรันการทดสอบ และแถบเมนูมาพร้อม 45 ภาษา (`en`, `de`, `es`, `fr`, `it`, `pt-BR`, `nl`, `ru`, `uk`, `ja`, `ko`, `zh-CN`, `zh-TW`, `ar`, `hi`, `pl`, `tr`, `sv`, `vi`, `id`, `af-ZA`, `am-ET`, `ar-EG`, `ar-MA`, `fr-MA`, `fr-SN`, `ha-NG`, `ig-NG`, `mg-MG`, `rw-RW`, `so-SO`, `sw-KE`, `xh-ZA`, `yo-NG`, `zu-ZA`, `bn`, `fa`, `he`, `mr`, `ta`, `te`, `th`, `ur`, `ms`, `fil`) ภายใต้ `locales/` ผ่าน `scripts/i18n.py` โดยไม่พึ่งพาไลบรารีภายนอก การเลือกภาษาจะตรวจสอบ `--lang` จากนั้นตามด้วย `LC_ALL`, `LC_MESSAGES` และ `LANG` แล้วจึงย้อนกลับไปใช้ `en`

```bash
python3 scripts/i18n.py --lang de menubar.quick_capture
LANG=ja_JP.UTF-8 workflows/menubar/gtd-menubar.sh
```

## การพัฒนา

ติดตั้ง [mise](https://mise.jdx.dev/) และใช้เวอร์ชัน Python ที่ตรึงไว้ใน `.mise.toml`:

```bash
mise install
mise exec -- python tests/run.py validation
./scripts/package-alfred.sh
./scripts/build-gtdlib.sh
```

การตรวจสอบความถูกต้องจะเขียนรายงานไว้ภายใต้ `test-results/` ส่วนสคริปต์การบิลด์จะเขียนไปยัง `dist/` หากต้องการรันชุดทดสอบเดสก์ท็อปบนโฮสต์บน `main`:

```bash
gh workflow run e2e.yml --ref main -f test_suite=automator
```

การทดสอบ E2E บนเดสก์ท็อปในเครื่องต้องใช้บัญชีทดสอบที่ลงชื่อเข้าใช้โดยเฉพาะและสิทธิ์ตามที่อธิบายไว้ใน [คู่มือ E2E](../../../tests/e2e/README.md) สคริปต์จัดเตรียมสิทธิ์บนโฮสต์ถูกจำกัดไว้สำหรับงานที่โฮสต์บน GitHub แบบใช้แล้วทิ้งเท่านั้น

ใช้ [Conventional Commits](https://www.conventionalcommits.org/) และปฏิบัติตาม [CONTRIBUTING.md](../../../CONTRIBUTING.md) การเปลี่ยนแปลงล่าสุดถูกบันทึกไว้ใน [CHANGELOG.md](../../../CHANGELOG.md)

การควบคุมความปลอดภัย การยืนยันลายเซ็นรีลีส และข้อจำกัดของ Scorecard ที่เหลืออยู่มีเอกสารระบุไว้ใน [การประเมินความปลอดภัย](../../../docs/security-assessment.md)
เวิร์กโฟลว์การรีลีสจะสร้างและรับรองแพ็กเกจก่อนสร้างรีลีสฉบับร่าง
รวมถึงข้อมูลพิสูจน์แหล่งที่มาแบบลงนาม in-toto และบันเดิล Sigstore ที่ตรวจสอบเทียบกับคอมมิตและ ref ต้นทาง
ข้อมูลพิสูจน์แหล่งที่มาใหม่นี้ใช้กับบิลด์จากเวิร์กโฟลว์เหล่านั้นเท่านั้น ไม่รวมถึงดาวน์โหลดรุ่นเก่า

## ประวัติโปรเจกต์และใบอนุญาต

MacGTD รวบรวมรีโพซิทอรี MacGTD-Native, MacGTD-Microsoft, MacGTD-Google และ AlfredGTD เดิมเข้าไว้ด้วยกัน และเผยแพร่ภายใต้ [MIT License](../../../LICENSE)
