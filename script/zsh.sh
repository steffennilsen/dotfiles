#!/bin/bash
set -e

if [[ "basename $(readlink -f /proc/$$/exe)" != "zsh" ]]; then
    sudo chsh -s $(which zsh)
fi

if [[ -z "cat /etc/shells | grep $(which zsh)" ]]; then
    sudo echo "$(which zsh)" >> /etc/shells
fi

wget "$HOME/bin/antigen.zsh" "git.io/antigen"