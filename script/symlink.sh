#!/bin/sh
set -e

# $1 root path

files=$(ls -a --ignore={".","..","script",".gitignore","*.md"} "$1" \
    | tr " " "\n" \
    | sed -e "s/^/.\//" \
    )

# Create a symbolic link to each file in the home directory.
for file in $files; do
    name="$(basename $file)"
    
    [ -f "$HOME/$name" ] && rm -rf "$HOME/$name"
    ln -s "$1/$name" "$HOME/$name"
done