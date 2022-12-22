#!/bin/sh
set -e

dotfiles_path="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

"$dotfiles_path/script/light.sh" "$dotfiles_path"
