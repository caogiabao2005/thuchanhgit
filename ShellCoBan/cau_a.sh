
#!/bin/bash

echo "CHUONG TRINH TINH PHAN DU"

read -r -p "Nhap a: " a
read -r -p "Nhap b: " b

if ! [[ "$a" =~ ^-?[0-9]+$ && "$b" =~ ^-?[0-9]+$ ]]; then
    echo "Vui long nhap hai so nguyen"
elif (( b == 0 )); then
    echo "Loi: Khong the chia cho 0"
else
    echo "Phan du = $((a % b))"
fi
