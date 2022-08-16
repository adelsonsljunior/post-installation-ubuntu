#!/usr/bin/env bash

# Atualização dos repositórios #

sudo apt-get update

# Instalação do Git #

echo
echo "---------------------------"
echo "     INSTALANDO O GIT"
echo "---------------------------"
echo

sudo apt install git

echo

# Configuração do Git #

git config --global user.name "coloque seu nome de usúario"
git config --global user.email coloqueseuemail

# Instalação do Java - OpenJDK 17 #

echo
echo "------------------------------"
echo "     INSTALANDO O OPENJDK"
echo "------------------------------"
echo

sudo apt install openjdk-17-jdk

echo

# Instalação do NodeJS 16.16.0 via snap#

echo
echo "------------------------------"
echo "     INSTALANDO O NODEJS"
echo "------------------------------"
echo

sudo snap install node --classic

echo

# Exibindo as versões dos programas instalados #

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
