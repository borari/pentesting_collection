# Need to symlink this file to ~/.zshenv so zsh will read zshrc from $ZDOTDIR
export ZDOTDIR=$HOME/.config/zsh

# XDG Compliant locations
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share

export WGETRC=$XDG_CONFIG_HOME/wget/wgetrc
export XAUTHORITY=$XDG_CONFIG_HOME/x11/Xauthority
export VIMINIT="source $XDG_CONFIG_HOME/vim/vimrc"

export EDITOR="vim"
