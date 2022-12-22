#!/bin/sh
set -e

install_path=$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )

"$(dirname "$0"})"/script/light.sh "$install_path"
