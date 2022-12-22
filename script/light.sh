#!/bin/sh
# $1 -- dotfiles root dir
set -e

echo 'installing dotfiles -- light'

# check for watermark
light_watermark="$HOME/.config/dotfiles/installed-light"
if [ -f "$light_watermark" ]; then
  echo 'dotfiles light install is already installed'
  echo "remove $light_watermark to rerun this script"
  exit 0
fi

makedir() {
  [ ! -d "$1" ] && mkdir "$1" || true
}

echo 'making sure certain directories exist'
makedir "$HOME/.config"
makedir "$HOME/.config/dotfiles"
makedir "$HOME/.local"
makedir "$HOME/.local/bin"
makedir "$HOME/bin"

echo 'symlinking light dotfiles'
light="$1/light"
files=$(ls -a "$light" -I '.' -I '..')
echo "$files" | tr ' ' '\n' | while read file; do
  [ -f "$HOME/$file" ] && rm -r "$HOME/$file"
  ln -s "$light/$file" "$HOME/$file"
done

echo 'creating heavy install script'
echo "\"$1/script/heavy.sh\" \"$1\"" > "$HOME/bin/dotfiles-install-heavy.sh"
chmod u+x "$HOME/bin/dotfiles-install-heavy.sh"

# watermark install and exit
touch "$light_watermark"
echo 'dotfiles are installed'
