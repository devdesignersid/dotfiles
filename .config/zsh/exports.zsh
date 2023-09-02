#!/bin/sh
HISTSIZE=1000000
SAVEHIST=1000000
export EDITOR="nvim"
export TERMINAL="alacritty"
export BROWSER="orion"
export PATH="$HOME/.local/bin:$PATH"
export MANPAGER='nvim +Man!'
export MANWIDTH=999
export MANPAGER="nvim +Man!"
export MANWIDTH=999
export GOPATH=$HOME/.local/share/go
export PATH="/usr/local/sbin:$PATH"

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
