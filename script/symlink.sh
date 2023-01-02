#!/bin/sh
# $1 -- src
# $2 -- target
set -e

files=$(ls -a "$1" -I '.' -I '..' -I 'bin')
echo "$files" | while read file; do
  [ -f "$2/$file" ] && rm -r "$2/$file"
  ln -s "$1/$file" "$2/$file"
done
