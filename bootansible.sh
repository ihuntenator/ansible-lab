#!/usr/bin/env bash

yum -y update 
yum -y install epel-release
yum -y install ansible git bind-utils sshpass python3-pip

# awx CLI for tower
#pip3 install awxkit
