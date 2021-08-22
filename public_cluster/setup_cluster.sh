#!/bin/bash
cp .zshrc ~/
cp ../windows/wsl/.vimrc ~/
cp ../windows/wsl/.tmux.conf ~/
cp ../windows/wsl/.alias ~/

# antigen
curl -L git.io/antigen > $HOME/git/antigen.zsh

# add following lines to bashrc
