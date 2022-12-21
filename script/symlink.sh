#!/bin/sh
set -e

# $1 root path

files=$(ls -a $1 | grep -v -E "^[\.{1,2}|\.git|\.gitignore|readme.md]*$")

# Create a symbolic link to each file in the home directory.
for file in $files; do
    name="$(basename $file)"
    
    [ -f "$HOME/$name" ] && rm -rf "$HOME/$name"
    ln -s "$1/$name" "$HOME/$name"
done