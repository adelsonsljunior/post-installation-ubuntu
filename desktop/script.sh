#!/bin/bash

### Variáveis ###

THUMBS_UP='\U1F44D' ## Emoji de joinha 

URL_VIRTUAL_BOX=https://download.virtualbox.org/virtualbox/7.0.8/virtualbox-7.0_7.0.8-156879~Ubuntu~jammy_amd64.deb
URL_MOBGODB_COMPASS=https://downloads.mongodb.com/compass/mongodb-compass_1.40.4_amd64.deb

DIRETORIO_DOWNLOADS="$HOME/Downloads/programas"

PROGRAMAS_PARA_INSTALAR=(
  neofetch
  git
  docker-ce 
  docker-ce-cli 
  containerd.io 
  docker-buildx-plugin
  docker-compose-plugin
  dbeaver-ce
  insomnia
  apt-transport-https
  code
  vagrant
  brave-browser
  unzip
  zip
  software-properties-common
  rvm
  bison
)

### Atualizando repositórios ###

sudo apt update -y

### Adicionando repositórios externos ###

## Docker

sudo apt install ca-certificates curl gnupg -y

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch="$(dpkg --print-architecture)" signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  "$(. /etc/os-release && echo "$VERSION_CODENAME")" stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

## DBeaver - CE

echo "deb https://dbeaver.io/debs/dbeaver-ce /" | sudo tee /etc/apt/sources.list.d/dbeaver.list
wget -O - https://dbeaver.io/debs/dbeaver.gpg.key | sudo apt-key add -

## Insomnia

echo "deb [trusted=yes arch=amd64] https://download.konghq.com/insomnia-ubuntu/ default all" \
    | sudo tee -a /etc/apt/sources.list.d/insomnia.list

## VS Code

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg

## Vagrant

wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

## Brave Browser

sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list

## RVM 

sudo apt-add-repository -y ppa:rael-gc/rvm

### Atualizando repositórios ###

sudo apt update -y

### Download e instalaçao de programas externos ###
mkdir -p "$DIRETORIO_DOWNLOADS"
wget -c "$URL_VIRTUAL_BOX"      -P "$DIRETORIO_DOWNLOADS"
wget -c "$URL_MOBGODB_COMPAS"   -P "$DIRETORIO_DOWNLOADS"

## Instalando pacotes .deb baixados na sessão anterior #
sudo dpkg -i $DIRETORIO_DOWNLOADS/*.deb
rm -r "$DIRETORIO_DOWNLOADS"

## Instalar programas no apt
for nome_do_programa in ${PROGRAMAS_PARA_INSTALAR[@]}; do
  if ! dpkg -l | grep -q "$nome_do_programa"; then # Só instala se já não estiver instalado
    sudo apt install "$nome_do_programa" -y
    echo "$nome_do_programa - [INSTALADO COM SUCESSO] ${THUMBS_UP}"
  else
    echo "$nome_do_programa - [JÁ INSTALADO] ${THUMBS_UP}"
  fi
done

## SDKMAN ##

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

bash

sdk insall java 20.0.2-open

sdk install maven 3.6.3
sdk default maven 3.6.3

## RVM ##

sudo usermod -a -G rvm $USER

rvm install 3.2.2

## GVM

bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

bash

gvm install go1.4 -B
gvm use go1.4 

gvm install go1.21.4 -B
gcvm use go1.21.4

### Configurações adicionais ###

## Change git init default branch name

git config --global init.defaultBranch main

## Verificando se o Docker Engine está instalado corretamente executando a hello-world imagem.

sudo service docker start

sudo docker run hello-world

sudo groupadd docker

sudo usermod -aG docker $USER

## Instalação do Portainer

docker volume create portainer_data

docker run -d -p 8000:8000 -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest

### Finalizando com atualização e limpeza do sistema ###
sudo apt update -y && sudo apt upgrade -y
sudo apt autoclean
sudo apt autoremove -y