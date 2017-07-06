# -*- mode: ruby -*-
# vi: set ft=ruby :

################################################################################################################
#                                                                                                              #
# Vagrantfile for provisioning ready-to-go Docker VM.                                                          #
#                                                                                                              #
# Author: Gilles Tosi                                                                                          #
#                                                                                                              #
# The up-to-date version and associated dependencies/project documentation is available at:                    #
#                                                                                                              #
# https://github.com/gilleslabs/learn-advanced-docker                                                          #
#                                                                                                              #
################################################################################################################


Vagrant.configure(2) do |config|



#### Not using ubuntu/trusty64 image as it doesn't have LVM enabled

	config.vm.define "opa" do |opa|
	opa.vm.box = "maxx/ubuntu16"
			config.vm.provider "virtualbox" do |v|
				v.cpus = 2
				v.memory = 2048
			end
			config.vm.provider "hyperv" do |v|
				v.cpus = 1
				v.memory = 1024
			end
        opa.vm.hostname ="opa"
		opa.vm.network "private_network", ip: "192.168.99.107"
		opa.vm.provision :shell, path: "install-docker.sh"
		opa.vm.provision :shell, path: "install-opa.sh"
    end

    config.vm.define "docker" do |docker|
	docker.vm.box = "maxx/ubuntu16"
			config.vm.provider "virtualbox" do |v|
				v.cpus = 2
				v.memory = 2048
			end
			config.vm.provider "hyperv" do |v|
				v.cpus = 1
				v.memory = 1024
			end
        docker.vm.hostname ="docker"
		docker.vm.network "private_network", ip: "192.168.99.106"
		docker.vm.provision :shell, path: "install-docker.sh"
		docker.vm.provision :shell, path: "enable-opa.sh"

    end


end
