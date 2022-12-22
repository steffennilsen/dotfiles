#!/bin/sh
set -e

echo 'installing packages from ubuntu repo'

if [ ! -x "$(command -v apt-get)" ]; then
    echo 'apt not found' >&2
    exit 1
fi

package_file="$2/distro/ubuntu.packages.txt"
apt-get update
apt-get install -y "$(grep -vE '^\s*#' filename  | tr '\n' ' ')"

# ubuntu often have an old version of git
echo 'checking for newer version of git'
add-apt-repository -y ppa:git-core/ppa
apt-get update
apt-get install -y git
