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
        vb.gui = false
        vb.memory = "1024"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision-network.yml"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision.yml"
        ansible.groups = {
            "hadoop" => [],
            "name_node" => ["hadoop-name-node.local"],
            "secondary_name_nodes" => ["hadoop-secondary-name-node.local"],
            "data_nodes" => ["hadoop-data-node-[1:2].local"],
            "hadoop:children" => ["name_node", "secondary_name_nodes", "data_nodes"]
        }
    end

    # IMPORTANT: Because of vagrant's dynamic ansible inventory, and the need of using it's values as hostnames,
    # the VM name must be the same of it's FQDN
    [
        "hadoop-name-node.local", "hadoop-secondary-name-node.local", "hadoop-data-node-1.local",
        "hadoop-data-node-2.local"
    ].each do |node_name|
        config.vm.define node_name { |hadoop| hadoop.vm.hostname = "#{node_name}.local" }
    end

end
   