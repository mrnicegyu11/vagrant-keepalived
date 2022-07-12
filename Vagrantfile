# -*- mode: ruby -*-
# vi: set ft=ruby :

ENV["LC_ALL"] = "C"

Vagrant.configure("2") do |config|
  # We do not need any synced folder, will copy anything needed
  # through the Ansible playbook
  config.vm.synced_folder ".", "/vagrant", disabled: true

  config.vm.define "vmachine1" do |vmachine1|
    vmachine1.vm.box = "ubuntu/focal64"
    vmachine1.vm.hostname = 'vmachine1'
    vmachine1.vm.network "private_network", ip: "192.168.50.11", virtualbox__intnet: true
  end

  config.vm.define "vmachine2" do |vmachine2|
    vmachine2.vm.box = "ubuntu/focal64"
    vmachine2.vm.hostname = 'vmachine2'
    vmachine2.vm.network "private_network", ip: "192.168.50.12", virtualbox__intnet: true
  end

  config.vm.define "vmachine3" do |vmachine3|
    vmachine3.vm.box = "ubuntu/focal64"
    vmachine3.vm.hostname = 'vmachine3'
    vmachine3.vm.network "private_network", ip: "192.168.50.13", virtualbox__intnet: true
    # We provision all environment inside "vmachine3" so it is
    # done once in parallel at end
    # If it fails here, make sure ansible is properly installed on the host machine
    vmachine3.vm.provision :ansible do |ansible|
      ansible.compatibility_mode = "2.0"
      ansible.playbook = "ansible.yml"
      ansible.limit = "all"
    end
  end
end
