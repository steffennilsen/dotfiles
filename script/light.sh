#!/bin/sh
# $1 -- dotfiles root dir
set -e

echo 'installing dotfiles -- light'

light_watermark="$HOME/.config/dotfiles/installed-light"
if [ -f "$light_watermark" ]; then
  echo 'dotfiles light install is already installed'
  echo "remove $light_watermark to rerun this script"
  exit 0
fi

# make sure certain directories exist
makedir() {
  [ ! -d "$1" ] && mkdir "$1" || true
}

makedir "$HOME/.config"
makedir "$HOME/.config/dotfiles"
makedir "$HOME/.local"
makedir "$HOME/.local/bin"
makedir "$HOME/bin"

# symlink light files
light="$1/light"
files=$(ls -a "$light" -I '.' -I '..')
echo "$files" | tr ' ' '\n' | while read file; do
  [ -f "$HOME/$file" ] && rm -r "$HOME/$file"
  ln -s "$light/$file" "$HOME/$file"
done

touch "$light_watermark"
echo 'dotfiles are installed'
