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
	opa.vm.box = "addgene/trusty64"
			config.vm.provider "virtualbox" do |v|
				v.cpus = 2
				v.memory = 2048
			end
        opa.vm.hostname ="opa"
		opa.vm.network "private_network", ip: "192.168.99.107"
		opa.vm.provision :shell, path: "install-docker.sh"
		opa.vm.provision :shell, path: "install-opa.sh"
    end

    config.vm.define "manager" do |manager|
	manager.vm.box = "addgene/trusty64"
			config.vm.provider "virtualbox" do |v|
				v.cpus = 2
				v.memory = 2048
			end
        manager.vm.hostname ="docker"
		manager.vm.network "private_network", ip: "192.168.99.106"
		manager.vm.provision :shell, path: "install-docker.sh"
		manager.vm.provision :shell, path: "enable-opa.sh"
		manager.vm.provision :shell, inline: "sudo docker swarm init --advertise-addr 192.168.99.106"
        manager.vm.provision :shell, inline: "docker swarm join-token -q worker >/vagrant/worker-token"
		
    end
	
    config.vm.define "worker" do |worker|
	worker.vm.box = "addgene/trusty64"
			config.vm.provider "virtualbox" do |v|
				v.cpus = 2
				v.memory = 2048
			end
        worker.vm.hostname ="docker"
		worker.vm.network "private_network", ip: "192.168.99.108"
		worker.vm.provision :shell, path: "install-docker.sh"
		worker.vm.provision :shell, path: "enable-opa.sh"
		worker.vm.provision :shell, inline: "docker swarm join --token $(cat /vagrant/worker-token) --advertise-addr 192.168.99.108 192.168.99.106:2377"
    end

end