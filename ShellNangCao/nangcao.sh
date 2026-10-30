
#!/bin/bash

# Ham kiem tra so nguyen to
isPrime() {
    local n=$1
    local i

    [[ "$n" =~ ^[0-9]+$ ]] || return 1
    (( n >= 2 )) || return 1

    for ((i=2; i*i<=n; i++)); do
        if (( n % i == 0 )); then
            return 1
        fi
    done
    return 0
}

# Ham greeting
greeting() {
    echo "Xin chao $1!"
}

case "${1:-}" in

1)
    read -r -p "Nhap ten user: " u
    if [[ "$u" == "$(whoami)" ]]; then
        echo "Day la user hien hanh"
    else
        echo "Khong phai user hien hanh"
    fi
    ;;

2)
    d="$(pwd -P)"
    if [[ -d "$d" && -r "$d" && -w "$d" && -x "$d" ]]; then
        echo "Vung lam viec hop le: $d"
    else
        echo "Vung lam viec khong hop le"
    fi
    ;;

3)
    read -r -p "Nhap ten: " name
    greeting "$name"
    ;;

4)
    read -r -p "Nhap ten thu muc goc: " d
    if [[ -z "$d" ]]; then
        echo "Ten thu muc khong duoc rong"
        exit 1
    fi
    mkdir -p -- "$d/TaiLieu" "$d/MaNguon" "$d/KetQua"
    tree "$d"
    ;;

5)
    read -r -p "Nhap so n: " n
    if isPrime "$n"; then
        echo "$n la so nguyen to"
    else
        echo "$n khong phai so nguyen to"
    fi
    ;;

6)
    read -r -p "Nhap ten file: " f
    if [[ -f "$f" && -x "$f" ]]; then
        echo "File co quyen thuc thi"
    else
        echo "File khong co quyen thuc thi hoac khong ton tai"
    fi
    ;;

7)
    read -r -p "Nhap thu muc: " d
    if [[ ! -d "$d" ]]; then
        echo "Thu muc khong ton tai"
        exit 1
    fi
    echo -n "So file: "
    find "$d" -mindepth 1 -maxdepth 1 -type f | wc -l
    echo -n "So thu muc con: "
    find "$d" -mindepth 1 -maxdepth 1 -type d | wc -l
    ;;

8)
    echo -n "So tai khoan he thong: "
    getent passwd | wc -l
    ;;

9)
    if [[ -e filechay.sh ]]; then
        echo "filechay.sh da ton tai, khong ghi de"
        exit 1
    fi
    printf '#!/bin/bash\necho "Hello Ubuntu 26"\n' > filechay.sh
    chmod +x filechay.sh
    ./filechay.sh
    ;;

10)
    echo "CANH BAO: Se tao 10 user that tren Ubuntu"
    read -r -p "Nhap YES de xac nhan: " confirm
    if [[ "$confirm" == "YES" ]]; then
        for i in $(seq -w 1 10); do
            u="svlab$i"
            if id "$u" &>/dev/null; then
                echo "$u da ton tai"
            else
                sudo useradd -m "$u"
                echo "Da tao $u"
            fi
        done
    else
        echo "Da huy"
    fi
    ;;

*)
    echo "Cach chay: bash nangcao.sh [1-10]"
    ;;

esac
