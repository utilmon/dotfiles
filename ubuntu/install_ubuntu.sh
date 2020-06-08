#!/bin/bash
sudo apt update && sudo apt full-upgrade -y
sudo apt install vim curl wget git source-highlight neofetch zsh man zsh-antigen fasd -y
sudo apt install build-essential gdb -y
# c language formatting in vscode
sudo apt install libtinfo5 -y
# python3, python-numpy, tmux
#mkdir ~/.ssh && cp ./.ssh/config ~/.ssh/ && chmod 600 ~/.ssh/config
git config credential.helper store
git config --global user.email "jb2483@cornell.edu"
git config --global user.name "Jai"
cp .zshrc .vimrc .p10k.zsh ~/
sudo chsh -s $(which zsh) # make zsh default shell
zsh
