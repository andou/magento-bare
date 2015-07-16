# -*- mode: ruby -*-
# vi: set ft=ruby :

############  CONFIGURAZIONI SPECIFICHE DI PROGETTO  ###################

# Indirizzo IP
LOCAL_IP_ADDRESS = "192.168.30.22"

# Configurazioni indirizzo di test
TLD = 'lo'
HOSTNAME = 'www.magebare.lo'

# Shared Folder
FOLDER = './project'

# VirtualBox Confs
MEMORY = "2048"
CPUS = "2"

##########  DA QUI IN POI CONVEREBBE NON TOCCARE NULLA  ################

VAGRANTFILE_API_VERSION = "2"
VAGRANTFILE_VIRTUALMACHINE = "ubuntu/trusty64"

##################  CONFIGURAZIONI DI VAGRANT  #########################

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  # Macchina virtuale utilizzata
  config.vm.box = VAGRANTFILE_VIRTUALMACHINE

  # Configurazioni di rete
  config.vm.network "private_network", ip: LOCAL_IP_ADDRESS

  # Configurazioni virtual box specific per l'hw della macchina virtuale
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", MEMORY]
    vb.customize ["modifyvm", :id, "--cpus", CPUS]   
  end 

  # Cartella NFS condivisa tra host e guest
  config.vm.synced_folder FOLDER, '/vagrant', type: 'nfs'

  # Hostname
  config.vm.hostname = HOSTNAME
  
  # Configurazioni di landrush
  if Vagrant.has_plugin? 'landrush'
    config.landrush.enable
    config.landrush.tld = TLD
  end

  # Librarian Puppet
  config.librarian_puppet.puppetfile_dir = "puppet"
  config.librarian_puppet.placeholder_filename = '.gitkeep'
  config.librarian_puppet.resolve_options = {:force => true}

  # Provisioning tramite puppet
  config.vm.provision :puppet, run: "always" do |puppet|
    puppet.module_path = 'puppet/modules'
    puppet.manifests_path = 'puppet/manifests'
    puppet.manifest_file = "bare_minimum.pp"
  end
end
