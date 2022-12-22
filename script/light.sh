#!/bin/sh
# $1 -- dotfiles root dir
set -e

# symlink light files
light="$1/light"
files=$(ls -a "$light" -I '.' -I '..')
echo "$files" | tr ' ' '\n' | while read file; do
  [ -f "$HOME/$file" ] && rm -rf "$HOME/$file"
  ln -s "$light/$file" "$HOME/$file"
done
