
#!/bin/bash

umask 077

folder="$HOME/.local/share/assignment4-commands"
mkdir -p "$folder"
chmod 700 "$folder"

read -r -s -p "Nhap ma: " matma
echo

if [[ -z "$matma" ]]; then
    echo "Ma khong duoc rong"
    exit 1
fi

ma=$(printf '%s' "$matma" | sha256sum | cut -d' ' -f1)
unset matma

file="$folder/$ma.sh"

if [[ ! -f "$file" ]]; then
    echo "Ma moi, tao file..."
    printf '#!/bin/bash\necho "Hello Ubuntu"\n' > "$file"
    chmod 700 "$file"
    nano "$file"
else
    echo "Da tim thay file cu"
    read -r -p "Sua file? (y/n): " answer

    if [[ "$answer" == "y" ]]; then
        nano "$file"
    fi
fi

read -r -p "Da kiem tra code, chay file? (YES/n): " ok

if [[ "$ok" == "YES" ]]; then
    bash "$file"
else
    echo "Da huy chay"
fi
