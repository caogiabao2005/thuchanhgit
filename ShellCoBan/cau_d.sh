
#!/bin/bash

echo "TIM SO LON NHAT"

read -r -p "Nhap a: " a
read -r -p "Nhap b: " b
read -r -p "Nhap c: " c

if ! [[ "$a" =~ ^-?[0-9]+$ && "$b" =~ ^-?[0-9]+$ && "$c" =~ ^-?[0-9]+$ ]]; then
    echo "Vui long nhap ba so nguyen"
    exit 1
fi

max=$a

if (( b > max )); then
    max=$b
fi

if (( c > max )); then
    max=$c
fi

echo "So lon nhat la: $max"
