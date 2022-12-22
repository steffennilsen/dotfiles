#!/bin/sh
# $1 -- dotfiles root dir
set -e

echo "$HOME"
echo 'installing dotfiles -- heavy'

# check if root
if [ "$(id -u)" -ne 0 ]; then
  echo 'this script requires root access to install files' >&2
  echo 'use sudo or sudop'
  exit 1
fi

# installing base deps - prefferably from distro package manager
# "$heavy/distro.sh" "$1"

# config git
"$1/script/git.sh"

echo 'symlinking heavy dotfiles'
files=$(ls -a "$1/heavy" -I '.' -I '..')
echo "$files" | tr ' ' '\n' | while read file; do
  echo "$file"
  [ -f "$HOME/$file" ] && rm -r "$HOME/$file"
  ln -s "${1}/heavy/${file}" "$HOME/$file"
done

# more setup
"$1/script/heavy/zsh.sh"
