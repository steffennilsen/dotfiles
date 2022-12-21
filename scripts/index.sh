#!/bin/bash
set -e

currdir="$(dirname -- ${BASH_SOURCE[0]})"

"$currdir/deps/index.sh"
"$currdir/git.sh"
"$currdir/zsh.sh"
"$currdir/asdf.sh"