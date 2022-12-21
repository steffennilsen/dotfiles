#!/bin/bash
set -e

if [[ ! -x "$(command -v apt)" ]]; then
    echo "apt not found" >&2
    exit 1
fi

currdir="$(dirname -- ${BASH_SOURCE[0]})"
files=$(grep -vE "^\s*#" "${currdir}/apt.packages.txt"  | tr "\n" " ")

sudo bash<<EOF
apt update
apt install -y "$(files)"
EOF

# ubuntu often have an old version of git
# get from official repo
sudo bash<<EOF
add-apt-repository -y ppa:git-core/ppa
apt update
apt install -y git
EOF