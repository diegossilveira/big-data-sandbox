# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

Vagrant.configure("2") do |config|

    config.vm.box = "centos/7"
    config.vm.network "private_network", type: "dhcp"
    config.vm.boot_timeout = 120

    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = false
        # Customize the amount of memory on the VM:
        vb.memory = "1024"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision-network.yml"
    end

    # config.vm.define "hadoop-name-node"
    # config.vm.define "hadoop-secondary-name-node"
    # config.vm.define "hadoop-data-node-1"
    # config.vm.define "hadoop-data-node-2"
    config.vm.define "zookeeper-1"
    # config.vm.define "zookeeper-2"
    # config.vm.define "zookeeper-3"

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision.yml"
        ansible.groups = {
            # "hadoop" => [],
            # "name_node" => ["hadoop-name-node"],
            # "secondary_name_nodes" => ["hadoop-secondary-name-node"],
            # "data_nodes" => ["hadoop-data-node-[1:2]"],
            # "resource_manager" => ["hadoop-name-node"],
            # "job_history_server" => ["hadoop-name-node"],
            # "hadoop:children" => ["name_node", "secondary_name_nodes", "data_nodes"],
            "zookeeper" => ["zookeeper-1"]
        }
    end

    ["zookeeper-1"].each do |node_name|
        config.vm.define node_name do |hadoop|
            hadoop.vm.hostname = "#{node_name}.local"
        end
    end

end
   