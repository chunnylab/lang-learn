# lang-learn

แผนการเรียนและคลังแบบฝึกหัดภาษาโปรแกรมสำหรับงาน Cloud, DevOps และ SysAdmin เน้นความเรียบง่ายและใช้งานจริง โดยรวมงานฝึก Bash เดิมจาก `bash-script-learning` และ `bash-practice` เข้ามาไว้ในที่เดียวเพื่อต่อยอดไปยัง Python, Go และความรู้ฝั่ง Ops

## สรุปการตัดสินใจ: ภาษาไหนควรเรียน ภาษาไหนข้ามได้

| ภาษา | ระดับที่ควรทำได้ | เหตุผลสำหรับสาย Cloud / DevOps / SysAdmin |
| :--- | :--- | :--- |
| **Bash** | ✅ เขียนเองคล่อง (ต่อยอด) | ใช้ทุกวันบน Linux server, CI/CD และแก้ปัญหาหน้างาน |
| **Python** | ✅ เขียนเองคล่อง (ภาษาหลัก) | มาตรฐานงาน Automation, AWS (`boto3`), API, Lambda และอยู่ใน CV แล้ว |
| **Go** | ✅ เขียนเครื่องมือเล็กๆ และอ่านโค้ดได้ | ภาษาหลักของ Docker, Kubernetes, Terraform โครงสร้างเรียบง่าย |
| **SQL / YAML / JSON / Regex** | ✅ ใช้งานคล่อง | เจอทุกวันใน Config, Log, Database และ Infrastructure as Code |
| **JS / TypeScript / Java** | ⚠️ อ่านออกและแก้จุดเล็กๆ ได้ | มีพื้นฐาน Concept อยู่แล้ว แค่พออ่าน Stack trace, ปรับ Memory JVM หรือแก้ Cloudflare Workers |
| **Rust** | ❌ ยังไม่ต้องเรียน (ใช้ AI ช่วยได้) | ใช้เวลาเรียนสูง (Ownership, Borrow Checker) และงาน Junior ถึง Mid สายนี้แทบไม่บังคับเขียนเอง |
| **C / C++** | ❌ ไม่ต้องหัดเขียนเอง | สายงานนี้ไม่ได้เขียน Kernel หรือ Driver เอง แค่เข้าใจ Concept ฝั่ง Linux OS ก็พอ |

### ทำไมถึงยังไม่ควรลุย Rust และ C/C++ ตอนนี้

Rust ออกแบบมาสำหรับงานระบบที่คุมหน่วยความจำละเอียด ซึ่งต้องใช้เวลาฝึกนานกว่าจะได้ผลลัพธ์เทียบเท่า Python หรือ Go ถ้างานจำเป็นต้องใช้เครื่องมือที่เขียนด้วย Rust สามารถให้ AI ช่วยเขียนและเราตรวจด้วย Test แทนได้

ส่วน C และ C++ สิ่งที่คนทำงาน SysAdmin หรือ DevOps ต้องรู้จริงไม่ใช่การเขียนโค้ด C แต่คือแนวคิดของระบบปฏิบัติการที่อยู่เบื้องหลัง เช่น Process, Thread, Exit Code, File Descriptor, Out of Memory (OOM) และการคอมไพล์โปรแกรมจาก Source เวลาแก้ปัญหาบนเซิร์ฟเวอร์

---

## แนวคิดหลัก: เรียน 1 โครงสร้าง ใช้ข้ามได้ทุกภาษา

ภาษาส่วนใหญ่ใช้แกนหลักแค่ 7 อย่างเหมือนกันหมด ต่างกันแค่ไวยากรณ์และจุดแข็ง เมื่อเทียบกับ Bash ที่เคยเขียนแล้วจะเห็นภาพเร็วขึ้น

| แกนหลัก | Bash | Python | Go |
| :--- | :--- | :--- | :--- |
| ตัวแปร | `name="web"` | `name = "web"` | `name := "web"` |
| เงื่อนไข | `if [ "$a" -eq 1 ]; then` | `if a == 1:` | `if a == 1 {` |
| ลูป | `for x in "${arr[@]}"; do` | `for x in arr:` | `for _, x := range arr {` |
| ฟังก์ชัน | `check() { ... }` | `def check():` | `func check() error {` |
| รายการข้อมูล | Array `("a" "b")` | `list`, `dict` | `slice`, `map`, `struct` |
| การจัดการ Error | `set -e`, `$?` | `try / except` | `if err != nil` |
| การรันงาน | รันตรงผ่าน Shell | รันผ่าน Python runtime | คอมไพล์เป็น Binary ไฟล์เดียว |

กฎการเลือกใช้หน้างานแบบสั้นๆ:
- สั่งงาน Linux ต่อท่อคำสั่งสั้นๆ (ไม่เกิน ~50 บรรทัด) ใช้ **Bash**
- จัดการข้อมูล JSON, ยิง API, คุยกับ AWS/Cloudflare, เขียน Automation ใช้ **Python**
- สร้าง CLI Tool ที่ส่งไปรันบนเครื่องอื่นได้เลยโดยไม่ต้องลง Python/Library เพิ่ม หรือรันเช็คหลายเครื่องพร้อมกัน ใช้ **Go**

