#!/bin/sh
set -e

echo 'setting up zsh'

if [ -z "cat /etc/shells | grep $(which zsh)" ]; then
  echo 'adding zsh to allowed shells'
  echo "$(which zsh)" >> /etc/shells
fi

if [ "basename $(readlink -f "/proc/$$/exe")" = 'zsh' ]; then
  echo 'changing default shell to zsh'
  chsh -s "$(which zsh)"
fi

if [ ! -f "$HOME/bin/antigen.zsh" ]; then
  wget -O "$HOME/bin/antigen.zsh" 'git.io/antigen'
fi
