#!/bin/bash

# custom repos
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-stable

sudo apt update && sudo apt full-upgrade -y
sudo apt install vim curl wget git source-highlight neofetch zsh man zsh-antigen fasd tmux -y
#sudo apt install build-essential gdb -y
## c language formatting in vscode
#sudo apt install libtinfo5 -y

# kitty
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

# mpv, fsearch
sudo apt install mpv fsearch-trunk zathura keepassxc autokey-gtk fonts-noto-cjk -y

# texlive
sudo apt install texlive-full -y

#mkdir ~/.ssh && cp ./.ssh/config ~/.ssh/ && chmod 600 ~/.ssh/config
git config credential.helper store
git config --global user.email "jb2483@cornell.edu"
git config --global user.name "Jai"
cp .zshrc .vimrc .tmux.conf ~/
chsh -s $(which zsh) # make zsh default shell
zsh
