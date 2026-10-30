
#!/bin/bash

echo "GIAI PHUONG TRINH ax + b = 0"

read -r -p "Nhap a: " a
read -r -p "Nhap b: " b

number='^-?([0-9]+([.][0-9]*)?|[.][0-9]+)$'

if ! [[ "$a" =~ $number && "$b" =~ $number ]]; then
    echo "Du lieu khong hop le"
    exit 1
fi

awk -v a="$a" -v b="$b" 'BEGIN {
    if (a == 0 && b == 0)
        print "Phuong trinh vo so nghiem"
    else if (a == 0)
        print "Phuong trinh vo nghiem"
    else
        printf "Nghiem x = %.4f\n", -b/a
}'
