source "$HOME/.profile"

# this assumes ubuntu apt install, will modify if I use another distro
if [[ -f "/usr/share/zsh-antigen/antigen.zsh" ]]; then
    source /usr/share/zsh-antigen/antigen.zsh
    antigen init "$HOME/.antigenrc"
else
    echo "Unable to find antigen" >&2
fi

