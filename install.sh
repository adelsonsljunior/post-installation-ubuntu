#!/bin/bash

#VARIÁVEIS
DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

#FUNÇÕES
APT_PROGRAMS=(
    vim
    htop
    tree
    build-essential
    net-tools

    #after add repos
    code
    vagrant

)

DEPENDENCIES=(
    wget
    curl
    software-properties-common
    apt-transport-https
    zip
    unzip
)

## RESOLVENDO DEPENDÊNCIAS
for dependence in ${DEPENDENCIES[@]}; do
    if ! dpkg -l | grep -qw "$dependence"; then #Só instala se já não estiver instalado
        echo "[INFO] - $dependence não está instalado."
        echo "[INFO] - Instalando ${dependence}."
        sudo apt install $dependence -y
    else
        echo "[INFO] - $dependence já está instalado."
    fi
done

APT_UPDATE() {
    sudo apt update -y
}

INSTALL_APT_PROGRAMS() {
    echo "marceline"
}





ADD_EXTERN_REPOS() {
    #VAGRANT
    curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

    #VSCODE
    curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository -y "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
}

VSCODE_INSTALL_EXTENSIONS() {
    echo "[INFO] - Instalando extensões do vscode."
    cat ./configs/vscode/extensions.txt | xargs -L 1 code --install-extension
}

VSCODE_CONFIG() {
    echo "[INFO] - Copiando configurações do vscode."
    cp ./configs/vscode/settings.json $HOME/.config/Code/User
}

INSTALL_DOCKER() {
    echo "[INFO] - Instalando Docker."
    curl -fsSL https://get.docker.com | sudo bash
    sudo groupadd docker
    sudo usermod -aG docker $USER
}

UP_PORTAINER() {
    echo "[INFO] - Subindo Portainer."
    sudo docker volume create portainer_data
    sudo docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
}

INSTALL_ASDF() {
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
    . "$HOME/.asdf/asdf.sh"
    echo -e '\n. $HOME/.asdf/asdf.sh' >>~/.bashrc
    echo -e '\n. $HOME/.asdf/completions/asdf.bash' >>~/.bashrc
}

INSTALL_SDKMAN_JAVA() {
    echo "[INFO] - Instalando sdkman."
    curl -s "https://get.sdkman.io" | bash
    source "$HOME/.sdkman/bin/sdkman-init.sh"

    echo "[INFO] - Instalando Java."
    sdk install java
}

GIT_CHANGE_DEFAULT_BRANCH_NAME() {
    echo "[INFO] - Alterando nome da branch padrão do git."
    git config --global init.defaultBranch main
}

UPDATE_AND_CLEAR_SYSTEMA() {
    sudo apt update -y && sudo apt upgrade -y
    sudo apt autoclean -y
    sudo apt autoremove -y
}

#ADD_EXTERN_REPOS
#APT_UPDATE

#VSCODE_INSTALL_EXTENSIONS
#VSCODE_CONFIG

#INSTALL_DOCKER
#UP_PORTAINER
#INSTALL_SDKMAN_JAVA

#GIT_CHANGE_DEFAULT_BRANCH_NAME
