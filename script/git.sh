#!/bin/bash
set -e

if [ -x "$(command -v git)" ]; then
  git config --global init.defaultBranch master
fi
