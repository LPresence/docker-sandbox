#!/bin/sh
mkdir -p /etc/apparmor.d/containers/
sudo cp /vagrant/docker-trusted /etc/apparmor.d/containers/.
sudo apparmor_parser -r -W /etc/apparmor.d/containers/docker-trusted
docker pull cseelye/linux-shell
