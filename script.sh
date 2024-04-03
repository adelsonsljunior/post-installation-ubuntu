#!/bin/bash

## Initial repository update

sudo apt update -y

## Install programs

sudo apt install git -y

sudo apt install curl -y

## additional settings

# Change git init default branch name

git config --global init.defaultBranch main