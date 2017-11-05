#!/usr/bin/env bash

# Update OS and install unzip
sudo apt-get Update
sudo apt-get install -y unzip

# Download consul
CONSUL_VER=0.9.3

curl https://releases.hashicorp.com/consul/${CONSUL_VER}/consul_${CONSUL_VER}_linux_amd64.zip -o consul.zip

# Install consul
unzip consul.zip

# make consul executable
sudo chmod +x consul
sudo mv consul /usr/bin/consul

# create folder structure
sudo mkdir /etc/consul.d
sudo chmod a+w /etc/consul.d