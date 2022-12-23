#!/bin/sh
set -e

echo 'installing dotfiles -- light'
root="$(dirname "$(dirname "$(readlink -fm "$0")")")"

# check for watermark
light_watermark="$HOME/.config/dotfiles/installed-light"
if [ -f "$light_watermark" ]; then
  echo 'light dotfiles are already installed'
  echo "remove $light_watermark to rerun this script"
  exit 0
fi

heavy_watermark="$HOME/.config/dotfiles/installed-heavy"
if [ -f "$heavy_watermark" ]; then
  echo 'heavy dotfiles are already installed'
  echo "remove $heavy_watermark to rerun this script"
  exit 0
fi

echo 'making sure certain directories exist'
makedir() {
  [ ! -d "$1" ] && mkdir "$1" || true
}

makedir "$HOME/.config"
makedir "$HOME/.config/dotfiles"
makedir "$HOME/bin"

echo 'symlinking light dotfiles'
light="$root/light"
files=$(ls -a "$light" -I '.' -I '..')
echo "$files" | tr ' ' '\n' | while read file; do
  [ -f "$HOME/$file" ] && rm -r "$HOME/$file"
  ln -s "$light/$file" "$HOME/$file"
done

# config git
"$root/script/git.sh"

echo 'symlinking heavy install script'
[ ! -f "$root/script/heavy.sh" ] && ln -s "$root/script/heavy.sh" "$HOME/bin/dotfiles-install-heavy.sh"

# watermark install and exit
touch "$light_watermark"
echo 'light dotfiles are installed'
echo 'use dotfiles-install-heavy.sh to set up a full environment'
