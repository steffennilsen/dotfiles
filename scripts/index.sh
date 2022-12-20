#!/bin/bash
set -e

export DF_BOOTSTRAP_PATH="$(dirname -- ${BASH_SOURCE[0]})"
source "$DF_BOOTSTRAP_PATH/utils/index.sh"
source "$DF_BOOTSTRAP_PATH/dl/index.sh"