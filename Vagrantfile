# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

# Grab the name of the default interface
#$default_network_interface = `ip route | grep -E "^default" | awk '{printf "%s", $5; exit 0}'`

#pref_interface = ['en2: USB Ethernet', 'en0: Wi-Fi (AirPort)']
#vm_interfaces = %x( VBoxManage list bridgedifs | grep ^Name ).gsub(/Name:\s+/, '').split("\n")
#pref_interface = pref_interface.map {|n| n if vm_interfaces.include?(n)}.compact
#$network_interface = pref_interface[0]

Vagrant.configure("2") do |config|
    # Specify the interface when creating the public network
    #config.vm.network "public_network", bridge: "1"
    
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  #config.vm.box = "rapiki_cicd/ubuntu18.04"
  #config.vm.box_version = "1"
  
  #end
  config.vm.define "cicd", primary: true do |cicd|
    cicd.vm.box = "rapiki_cicd/ubuntu18.04"
	cicd.vm.network "private_network", ip: "192.168.0.1"
	cicd.vm.network "forwarded_port", guest: 8080, host: 8080, protocol: "tcp", auto_correct: true
	cicd.vm.network "forwarded_port", guest: 22, host: 2210, protocol: "tcp", auto_correct: true
	cicd.vm.hostname = 'cicd'
	cicd.vm.box_version = "2"
  end
  config.vm.define "lb" do |lb|
    lb.vm.box = "generic/ubuntu1804"
	lb.vm.network "private_network", ip: "192.168.0.2"
	lb.vm.provision "shell", path: "provision_lb.sh"
	lb.vm.synced_folder "webapps/", "/home/vagrant/webapps"
	lb.vm.network "forwarded_port", guest: 80, host: 8282, protocol: "tcp", auto_correct: true
	lb.vm.network "forwarded_port", guest: 22, host: 2211, protocol: "tcp", auto_correct: true
	lb.vm.hostname = 'lb' 
	#lb.vm.provision :shell, inline: "hostname lb"
  end
  config.vm.define "db" do |db|
    db.vm.box = "damianlewis/ubuntu-18.04-mysql"
	db.vm.network "private_network", ip: "192.168.0.3"
	db.vm.provision "shell", path: "provision_db.sh"
	#config.vm.network "public_network", bridge: "en1:"
	db.vm.network "forwarded_port", guest: 22, host: 2212, protocol: "tcp", auto_correct: true
	db.vm.hostname = 'db'
  end
  config.vm.define "apl_1" do |apl_1|
	apl_1.vm.network "private_network", ip: "192.168.0.4"
    apl_1.vm.box = "generic/ubuntu1804"
	apl_1.vm.box_version = "2.0.4"
	apl_1.vm.synced_folder "webapps/", "/home/vagrant/webapps"
	apl_1.vm.provision "shell", path: "provision_apl_web.sh"
	apl_1.vm.hostname = 'apl-1'
	apl_1.vm.network "forwarded_port", guest: 22, host: 2214, protocol: "tcp", auto_correct: true
	apl_1.vm.network "forwarded_port", guest: 8080, host: 8484, protocol: "tcp", auto_correct: true
  end
  config.vm.define "apl_2" do |apl_2|
	apl_2.vm.network "private_network", ip: "192.168.0.5"
    apl_2.vm.box = "generic/ubuntu1804"
	apl_2.vm.synced_folder "webapps/", "/home/vagrant/webapps"
	apl_2.vm.provision "shell", path: "provision_apl_web.sh"
	apl_2.vm.hostname = 'apl-2'
	apl_2.vm.network "forwarded_port", guest: 22, host: 2215, protocol: "tcp", auto_correct: true
	apl_2.vm.network "forwarded_port", guest: 8080, host: 8585, protocol: "tcp", auto_correct: true
  end
  #config.vm.define "mon" do |mon|
  #config.vm.box = "wow73611/zabbix-server"
  #config.vm.box_version = "20170411.0"
  #end
  
  
  
   #config.vm.network "forwarded_port", guest: 80, host: 8080, protocol: "tcp", auto_correct: true
   
  #This is how you can define two guests to use the same box with a private network. In addition during the boot, I used a provisioner to change the hostname of each guest:
#Vagrant.configure("2") do |config|
  #config.vm.box = "MY_LAMP_UBUNTU16.04"
  #config.vm.box_url = "file:/Users/parau/aut/MY_LAMP_UBUNTU16.04.box"
  #config.vm.define "vm-1" do |vm1|
  #vm1.vm.network "private_network", ip: "192.168.10.10"
  #vm1.vm.provision :shell, inline: "hostname vm1"
  #end
  #config.vm.define "vm-2" do |vm2|
  #vm2.vm.network "private_network", ip: "192.168.10.11"
 # vm2.vm.provision :shell, inline: "hostname vm2"
  #end
#end
   
   #Another networking feature is port forwarding between host and guest and let’s say that you would like to forward TCP 8080 from host to TCP 80 on guest:

#parau-mbp:aut parau$ cat Vagrantfile
#Vagrant.configure("2") do |config|
  #config.vm.box = "MY_LAMP_UBUNTU16.04"
  #config.vm.box_url = "file:/Users/parau/aut/MY_LAMP_UBUNTU16.04.box"
  #config.vm.network "forwarded_port", guest: 80, host: 8080, protocol: "tcp", auto_correct: true
  #config.vm.network "private_network", ip: "192.168.10.10"
  #config.vm.network "public_network", bridge:"en5: Thunderbolt Ethernet"
#end
#parau-mbp:aut parau$
   
   
   
  #config.vm.define "balancer" do |balancer|
    #balancer.vm.box = "ngnix"
  #end
  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  config.vm.box_check_update = false

  config.vm.provider "virtualbox" do |vb|
		vb.memory="2048"
		end
  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  # NOTE: This will enable public access to the opened port
  #config.vm.network "forwarded_port", guest: 8080, host: 8080

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine and only allow access
  # via 127.0.0.1 to disable public access
  #config.vm.network "forwarded_port", guest: 80, host: 8080, host_ip: "127.0.0.1"

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  #config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
  #   vb.memory = "1024"
  # end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   apt-get update
  #   apt-get install -y apache2
  # SHELL
end
