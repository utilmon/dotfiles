sudo yum update -y
yum install zsh git tmux util-linux-user
amazon-linux-extras install docker
service docker start
usermod -a -G docker ec2-user
cp .zshrc .alias .vimrc .tmux.conf ~/
chsh -s $(which zsh)
zsh
