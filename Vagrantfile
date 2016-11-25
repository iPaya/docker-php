# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "iPaya/docker"

  config.vm.provider "virtualbox" do |v|
	  v.memory = 2048
  end

  config.vm.network "private_network", ip: "192.168.17.101"
end
