# path
if [[ -d "$HOME/bin" ]]; then
    PATH="$HOME/bin:$PATH"
fi

if [[ -d "$HOME/.local/bin" ]]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# sourcing
if [ -n "$BASH_VERSION" ]; then
  if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
  fi
fi

# aliases
alias sudop='sudo -i env PATH=$PATH HOME=$HOME'