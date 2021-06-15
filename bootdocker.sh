#!/bin/bash

yum -y update
yum-config-manager --enable extras
yum install -y yum-utils device-mapper-persistent-data lvm2 curl
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce docker-ce-cli containerd.io
systemctl enable docker
systemctl start docker
systemctl status docker

DCVER=$(curl --silent "https://github.com/docker/compose/releases/latest")
VER=$(grep -Po '(?<=\/tag\/)(\d+.\d+.\d+)' <<<$DCVER)
curl -kLs "https://github.com/docker/compose/releases/download/$VER/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod 755 /usr/local/bin/docker-compose
