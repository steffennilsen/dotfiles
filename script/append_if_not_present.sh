#!/bin/sh
# $1 -- pattern
# $2 -- file
set -e

# looking for LACK of pattern in string
# absence of [] is intentional
if ! grep -Fxq "$1" "$2" ; then
  echo "$1" >> "$2"
fi
