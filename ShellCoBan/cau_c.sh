
#!/bin/bash

echo "KIEM TRA HAI SO CUNG DAU"

read -r -p "Nhap a: " a
read -r -p "Nhap b: " b

if ! [[ "$a" =~ ^-?[0-9]+$ && "$b" =~ ^-?[0-9]+$ ]]; then
    echo "Vui long nhap hai so nguyen"
elif (( a == 0 || b == 0 )); then
    echo "Co so bang 0, khong xet cung/trai dau"
elif (( (a > 0 && b > 0) || (a < 0 && b < 0) )); then
    echo "Hai so cung dau"
else
    echo "Hai so trai dau"
fi
