#!/bin/sh
# $1 -- dotfiles root dir
set -e

echo "installing dotfiles -- light"

# make sure $HOME/bin and $HOME/.local/bin exists
[ ! -d "$HOME/bin" ] && mkdir "$HOME/bin"
[ ! -d "$HOME/.local" ] && mkdir "$HOME/.local"
[ ! -d "$HOME/.local/bin" ] && mkdir "$HOME/.local/bin"

# symlink light files
light="$1/light"
files=$(ls -a "$light" -I '.' -I '..')
echo "$files" | tr ' ' '\n' | while read file; do
  [ -f "$HOME/$file" ] && rm -rf "$HOME/$file"
  ln -s "$light/$file" "$HOME/$file"
done

echo "dotfiles are installed"
