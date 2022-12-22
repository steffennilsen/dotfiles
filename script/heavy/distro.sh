#!/bin/sh
# $1 -- dotfiles root dir
# $2 -- heavy script dir
set -e

# expand as needed
case $kernel_version in
    *"Ubuntu"*)
        "$2/distro/ubuntu.sh"
        ;;
    *)
        echo "Unable to install determine distro" >&2
        exit 1
esac
