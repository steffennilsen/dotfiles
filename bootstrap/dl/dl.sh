#/bin/bash

function dl() {
    local src="$0"
    local out="$1"

    if [[ "$D_DL" == "wget" ]]; then
        wget -O "$out" "$src"
    fi

    if [[ "$D_DL" == "curl" ]]; then
        curl -oL "$src" > "$out"
    fi
}