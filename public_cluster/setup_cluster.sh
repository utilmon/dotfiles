#!/bin/bash
cp .zshrc ~/
cp ../windows/wsl/.vimrc ../windows/wsl/.tmux.conf ../windows/wsl/.alias

# antigen
curl -L git.io/antigen > $HOME/git/antigen.zsh

# add following lines to bashrc
