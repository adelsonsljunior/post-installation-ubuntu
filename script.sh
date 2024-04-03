#!/bin/bash

## Initial repository update

sudo apt update -y

## Install programs

sudo apt install git -y

sudo apt install curl -y

curl -fsSL https://get.docker.com | sudo bash

sudo apt install neofetch tmux vim htop build-essential -y

curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java
sdk install quarkus
sdk install kotlin

## Additional settings

# Change git init default branch name

git config --global init.defaultBranch main