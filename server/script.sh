#!/bin/bash

## Atualização dos repositórios 

sudo apt -y update

### Instação dos programas

## neofetch

sudo apt install -y neofetch

## Docker 

# Instalando dependências
sudo apt -y update
sudo apt install -y ca-certificates curl gnupg

# Adicionando chave
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Configurando o repositósio
echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Atualizando os repositórios novamente, agora com docker adicionado
sudo apt -y update

# Instalação do Docker Engine
sudo apt -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

# Verificando se o Docker Engine está instalado corretamente executando a hello-world imagem.
sudo service docker start
sudo docker run hello-world


