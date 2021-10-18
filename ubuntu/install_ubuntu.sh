#!/bin/bash

# custom repos
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-stable
sudo add-apt-repository ppa:tatokis/ckb-next

sudo apt update && sudo apt full-upgrade -y
sudo apt install vim curl wget git source-highlight neofetch zsh man zsh-antigen fasd tmux -y
#sudo apt install build-essential gdb -y
## c language formatting in vscode
#sudo apt install libtinfo5 -y


# mpv, fsearch
sudo apt install mpv fsearch-trunk zathura keepassxc autokey-gtk fonts-noto-cjk kitty ckb-next pulseeffects -y

# texlive
#sudo apt install texlive-full -y

#mkdir ~/.ssh && cp ./.ssh/config ~/.ssh/ && chmod 600 ~/.ssh/config
git config credential.helper store
git config --global user.email "jb2483@cornell.edu"
git config --global user.name "Jai"
cp .zshrc .vimrc .tmux.conf .alias ~/
chsh -s $(which zsh) # make zsh default shell
zsh
