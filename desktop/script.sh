#!/bin/bash

## Atualização dos repositórios 

sudo apt -y update

### Instação dos programas

## Docker


# Instalando dependências

sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

# Adicionando chave

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Configurando o repositósio

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizando os repositórios novamente, agora com docker adicionado

sudo apt-get -y update

# Instalação do Docker Engine

sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Verificando se o Docker Engine está instalado corretamente executando a hello-world imagem.

sudo service docker start

sudo docker run hello-world

## Instalação do Git 

echo
echo "---------------------------"
echo "     INSTALANDO O GIT"
echo "---------------------------"
echo

sudo apt -y install git

echo

## Instalação do Curl 

echo
echo "---------------------------"
echo "     INSTALANDO O CURL"
echo "---------------------------"
echo

sudo apt -y install curl

echo

## Instalação do Java - OpenJDK 17 

echo
echo "------------------------------"
echo "     INSTALANDO O OPENJDK"
echo "------------------------------"
echo

sudo apt -y install openjdk-17-jdk

echo

## Instalação do NodeJS 16.16.0 via snap

echo
echo "------------------------------"
echo "     INSTALANDO O NODEJS"
echo "------------------------------"
echo

sudo snap install node --classic

echo

## Instalção do Python - PIP

echo
echo "----------------------------------"
echo "         INSTALANDO O  PIP"
echo "----------------------------------"
echo

sudo apt -y install python3-pip

pip install virtualenv



## Instalção do DBeaver

echo
echo "----------------------------------"
echo "        INSTALANDO O DBeaver"
echo "----------------------------------"
echo


sudo snap install dbeaver-ce

### Exibindo as versões dos programas instalados #

echo 
echo "Versão do Git:"
echo 
git --version


echo 
echo "Versão do Curl:"
echo 
curl --version

echo 
echo "Versão do Java:"
echo 
java --version

echo 
echo "Versão do NodeJs:"
echo 

node --version

echo 
echo "Versão do pip:"
echo 

pip --version

echo
echo
echo

# Este APT tem Poderes de Super Vaca.

apt moo moo moo