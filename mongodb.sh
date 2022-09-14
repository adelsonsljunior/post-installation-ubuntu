#!/bin/bash

sudo apt -y update

wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | sudo apt-key add -

echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/6.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-6.0.list

sudo apt -y update

sudo apt -y install mongodb-org

sudo systemctl start mongod

sudo systemctl status mongod

# Este APT tem Poderes de Super Vaca.

apt moo moo moo