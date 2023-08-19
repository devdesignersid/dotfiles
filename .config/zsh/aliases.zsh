#!/bin/sh
alias zsh-update-plugins="find "$ZDOTDIR/plugins" -type d -exec test -e '{}/.git' ';' -print0 | xargs -I {} -0 git -C {} pull -q"
alias nvimrc='nvim ~/.config/nvim/'
alias config='/usr/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
alias update='update-all.sh'

# docker - postgres
alias pg-init='docker run --name postgres-playground -e POSTGRES_PASSWORD=password -e POSTGRES_USER=sid -d -p 5432:5432 postgres:14.9-alpine'
alias pg-start='docker start postgres-playground'
alias pg-play='docker exec -it postgres-playground psql -U sid'
alias pg-stop='docker stop postgres-playground'
