#!/bin/sh
set -e

if [ -z "cat /etc/shells | grep $(which zsh)" ]; then
  echo 'adding zsh to allowed shells'
  echo "$(which zsh)" >> /etc/shells
fi

if [ "basename $(readlink -f "/proc/$$/exe")" -eq 'zsh' ]; then
  echo 'changing default shell to zsh'
  chsh -s "$(which zsh)"
fi

if [ ! -f "$HOME/bin/antigen.zsh" ]; then
  wget -O "$HOME/bin/antigen.zsh" 'git.io/antigen'
fi
