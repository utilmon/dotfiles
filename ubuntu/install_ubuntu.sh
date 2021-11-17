#!/bin/bash

# custom repos
sudo add-apt-repository ppa:christian-boxdoerfer/fsearch-stable
sudo add-apt-repository ppa:tatokis/ckb-next

sudo apt update && sudo apt full-upgrade -y
sudo apt install vim curl wget git source-highlight neofetch zsh man zsh-antigen fasd tmux apt-transport-https build-essential -y
#sudo apt install build-essential gdb -y
## c language formatting in vscode
#sudo apt install libtinfo5 -y


# mpv, fsearch
sudo apt install mpv fsearch-trunk zathura keepassxc autokey-gtk fonts-noto-cjk kitty ckb-next pulseeffects gnome-tweaks imwheel -y

# texlive
#sudo apt install texlive-full -y

#use local time (windows linux time sync problem)
timedatectl set-local-rtc 1

#mkdir ~/.ssh && cp ./.ssh/config ~/.ssh/ && chmod 600 ~/.ssh/config
git config credential.helper store
git config --global user.email "jb2483@cornell.edu"
git config --global user.name "Jai"
cp .zshrc .vimrc .tmux.conf .alias ~/
#cp -r .config ~/

# xkb
cp ./xkb/symbols/us /usr/share/X11/xkb/symbols/

## custom programs

cd ~/Downloads

# firefox
sudo snap remove firefox
rm -r ~/snap/firefox

sudo apt install firefox -y

# Brave
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

# Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome-stable_current_amd64.deb

# VScode
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt update
sudo apt install code -y # or code-insiders

# Orchis-theme
git clone https://github.com/vinceliuice/Orchis-theme.git
./Orchis-theme/install.sh

# FiraCode font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraCode.zip
mkdir Fira
unzip FiraCode.zip ./Fira/
sudo cp ./Fira/* /usr/local/share/fonts
fc-cache -f -v

# mamba forge
wget https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-Linux-x86_64.sh
#sudo bash ./Mambaforge-Linux-x86_64.sh

chsh -s $(which zsh) # make zsh default shell
zsh
