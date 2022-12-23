#!/bin/sh
# $1 -- dotfiles root dir
# $2 -- symlink src dir
set -e

files=$(ls -a "$2" -I '.' -I '..')
echo "$files" | while read file; do
  [ -f "$HOME/$file" ] && rm -r "$HOME/$file"
  ln -s "$2/$file" "$HOME/$file"
done
