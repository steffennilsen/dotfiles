#!/bin/bash
set -e

if [[ "basename $(readlink -f /proc/$$/exe)" != "zsh" ]]; then
    chsh -s $(which zsh)
fi

if [[ -z "cat /etc/shells | grep $(which zsh)" ]]; then
    echo "$(which zsh)" >> /etc/shells
fi

currdir="$(dirname -- ${BASH_SOURCE[0]})"
"$currdir/deps/antigen.sh"