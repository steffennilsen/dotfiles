#!/bin/bash
set -e

git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf" --branch v0.11.0

PATH="$HOME/.asdf/bin/:$PATH"

asdf plugin add nodejs

asdf install nodejs 18.12.1
asdf global nodejs 18.12.1