---

## โครงสร้างโฟลเดอร์และแผน 4 เฟส (8 ถึง 10 สัปดาห์)

```text
lang-learn/
├── README.md                  # แผนการเรียนหลัก (ไฟล์นี้)
├── 01-bash/
│   ├── README.md              # แผนเฟส 1 และรายการ Lab ที่รวมเข้ามา
│   ├── basics/                # รวมจาก bash-script-learning (01 ถึง 08)
│   ├── labs/                  # รวมจาก bash-practice (awk, lab-01 ถึง lab-04)
│   └── ops/                   # บทเรียนต่อยอด Bash สำหรับงาน Production
├── 02-python/                 # เฟส 2: Python สำหรับ Cloud และ DevOps
├── 03-go/                     # เฟส 3: Go สำหรับ CLI และ Infra Tools
└── 04-ops-concepts/           # เฟส 4: SQL, Linux/OS Concepts และ AI Code Review
```

### เฟส 1: Bash สำหรับงาน Production (`01-bash/`, สัปดาห์ที่ 1 ถึง 2)

- ปิดงานค้างใน `01-bash/labs/lab-04-logs/analyze.sh` (`report_error_urls`)
- Strict Mode และ Error Handling: `set -euo pipefail`, `trap`, Exit Code
- Pipe และ Text Processing: `grep`, `awk`, `sed`, `sort`, `uniq`, `xargs`
- JSON และ HTTP จาก Terminal: `curl` คู่กับ `jq`
- งานระบบ: `systemd`, `cron`, `ssh`, เช็ค Disk/CPU/Memory
- โปรเจคจบเฟส 1: สคริปต์ตรวจสุขภาพเซิร์ฟเวอร์และแจ้งเตือนผ่าน Webhook เมื่อ Disk เต็มหรือ Service ล่ม

### เฟส 2: Python สำหรับ Cloud และ DevOps (`02-python/`, สัปดาห์ที่ 3 ถึง 6)

- แกนภาษา: `list`, `dict`, `set`, `if`, `for`, `def`, List Comprehension, `None`
- ไฟล์และข้อความ: `pathlib`, `json`, `yaml`, `csv`, `re`
- Error Handling และ Logging: `try/except`, `raise`, `logging`
- คุยกับโลกภายนอก: `subprocess`, `requests`/`urllib`, `os.environ`
- โครงสร้างและ Testing: `venv`, `uv`/`pip`, `argparse`, `pytest`
- Cloud Automation: คุม AWS ด้วย `boto3`
- โปรเจคจบเฟส 2: CLI Tool ตรวจสอบ Resource ที่เปิดค้างไว้บน AWS/Cloudflare พร้อม Unit Test และ GitHub Actions

### เฟส 3: Go แบบเรียบง่ายสำหรับงาน Infra (`03-go/`, สัปดาห์ที่ 7 ถึง 8)

- แกนภาษาและ Type System: `struct`, `slice`, `map`, `if err != nil`
- Pointer พื้นฐาน (`val` vs `*val`)
- Standard Library: `os`, `flag`, `net/http`, `encoding/json`
- Concurrency พื้นฐาน: `goroutine` และ `WaitGroup`
- Cross-compile ด้วย `go build` เป็น Binary ไฟล์เดียว
- โปรเจคจบเฟส 3: Concurrent Health Checker ที่รับรายชื่อ URL จากไฟล์แล้วยิงเช็คพร้อมกัน

### เฟส 4: ความรู้เสริมสำหรับสัมภาษณ์และหน้างาน (`04-ops-concepts/`, สัปดาห์ที่ 9 ถึง 10)

- SQL พื้นฐานสำหรับสาย Ops: `SELECT`, `WHERE`, `JOIN`, `GROUP BY`, `EXPLAIN`, Backup/Restore
- Linux/C Concepts สำหรับ SysAdmin: Process/Signal (`SIGTERM` vs `SIGKILL`), Exit Code, OOM Killer, File Descriptor (`ulimit`, `lsof`), Socket (`ss`)
- การอ่านและตรวจโค้ดที่ AI เขียน: จับ Hardcoded secret, Command injection, Error ที่ถูกกลืน และ Race condition

---

## กติกาการฝึกเพื่อให้ใช้หางานได้จริง

1. **เขียนเองก่อนเปิด AI**: ลองเขียนแบบฝึกหัดเองจนรันได้หรือติดจริงก่อน ค่อยให้ AI อธิบายจุดที่ติด
2. **อธิบายโค้ดกลับเป็นคำพูดได้**: ทุกไฟล์ที่เขียนเสร็จ ต้องอธิบายได้ว่าแต่ละส่วนทำอะไรและถ้าพังจะเกิดอะไรขึ้น
3. **ผูกกับงานจริงใน CV**: หลังจบเฟส 2 ให้ลองเปิดอ่านโค้ดในโปรเจคของตัวเอง (เช่น `chunnylab-music-studio` หรือ `a440`) โดยไม่พึ่ง AI เพื่อเช็คว่าเข้าใจโครงสร้างจริงแล้ว
