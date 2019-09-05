#!/bin/bash -e

sudo yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo
sudo yum -y install docker-ce-18.06.3.ce-3.el7
sudo yum -y install containerd.io
sudo systemctl start docker
sudo yum install -y wget
sudo wget "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -O /usr/bin/docker-compose
sudo chmod +x /usr/bin/docker-compose
docker --version
wget https://bintray.com/jfrog/pipelines/download_file?file_path=installers%2Fpipelines-0.9.1.tar.gz -O installer.tar.gz
mkdir -p installer && tar -C installer -xvzf installer.tar.gz
cd installer
sudo ./pipelines install --devmode --global-password "$int_ART_keys_g_password" --rt-url "$int_art_url" --rt-username "$int_art_user" --rt-password "$int_art_apikey"
