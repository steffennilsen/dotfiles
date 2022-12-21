#!/bin/sh
set -e

# $1 root path

files=$(ls -a "$1" | grep -v -E "^[\.{1,2}|\.git|\.gitignore|script|readme.md]*$")

# while IFS= read -r file; do
#     echo "... $file ..."
# done <<< "$files"

# Create a symbolic link to each file in the home directory.
for file in "$files"; do
    [ -f "$HOME/$file" ] && rm -rf "$HOME/$file"
    ln -s "$1/$file" "$HOME/$file"
done