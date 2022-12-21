#!/bin/bash
set -e

currdir="$(dirname -- ${BASH_SOURCE[0]})"
kernel_version="$(uname -v)"

# expand as needed
case $kernel_version in
    *"Ubuntu"*)
        "$currdir/ubuntu.sh"
        ;;
    *)
        echo "Unable to install determine distro" >&2
        exit 1
esac