#!/bin/bash
set -e

dir="$(dirname -- ${BASH_SOURCE[0]})"
alias DFAP="$($dir/get_abs_path.sh $dir/get_abs_path.sh)"