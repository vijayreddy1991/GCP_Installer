#!/bin/bash -e

sudo apt-get update
sudo apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
apt-get install sudo
sudo apt-get install -y docker-ce=5:18.09.5~3-0~ubuntu-xenial
sudo wget "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -O /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker --version
wget https://bintray.com/jfrog/pipelines/download_file?file_path=installers%2Fpipelines-0.9.1.tar.gz -O installer.tar.gz 
mkdir -p installer && tar -C installer -xvzf installer.tar.gz
cd installer
sudo ./pipelines install --devmode --global-password "$int_ART_keys_g_password" --rt-url "$int_art_url" --rt-username "$int_art_user" --rt-password "$int_art_apikey"
