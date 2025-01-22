#!/bin/bash

APT_UPDATE() {
    sudo apt update -y
}

GIT_CHANGE_DEFAULT_BRANCH_NAME(){
    git config --global init.defaultBranch main
}

INSTALL_APT_PROGRAMS() {
    sudo apt install -y git curl vim htop build-essential net-tools
    sudo apt install -y apt-transport-https 
}

INSTALL_VIRTUALBOX() {
    curl https://www.virtualbox.org/download/oracle_vbox_2016.asc | gpg --dearmor >oracle_vbox_2016.gpg
    curl https://www.virtualbox.org/download/oracle_vbox.asc | gpg --dearmor >oracle_vbox.gpg
    sudo install -o root -g root -m 644 oracle_vbox_2016.gpg /etc/apt/trusted.gpg.d/
    sudo install -o root -g root -m 644 oracle_vbox.gpg /etc/apt/trusted.gpg.d/

    echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -sc) contrib" | sudo tee /etc/apt/sources.list.d/virtualbox.list

    APT_UPDATE

    sudo apt install -y linux-headers-$(uname -r) dkms virtualbox-7.0

}

INSTALL_VAGRANT() {
    wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

    APT_UPDATE

    sudo apt install vagrant -y
}

INSTALL_VSCODE() {
    sudo apt update -y
    sudo apt install software-properties-common apt-transport-https curl
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

    sudo apt update -y
    sudo apt install code -y
}

INSTALL_DOCKER() {
    curl -fsSL https://get.docker.com | sudo bash
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

UP_PORTAINER() {
    sudo docker volume create portainer_data
    sudo docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
}

INSTALL_ASDF() {
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
    . "$HOME/.asdf/asdf.sh"
    echo -e '\n. $HOME/.asdf/asdf.sh' >>~/.bashrc
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >>~/.bashrc
}

INSTALL_SDKMAN_JAVA_QUARKUS() {
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"

    sdk install java
    sdk install quarkus
}

UPDATE_AND_CLEAR_SYSTEMA() {
    sudo apt update -y && sudo apt upgrade -y
    sudo apt autoclean -y
    sudo apt autoremove -y
}

INSTALL_VSCODE
