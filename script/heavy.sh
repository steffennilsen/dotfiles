#!/bin/sh
# $1 -- dotfiles root dir
set -e

echo 'installing dotfiles -- light'

# check if root
if [ "$(id -u)" -ne 0 ]; then
  echo 'this script requires root access to install files' >&2
  echo 'use sudo or sudop'
  exit 1
fi

heavy_dir="$1/script/heavy"

"$heavy_dir/distro.sh" "$1"
