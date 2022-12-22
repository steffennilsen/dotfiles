#!/bin/sh
# $1 -- dotfiles root dir
set -e

heavy_dir="$1/script/heavy"

"$heavy_dir/distro.sh" "$1" "$2"
