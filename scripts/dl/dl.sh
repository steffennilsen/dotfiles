#/bin/bash
set -e

# $1 source
# $2 out

if [[ -x "$(command -v wget)" ]]; then
    wget -O "$2" "$1"
elif [[ -x "$(command -v curl)" ]]; then
    curl -oL "$1" > "$2"
fi