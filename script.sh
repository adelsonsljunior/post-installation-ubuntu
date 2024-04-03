#!/bin/bash

## Initial repository update

sudo apt update -y

## Install programs

sudo apt install git -y

sudo apt install curl -y

curl -fsSL https://get.docker.com | sudo bash

sudo apt install neofetch tmux vim htop build-essential net-tools -y

# SDKMAN

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java
sdk install quarkus
sdk install kotlin

# asdf

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.0
. "$HOME/.asdf/asdf.sh"

asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs 20.12.1
asdf global nodejs 20.12.1

asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang 1.22.1
asdf global golang 1.22.1

## Additional settings

# Change git init default branch name

git config --global init.defaultBranch main