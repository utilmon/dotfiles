sudo yum update -y
yum install zsh git tmux util-linux-user
sudo amazon-linux-extras install docker
sudo service docker start
sudo usermod -a -G docker ec2-user
cp .zshrc .alias .vimrc .tmux.conf ~/
echo "Set password for ec2-user"
sudo passwd ec2-user
chsh -s $(which zsh)
zsh
