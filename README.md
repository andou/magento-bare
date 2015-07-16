# mage-bare
A Magento bare minimum environment provided by a vagrant-vbox-puppet configuration with landrush and librarian puppet.
<br>
With this simple configuration you'll be able to run a new Magento project inside a wirtual machine environment without the hassle of configuring it.

## What it provides
More or less these:
- Ubuntu 14.04 64 bit OS
- PHP 5.5.9
- MySQL 5.5.41 with a database named mage (username mage_user, password mageo4o4)
- Apache prefork 2.4.7 with mod_rewrite
- Magento
- Xdebug working(hopefully) on port 9000
- A local DNS entry for www.magebare.lo

## Get it working
Excited about it? It simple and fast to have everything up and running. Let's see how.
### Dependencies you need
In order to run all the stuff you'll first need installed in your machine
- Virtual Box (https://www.virtualbox.org/)
- Vagrant (https://www.vagrantup.com/)

### Virtual Box plugins
Once installed the above software, you'll need a couple of vagrant plugins: `landrush` and `librarian puppet`.
<br>
In order to do so, type in your terminal:
```shell
$ vagrant plugin install landrush
```
and 
```shell
$ vagrant plugin install vagrant-librarian-puppet
```

### Folders
We are quite ready to have everything up and running, we need to create a module folder for puppet in our project root
```shell
$ mkdir puppet/modules
```
### Create and run your virtual machine
We are ready to type
```shell
$ vagrant up
```
And wait for the machine to be created and the environment to be setted up. Take into account that it will take some time, like 10 minutes to download all the dependencies, modules and stuff.
<br>
At the end of this process you could probably have an error due to the fact that NFS is not yet installed on the guest machine. I'm working on it, please be patients, below there's a workaround.

### What's next
Out-of-the-box you'll have a dedicated url inside your DNS to `www.magebare.lo` and an apache vhost pointing to the folder `project/app/` that you can change within the `puppet/manifests/bare_minimum.pp`.
#### SSH access
If you need to access your guest machine you can do this by typing
```shell
$ ssh vagrant@www.zendbare.lo
```
Using `vagrant` as password. This is a sudoer, so you can eventually type `sudo su` to make what you want. :P
#### Installing NFS on your guest machine
Last step we need to do is to install NFS server on our machine in order to have the host machine machine inside the guest one. 
<br>
Simply log in by SSH and type
```shell
$ sudo apt-get install nfs-kernel-server
```
Exit, halt the machine by typing
```shell
$ vagrant halt
```
And restart everything by typing
```shell
$ vagrant up
```
#### Test it
If you now point your browser to `http://www.magebare.lo/` you should be able to see the Magento install page.




