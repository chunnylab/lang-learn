# เฟส 3: Go แบบเรียบง่ายสำหรับงาน Infra

เรียน Go ในขอบเขตที่เขียน CLI Tool ขนาดเล็กได้เอง และอ่านโค้ดเครื่องมือสาย Cloud Native (Docker, Kubernetes, Terraform) ออก

## หัวข้อที่จะสร้างในเฟสนี้

1. `01_core/`: ตัวแปร, `struct`, `slice`, `map`, Function ที่คืนค่าหลายตัว และ `if err != nil`
2. `02_pointers/`: ส่งค่า (`val`) vs ส่งที่อยู่ (`*val`) แบบใช้งานจริง
3. `03_stdlib/`: `os`, `flag`, `net/http`, `encoding/json`
4. `04_concurrency/`: `goroutine` และ `WaitGroup` สำหรับยิงเช็คหลายปลายทางพร้อมกัน
5. `05_project/`: Concurrent Health Checker ที่คอมไพล์เป็น Binary ไฟล์เดียวด้วย `go build`
