#!/bin/bash
set -e

# $1 relative filename
if [[ -x "$(command -v realpath)" ]]; then
    echo "$(realpath $1)"
elif [[ -x "$(command -v readlink)" ]]; then
    echo "$(readlink -e $1)"
else
    echo "$(cd $(dirname $1) && pwd)/$(basename $1)"
fi
