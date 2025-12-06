# Deiban server setup

1. Use Balena Etcher to create usb media
    - https://www.debian.org/CD/http-ftp/ -> DVD/USB -> amd64
2. add j to sudoers `sudo usermod -aG sudo j` (Use `su` to get into root)
2. Install insync
    - `sudo apt ./insync.deb`
3. Set .ssh folder for authorized keys
    ```bash
    mkdir ~/.ssh
    chmod 700 ~/.ssh
    touch ~/.ssh/authorized_keys
    chmod 600 ~/.ssh/authorized_keys
    ```
    from windows
    `type $env:USERPROFILE\.ssh\id_rsa.pub | ssh deb "cat >> .ssh/authorized_keys"`
4. use `ip a` to find ip address (next to inet)

5. disable root login
    1. Edit the SSH config file: `sudo vi /etc/ssh/sshd_config`
    2. Find the line `#PermitRootLogin prohibit-password` or `PermitRootLogin yes`.
    3. Change it to: `PermitRootLogin no`
    4. `sudo systemctl restart ssh`
6. disable hibernate
`sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target`
7. set up firewall (not needed if you connect to router)
    ```bash
    # Allow the public port you configured
    sudo ufw allow 2222/tcp

    # Enable the firewall
    sudo ufw enable

    # Check the status
    sudo ufw status
    ```
8. install script
    ```bash
    sudo apt update
    sudo apt full-upgrade
    sudo apt install zsh git tmux vim curl
    cp .zshrc .alias .vimrc .tmux.conf ~/
    git config --global credential.helper 'store'
    chsh -s $(which zsh)
    zsh
    ```
9. install miniforge
10. remote desktop protocol (run mstsc from host windows)
```bash
sudo apt install xrdp
sudo adduser xrdp ssl-cert
sudo systemctl restart xrdp
sudo systemctl status xrdp
# optional: Configure Firewall (if UFW is active): Allow RDP traffic through.
# sudo ufw allow 3389/tcp
# sudo ufw reload
```
