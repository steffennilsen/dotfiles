#!/bin/sh
# $1 -- dotfiles root dir
set -e

distro_dir="$1/script/heavy/distro"
kernel_version="$(uname -v)"

# expand as needed
case $kernel_version in
    *"Ubuntu"*)
        sudop "$distro_dir/ubuntu.sh" "$distro_dir"
        ;;
    *)
        echo "Unable to install determine distro" >&2
        exit 1
esac
