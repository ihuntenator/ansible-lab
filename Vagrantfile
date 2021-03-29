# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define "ansible" do |ansible|
    ansible.vm.box = "centos/7"
    ansible.vm.hostname = 'ansible'
    ansible.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    ansible.vm.provision :shell, path: "bootansible.sh"
    ansible.vm.network :private_network, ip: "192.168.56.101"
    ansible.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "ansible"]
    end
  end
  config.vm.define "node" do |node|
    node.vm.box = "centos/7"
    node.vm.hostname = 'node'
    node.vm.synced_folder ".", "/vagrant", type: "virtualbox"
    node.vm.network :private_network, ip: "192.168.56.101"
    node.vm.provider :virtualbox do |v|
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--memory", 512]
      v.customize ["modifyvm", :id, "--name", "node"]
    end
  end
end
