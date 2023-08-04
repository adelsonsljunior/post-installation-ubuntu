#!/bin/bash

## Atualização dos repositórios 

sudo apt -y update

### Instação dos programas

## neofetch

sudo apt install -y neofetch

## sdkman

sudo apt install unzip zip -y

curl -s "https://get.sdkman.io" | bash
sudo source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk version

## Java via sdkman

sdk insall java 20.0.2-open

## Maven via sdkman

sdk install maven 3.6.3
sdk default maven 3.6.3