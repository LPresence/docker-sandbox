#!/bin/sh
curl -L https://github.com/open-policy-agent/opa-docker-authz/releases/download/v0.1.5/opa-docker-authz_linux_amd64 > opa-docker-authz
chmod u+x opa-docker-authz
sudo echo DOCKER_OPTS=\"-D --authorization-plugin=opa-docker-authz --icc=false --storage-driver=devicemapper --tls=false -H unix:///var/run/docker.sock -H tcp://$ip:2375\" >> /etc/default/docker
sudo service docker restart
sudo tee /etc/init/opa.conf<<OPA
start on (filesystem and net-device-up IFACE!=lo)
stop on runlevel [!2345]

respawn

exec /home/vagrant/opa-docker-authz -opa-url=http://192.168.99.107:8181/v1
OPA

sudo start opa
#sudo ./opa-docker-authz -opa-url=http://192.168.99.107:8181/v1 &


