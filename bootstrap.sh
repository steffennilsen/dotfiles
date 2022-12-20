#!/bin/bash
# inspired by https://github.com/bstollnitz/dotfiles/blob/main/install.sh
set -e

# these bootstrap scripts do set ENVs and must be sourced
source ./scripts/index.sh

# create_symlinks() {
#     # Get the directory in which this script lives.
#     script_dir=$(dirname "$(readlink -f "$0")")

#     # Get a list of all files in this directory that start with a dot.
#     files=$(find -maxdepth 1 -type f -name ".*")

#     # Create a symbolic link to each file in the home directory.
#     for file in $files; do
#         name=$(basename $file)
#         echo "Creating symlink to $name in home directory."
#         if [[ -f "$HOME/$name" ]] && rm -rf "$HOME/$name"
#         ln -s "$script_dir/$name" "~/$name"
#     done
# }

# create_symlinks

