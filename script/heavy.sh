#!/bin/sh
set -e

echo 'installing dotfiles -- heavy'
root="$(dirname "$(dirname "$(readlink -fm "$0")")")"

# check for watermark
light_watermark="$HOME/.config/dotfiles/installed-light"
if [ ! -f "$light_watermark" ]; then
  echo 'light dotfiles needs to be installed first'
  exit 0
fi

heavy_watermark="$HOME/.config/dotfiles/installed-heavy"
if [ -f "$heavy_watermark" ]; then
  echo 'heavy dotfiles are already installed'
  echo "remove $heavy_watermark to rerun this script"
  exit 0
fi

# check if root
if [ "$(id -u)" -eq 0 ]; then
  echo 'dont run as root' >&2
  exit 1
fi

# installing base deps - prefferably from distro package manager
"$root/script/heavy/distro.sh" "$root"

# config git
"$root/script/git.sh"

echo 'symlinking heavy dotfiles'
"$root/script/symlink.sh" "$root/heavy" "$HOME"

# more setup
"$root/script/heavy/misc.sh"
"$root/script/heavy/zsh.sh"
"$root/script/heavy/asdf.sh"

# watermark install and exit
touch "$heavy_watermark"
chmod a+rw "$heavy_watermark"
echo 'heavy dotfiles are installed'
