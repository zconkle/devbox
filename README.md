devbox
======

devbox is a Vagrant development machine provisioned and preconfigured for working with PHP and the [Laravel](http://www.laravel.com) framework out of the box. From nginx, php5.4 over beanstalkd to composer it has got everything you need for Laravel 4.


## Features / Stack
Ubuntu 12.04 32bit, Nginx, PHP5.4, php-fpm, xdebug, composer, MySQL 5.5, Redis, Beanstalkd, supervisord, Sphinx, localtunnel, Node.js, MongoDB



## Requirements

These list of requirements below must be installed before proceeding to the **Initial Setup** section.

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads) - Free virtualization software 
* [Vagrant](https://www.vagrantup.com) - Tool for working with VirtualBox images


## Initial Setup

* Clone this repository `git clone https://github.com/zconkle/devbox.git`. 
* Run `vagrant up` inside the newly created directory. (the first time you run Vagrant it will fetch the virtual box image which is ~300mb. So this could take some time)
* Vagrant will now use Puppet to provision the devbox (this could take a few minutes)
* Clone/copy your Laravel projects into `www/[HOSTNAME]`. Note, the directory name will need to be the hostname you wish to access. so if you wish to access http://mysite.dev the folder name will need to be mysite.dev 
* For each directory/laravel project under www/ point the hostname to `192.168.33.3` in your hosts file of your OS. e.g. `192.168.33.3 mysite.dev [ANY-OTHER-HOST]`. If you are on a mac you will do `sudo vi /private/etc/hosts` to access this file.

## Shared Folders
The www folder is automatically synced to the VM (/var/www). This is why we clone our Laravel project into this folder. The sync works in both directions. So any files generated by Laravel (/storage folder for example) will be accessible from your host machine. 

## Credentials 
* SSH User: `vagrant` PW: `vagrant`
* MySQL User: `root` PW: `root` (access MySQL through SSH)

## Vagrant Commands

* `vagrant up` starts the virtual machine and provisions it
* `vagrant ssh` gives you shell access to the virtual machine
* `vagrant suspend` will essentially put the machine to 'sleep' with `vagrant resume` waking it back up
* `vagrant reload` will reload the VM. Do this when the VM config changed. For exmpale when you changed one of the configs (e.g. php.ini, sphinx.conf, etc. or after a git pull of this repo)
* `vagrant halt` attempts a graceful shutdown of the machine and will need to be brought back with `vagrant up`
* `vagrant halt --force` force shutdown if normal halt doesn't work
* `vagrant destroy` you broke something? this will destroy the VM and reprovisions it again completely. Takes some time.



For more: Vagrant is [very well documented](http://docs.vagrantup.com/v2/)

Please fork, improve, extend, make pull request, wrap it as a gift. Use the GitHub Issues!