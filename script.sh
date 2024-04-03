#!/bin/bash

## Initial repository update

sudo apt update -y

## Install programs

sudo apt install git -y

## additional settings

# Change git init default branch name

git config --global init.defaultBranch main