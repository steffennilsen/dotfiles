#!/bin/bash
set -e

currdir="$(dirname -- ${BASH_SOURCE[0]})"

# Get a list of all files in this directory that start with a dot.
files=$(find -maxdepth 1 -type f -name ".*")

# Create a symbolic link to each file in the home directory.
for file in $files; do
    name=$(basename $file)
    echo "Creating symlink to $name in home directory."
    if [[ -f "$HOME/$name" ]] && rm -rf "$HOME/$name"
    ln -s "$currdir/$name" "~/$name"
done