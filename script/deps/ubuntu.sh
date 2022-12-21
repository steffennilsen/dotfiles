#!/bin/bash
set -e

if [[ ! -x "$(command -v apt)" ]]; then
    echo "apt not found" >&2
    exit 1
fi

apt update
apt install -y coreutils gawk sed
apt install -y python3
apt install -y wget curl software-properties-common
apt install -y zsh zsh-antigen

# ubuntu often have an old version of git
# get from official repo
add-apt-repository -y ppa:git-core/ppa
apt update
apt install -y git