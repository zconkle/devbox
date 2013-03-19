Aboalarm devbox
======

Vagrant Development Box for running Aboalarm


## Requirements

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - Free virtualization software 
* [Vagrant](https://www.vagrantup.com) - Tool for working with VirtualBox images


## Initial Setup

* Clone this repository `git clone https://github.com/Aboalarm/devbox.git`
* Run `vagrant up` inside the newly created directory. (the first time you run Vagrant it will fetch the virtual box image which is ~300mb. So this could take some time)
* Vagrant will now use Puppet to provision the box with the Aboalarm software stack (this could take a few minutes)
* Point aboalarm.dev to `192.168.3.3` in your hosts file of your os. 
* Done! You can verify that everything was successful by opening http://aboalarm.dev/stacktest in a browser
* Your vagrant folder is automatically shared with your VM


## Everyday Usage

* `vagrant up` starts the virtual machine and provisions it
* `vagrant suspend` will essentially put the machine to 'sleep' with `vagrant resume` waking it back up
* `vagrant reload` will reload the VM. Do this when the VM config changed. For exmpale when you changed one of the configs (e.g. php.ini, sphinx.conf, etc. or after a git pull of this repo)
* `vagrant halt` attempts a graceful shutdown of the machine and will need to be brought back with `vagrant up`
* `vagrant ssh` gives you shell access to the virtual machine


Fore more: Vagrant is [very well documented](http://docs.vagrantup.com/v2/)



##### Virtual Machine Specifications #####

* OS: Ubuntu 12.04 (precise32 box)
* Nginx       
* PHP 5.4
* MySQL 5.5
* Redis
* Beanstalkd
* supervisord
* Sphinx
* localtunnel
* Node.js
* MongoDB