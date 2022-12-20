#!/bin/bash
set -e

# $1 source
# $2 out
# wget -O "$2" "$1"
# curl -oL "$1" > "$2"

function install_wget () {
    if [[ ! -x "$(command -v git)" ]]; then
        local kernel_version="$(uname -v)"
    
        # expand as needed
        case $kernel_version in
            *"Ubuntu"*)
                apt update && apt install wget
                ;;
            *)
                echo "Unable to install wget" >&2
                exit 1
        esac
    fi
}

if [[ -x "$(command -v wget)" ]]; then
    echo "wget found"
else
    install_wget
fi