#!/bin/sh
# $1 -- distro dir
set -e

echo 'installing packages from ubuntu repo'

if [ ! -x "$(command -v apt-get)" ]; then
    echo 'apt not found' >&2
    exit 1
fi

package_file="$1/ubuntu.packages.txt"
apt-get update
#apt-get install -y "$(grep -vE '^\s*#' $package_file | tr '\n' ' ')"
apt-get install -y $(cat $package_file)

# ubuntu often have an old version of git
echo 'checking for newer version of git'
add-apt-repository -y ppa:git-core/ppa
apt-get update
apt-get install -y git
