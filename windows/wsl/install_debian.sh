#!/bin/bash
sudo cp ./etc/apt/* /etc/apt/
sudo apt update && sudo apt full-upgrade
sudo apt install vim curl wget git build-essential libtinfo5 neofetch zsh
git config credential.helper store
git config --global user.email "jb2483@cornell.edu"
git config --global user.name "Jai"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
cp .zshrc .vimrc .p10k.zsh ~/
#compaudit | xargs chmod g-w,o-w
