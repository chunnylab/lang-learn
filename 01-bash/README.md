# เฟส 1: Bash สำหรับงาน Production

โฟลเดอร์นี้รวมพื้นฐานและ Lab ที่เคยทำไว้ทั้งหมดมาอยู่ด้วยกัน เพื่อต่อยอดสู่การเขียนสคริปต์ระดับ Production

## สิ่งที่รวมเข้ามาแล้ว

### 1. `basics/` (จาก `bash-script-learning`)
บทเรียนพื้นฐาน 8 บท ตั้งแต่ตัวแปร, รับค่า, เงื่อนไข (`04-1_condition.sh`), ลูป, ฟังก์ชัน, อาเรย์ ไปจนถึงสคริปต์ backup (`08_backup.sh`)

### 2. `labs/` (จาก `bash-practice`)
Lab ที่เขียนฝึกเองตามลำดับ:
- `fundamental/awk/`: ฝึกใช้ `awk`
- `lab-01-basic-create-remove-files/`: สร้างและลบไฟล์พื้นฐาน
- `lab-02-create-files-with-detail/`: สร้างไฟล์พร้อมรายละเอียด
- `lab-03-pipeline/`: Pipeline สร้างไฟล์, รันไฟล์ และลบไฟล์แบบตั้งเวลา delay (`sleep`)
- `lab-04-logs/`: สร้างและวิเคราะห์ `access.log` ด้วย `awk` (ยังค้าง TODO ฟังก์ชัน `report_error_urls` ใน `analyze.sh`)

หมายเหตุ: ไม่ได้ดึง `nightmare-code/` จาก `bash-practice` เข้ามา เพราะเป็นโค้ดที่ AI สร้างไว้ดูเป็นกรณีศึกษา ไม่ใช่งานฝึกเอง

## สิ่งที่จะลุยต่อใน `ops/`

1. ปิดงาน `report_error_urls` ใน `labs/lab-04-logs/analyze.sh`
2. `01_strict_and_trap.sh`: `set -euo pipefail`, `trap` และ Exit Code
3. `02_pipes_text.sh`: `grep`, `awk`, `sed`, `xargs` กับไฟล์ Log จริง
4. `03_curl_jq.sh`: ยิง HTTP API และแกะ JSON ด้วย `jq`
5. `04_healthcheck.sh`: โปรเจคจบเฟส 1 ตรวจ Disk/Service และส่งแจ้งเตือน
