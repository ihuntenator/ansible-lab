#!/usr/bin/env bash

yum -y update 
yum -y install epel-release
yum -y install ansible git bind-utils sshpass python3-pip

cat << 'EOF' > /etc/ansible/hosts
[docker]
192.168.56.101
EOF

#pip3 install awxkit
