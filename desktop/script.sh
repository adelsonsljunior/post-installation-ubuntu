#!/bin/bash

## Atualização dos repositórios 

sudo apt update -y

### Instação dos programas

## Docker

echo
echo "----------------------------------"
echo "      INSTALANDO O DOCKER"
echo "----------------------------------"
echo

# Install packages to allow apt to use a repository over HTTPS:

sudo apt install ca-certificates curl gnupg -y

# Add Docker’s official GPG key:

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Use the following command to set up the repository:

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizando os repositórios novamente, agora com docker adicionado

sudo apt update -y

# Instalação do Docker Engine

sudo apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

# Verificando se o Docker Engine está instalado corretamente executando a hello-world imagem.

sudo service docker start

sudo docker run hello-world

## Instalação do Portainer

# First, create the volume that Portainer Server will use to store its database:

docker volume create portainer_data

# Then, download and install the Portainer Server container:

docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

## Instalação do Git 

echo
echo "---------------------------"
echo "     INSTALANDO O GIT"
echo "---------------------------"
echo

sudo apt install git -y

# Change git init default branch name

git config --global init.defaultBranch main

echo

## Instalação do Java - OpenJDK 17 

echo
echo "------------------------------"
echo "     INSTALANDO O OPENJDK"
echo "------------------------------"
echo

sudo apt install openjdk-17-jdk -y

echo

## Instalação do NodeJS via snap

echo
echo "------------------------------"
echo "     INSTALANDO O NODEJS"
echo "------------------------------"
echo

sudo snap install node --classic

echo

## Instalação do Go via snap

echo
echo "------------------------------"
echo "     INSTALANDO O GO"
echo "------------------------------"
echo

sudo snap install go --classic

echo

## Instalção do Python - PIP

echo
echo "----------------------------------"
echo "       INSTALANDO O  PIP"
echo "----------------------------------"
echo

sudo apt install python3-pip -y

pip install virtualenv

## Instalção do DBeaver

echo
echo "----------------------------------"
echo "      INSTALANDO O DBEAVER"
echo "----------------------------------"
echo


echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list

wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -

sudo apt update -y

sudo apt install dbeaver-ce -y

## Instalação do Insomnia

echo
echo "----------------------------------"
echo "      INSTALANDO O INSOMNIA"
echo "----------------------------------"
echo

# Add to sources
echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

# Refresh repository sources and install Insomnia
sudo apt update -y
sudo apt install insomnia -y

## Instalação do VS Code

echo
echo "----------------------------------"
echo "      INSTALANDO O VS CODE"
echo "----------------------------------"
echo

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

sudo apt install apt-transport-https -y
sudo apt update -y
sudo apt install code -y 

### Exibindo as versões dos programas instalados #

echo 
echo "Versão do Docker:"
echo 
docker --version

echo 
echo "Versão do Git:"
echo 
git --version

echo 
echo "Versão do Java:"
echo 
java --version

echo 
echo "Versão do NodeJs:"
echo 
node --version

echo 
echo "Versão do Go:"
echo 
go version

echo 
echo "Versão do Pip:"
echo 
pip --version

echo 
echo "Versão do DBeaver - CE:"
echo 
dbeaver-ce --version

echo
echo "Versão do Insomnia:"
echo
insomnia --version

echo
echo "Versão do VS Code:"
echo
code --version

# Este APT tem Poderes de Super Vaca.

apt moo moo moo