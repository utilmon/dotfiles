/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install source-highlight antigen neofetch
mkdir ~/.ssh && cp ./.ssh/config ~/.ssh/ 
#chmod 600 ~/.ssh/config
cp .zshrc .alias .vimrc .p10k.zsh ~/

brew tap homebrew/cask-fonts
brew install --cask font-fira-code-nerd-font
