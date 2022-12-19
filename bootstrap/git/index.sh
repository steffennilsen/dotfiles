#!/bin/bash
set -e

# git config --global init.defaultBranch

function get_git() {
    if [[ ! -x "$(command -v git)" ]]; then
        local kernel_version="$(uname -v)"
        
        # expand as needed
        case $STR in
            *"Ubuntu"*)
                add-apt-repository ppa:git-core/ppa
                apt update
                apt install git
                ;;
            *)
                echo "Unable to install git" >&2
                exit 1
        esac
    fi
}

get_git