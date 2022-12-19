#!/bin/bash
set -e

export D_DL=""

function get_dl() {
    [[ -x "$(command -v curl)" ]] && D_DL="curl"
    [[ -x "$(command -v wget)" ]] && D_DL="wget"

    if [[ "$D_DL" ]]; then
        echo "$D_DL found"
    else
        echo "Missing dependency: wget | curl" >&2
        exit 1
    fi
}

get_dl