# -*- mode: ruby -*-
# vi: set ft=ruby :
# Author: Robert MacDavid (macdavid@cs.princeton.edu)


Vagrant.configure("2") do |config|
  ### config.vm.box = "ubuntu/trusty64"
  config.vm.box = "boxcutter/ubuntu1610"
  # a box with at least ubuntu 16.10 is necessary to install the p4 compiler

  config.vm.hostname = "p4"
  config.vm.network "private_network", ip: "192.168.33.10"
  config.ssh.forward_x11 = true

  config.vm.provider "virtualbox" do |vb|
    vb.name = "p4-vagrant"
    vb.memory = "4096"
    vb.cpus = "2"
  end

  config.vm.provision :shell, privileged: false, :path => "provision.sh"


end
