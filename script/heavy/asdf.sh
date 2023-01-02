#!/bin/sh
set -e

# expand as needed, nodejs is my most used framework
asdf_version='v0.11.0'
default_nodejs_version='18.12.1'

if [ ! -d "$HOME/.asdf" ]; then
  echo 'installing asdf'
  git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch "$asdf_version"
fi

PATH="$HOME/.asdf/bin:$PATH"

echo "installing asdf plugins"
asdf plugin add nodejs

echo 'installing asdf frameworks'
asdf install nodejs "$default_nodejs_version"

echo 'setting asdf globals'
asdf global nodejs "$default_nodejs_version"
