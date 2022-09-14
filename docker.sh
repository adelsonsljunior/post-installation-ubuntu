#!/bin/bash

# Atualizando os repositórios 

sudo apt-get -y update

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

# Verificando versão do Docker instalada

docker --version

# Este APT tem Poderes de Super Vaca.

apt moo moo moo