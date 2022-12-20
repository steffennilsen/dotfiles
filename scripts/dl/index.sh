#!/bin/bash
set -e

if [[ -x "$(command -v curl)" && "$(command -v wget)" ]]; then
    dir=$(dirname -- ${BASH_SOURCE[0]})
    alias DFDL="$(DFAP $dir/dl.sh)"
else
    echo "Missing dependency: wget | curl" >&2
    exit 1
fi