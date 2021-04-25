#!/usr/bin/env bash

yum -y update 
yum -y install epel-release
yum -y install ansible git bind-utils sshpass python3-pip

cat << 'EOF' > /etc/hosts
192.168.56.102 node node"
EOF

cat << 'EOF' > /etc/ansible/hosts
[docker]
192.168.56.102
EOF

# setup SSH keys
echo "vagrant" > ~/password.txt
ssh-keygen -q -t rsa -b 2048 -N "" -C "ansible access target" -f ~/.ssh/id_rsa
sshpass -f ~/password.txt ssh-copy-id -i ~/.ssh/vagrant vagrant@node
rm -rf ~/password.txt
#cp /vagrant/ansible-known_hosts ~/.ssh/known_hosts

#pip3 install awxkit
