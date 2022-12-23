#!/bin/sh
set -e

echo 'installing dotfiles -- heavy'
root="$(dirname "$(dirname "$(readlink -fm "$0")")")"
echo "$root"

# check for watermark
light_watermark="$HOME/.config/dotfiles/installed-light"
if [ ! -f "$light_watermark" ]; then
  echo 'light dotfiles needs to be installed first'
  exit 0
fi

heavy_watermark="$HOME/.config/dotfiles/installed-heavy"
if [ -f "$heavy_watermark" ]; then
  echo 'dotfiles heavy is already installed'
  echo "remove $heavy_watermark to rerun this script"
  exit 0
fi

# check if root
if [ "$(id -u)" -ne 0 ]; then
  echo 'this script requires root access to install files' >&2
  echo 'use sudo or sudop'
  exit 1
fi

# installing base deps - prefferably from distro package manager
"$root/script/heavy/distro.sh" "$root"

# config git
"$root/script/git.sh"

echo 'symlinking heavy dotfiles'
files=$(ls -a "$root/heavy" -I '.' -I '..')
echo "$files" | tr ' ' '\n' | while read file; do
  [ -f "$HOME/$file" ] && rm -r "$HOME/$file"
  ln -s "$root/heavy/$file" "$HOME/$file"
done

# more setup
"$root/script/heavy/zsh.sh"
"$root/script/heavy/asdf.sh"

# watermark install and exit
touch "$heavy_watermark"
echo 'heavy dotfiles are installed'
