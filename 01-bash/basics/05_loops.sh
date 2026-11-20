#!/bin/bash
# ============================================================
# บทที่ 5: การวนซ้ำ (Loops) — ทำงานซ้ำโดยไม่ต้องก็อปโค้ด
# ============================================================

echo "=== for วนรายการที่ระบุ ==="
# โครงสร้าง: for ตัวแปร in รายการ; do ... done
for fruit in มะม่วง ส้ม กล้วย แตงโม; do
    echo "ผลไม้: $fruit"
done

echo ""
echo "=== for แบบภาษา C (ใช้ตัวเลขนับ) ==="
# รูปแบบ: for (( เริ่ม; เงื่อนไขจบ; อัพเดต ))
for (( i = 1; i <= 5; i++ )); do
    echo "รอบที่ $i"
done

echo ""
echo "=== for วนไฟล์ในโฟลเดอร์ ==="
# การใช้ * (wildcard) เพื่อหาไฟล์ — ใช้บ่อยมากในงานจริง
echo "ไฟล์ .sh ทั้งหมดในโฟลเดอร์นี้:"
for file in *.sh; do
    echo "  - $file"
done

echo ""
echo "=== while วนซ้ำเมื่อเงื่อนไขยังจริง ==="
# โครงสร้าง: while [ เงื่อนไข ]; do ... done
# เหมาะกับกรณีที่ไม่รู้ว่าจะวนกี่รอบ
count=1
while [ $count -le 3 ]; do
    echo "นับถอยหลัง: $count"
    count=$((count + 1))    # อย่าลืมเพิ่มค่า ไม่งั้นลูปไม่รู้จบ!
done

echo ""
echo "=== until วนซ้ำจนกว่าเงื่อนไขจะจริง (ตรงข้าม while) ==="
n=5
until [ $n -eq 0 ]; do
    echo "เหลือ $n วินาที"
    n=$((n - 1))
done
echo "จบการนับถอยหลัง!"

echo ""
echo "=== break และ continue ==="
# break = ออกจากลูปทันที    continue = ข้ามไปรอบถัดไป
for i in 1 2 3 4 5; do
    if [ $i -eq 3 ]; then
        continue    # ข้ามเลข 3
    fi
    if [ $i -eq 5 ]; then
        echo "เจอเลข 5 แล้ว หยุดก่อน"
        break
    fi
    echo "เลข $i"
done

echo ""
echo "=== วนอ่านไฟล์ทีละบรรทัด ==="
# รูปแบบคลาสสิก: while read ทีละบรรทัดจากไฟล์
echo "--- 3 บรรทัดแรกของ README.md ---"
head -3 README.md | while read line; do
    echo "อ่านได้: $line"
done

# ============================================================
# 🏋️ แบบฝึกหัด:
# 1. พิมพ์สูตรคูณแม่ 2 (2x1=2 ถึง 2x12=24) ด้วย for แบบ C
# 2. สร้างไฟล์ test1.txt ถึง test5.txt ด้วยลูปและคำสั่ง touch
#    แล้วลบทิ้งด้วยลูปและคำสั่ง rm
# 3. รวมเลข 1 ถึง 100 ด้วย while (คำตอบต้องได้ 5050)
# ============================================================

for (( i = 1; i <= 12; i++ )); do
    echo "2 x $i = $((2 * i))"
done

for (( i = 1; i <= 5; i++ )); do
    touch "test$i.txt"
done
ls test*.txt

for (( i = 1; i <= 5; i++ )); do
    rm "test$i.txt"
done
 
total=0
i=1
while [ "$i" -le 100 ]; do
    total=$((total + i))
    (( i++ ))
done
echo "ผลรวม 1 ถึง 5 = $total"