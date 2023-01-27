#!/bin/sh
set -e

echo 'installing misc'

# mkcert
wget -O "$HOME/bin/mkcert" "https://dl.filippo.io/mkcert/latest?for=linux/amd64"
chmod +x "$HOME/bin/mkcert"
