# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
VM_NAME = "bus2-project"
VM_MEMORY = "1024"
VM_IP = "10.0.0.12"


Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.provider "virtualbox" do |v|
	   v.name = VM_NAME
     v.customize ["modifyvm", :id, "--memory", VM_MEMORY, "--cpus", "2"]
  end

  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = VM_NAME


  config.vm.network :private_network, ip: VM_IP, netmask: "255.255.0.0"

  # uncomment line below in case you want to access vm from external network
  config.vm.network :forwarded_port, guest: 3000, host: 3001, auto_correct: true


  config.vm.provision "shell", path: ".env/build.sh"
  config.vm.provision :shell, path: ".env/install-rvm.sh", args: "stable" #, privileged: false
  config.vm.provision :shell, path: ".env/install-ruby.sh", args: "2.2.1" #, privileged: false
  config.vm.provision "shell", path: ".env/conf.sh"

  config.vm.synced_folder File.dirname(__FILE__), "/vagrant", disabled: true
  config.vm.synced_folder File.dirname(__FILE__), "/srv/bus2", nfs: true

end