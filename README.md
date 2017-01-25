# Vagrant docker-sandbox

Vagrant learn-advanced-docker creates ready-to-go [Docker] (https://www.docker.com/) VM.

The Vagrantfile creates a [Docker] (https://www.docker.com/) Machine with below components installed

+ **Docker Engine**
+ **Docker Compose**


Once Docker launch it runs Docker Security Benchmark.

## Requirements

- [VirtualBox](https://www.virtualbox.org/wiki/Downloads). Tested on 5.1.0, but should also work on 5.0.20+ release.
- [Vagrant](http://www.vagrantup.com/downloads.html). Tested on 1.8.4

The VM is provisioned using addgene/trusty64 (Ubuntu 14.04 Trusty Tahr) from [atlas.hashicorp.com] (https://atlas.hashicorp.com/) images, thus your workstation must have a direct internet access. 

## VMs details

VM | vCPU/vRAM | IP Address| user/password | root / Administrator password |
---|---|---|---|---|
**docker** | 2vCPU/2048MB | 192.168.99.106 | vagrant/vagrant | vagrant |
+ **Recommended hardware :** Computer with Multi-core CPU and 4GB+ memory
+ **VM Sizing :** VM can be downsized to 1vCPU an 1024MB with no specific experience degradation
## Installation

#### Getting started:

Run the commands below:

	git clone https://github.com/gilleslabs/docker-sandbox
	cd learn-csa


###### Launching advanced-docker ready-to-go VM:

1. Run the command below:

	```
	vagrant up
	```

2. The setup will take some time to finish (approximatively 5-30 minutes depending on your hardware and Internet connection speed). Sit back and enjoy!

3. When the setup is done you can connect to your VM using crentials and start discovering docker :). 


## Know issues


## Credits


## MIT

Copyright (c) 2016 Gilles Tosi

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE

