#!/bin/bash
set -e

abs_script_path="$( cd -- "$(dirname ${BASH_SOURCE[0]})" >/dev/null 2>&1 ; pwd -P )"
parent_folder="${abs_script_path%/*}"

files=$(ls -a --ignore={".","..","script",".gitignore","*.md"} "$parent_folder" \
    | tr " " "\n" \
    | sed -e "s/^/.\//" \
    )

# Create a symbolic link to each file in the home directory.
for file in $files; do
    name="$(basename $file)"
    
    [[ -f "$HOME/$name" ]] && rm -rf "$HOME/$name"
    ln -s "$parent_folder/$name" "$HOME/$name"
done
