# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

DEFAULT_VM_MEMORY = "1024"
VM_BOOT_TIMEOUT = 120

Vagrant.configure("2") do |config|

    config.vm.box = "centos/7"
    config.vm.network "private_network", type: "dhcp"
    config.vm.boot_timeout = VM_BOOT_TIMEOUT

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision-network.yml"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision.yml"
        ansible.groups = {
            "hadoop" => [],
            "name_node" => ["hadoop-name-node.local.vagrant.test"],
            "secondary_name_node" => ["hadoop-secondary-name-node.local.vagrant.test"],
            "data_nodes" => ["hadoop-data-node-[1:2].local.vagrant.test"],
            "resource_manager" => ["hadoop-name-node.local.vagrant.test"],
            "job_history_server" => ["hadoop-name-node.local.vagrant.test"],
            "hadoop:children" => ["name_node", "secondary_name_nodes", "data_nodes"],
            "zookeeper" => ["zookeeper-[1:3].local.vagrant.test"]
        }
    end

    # IMPORTANT: Because of vagrant's dynamic ansible inventory, and the need of using it's values as hostnames,
    # the VM name must be the same of it's FQDN
    [
        { hostname: "hadoop-name-node.local.vagrant.test", memory: "1536" },
        { hostname: "hadoop-secondary-name-node.local.vagrant.test" },
        { hostname: "hadoop-data-node-1.local.vagrant.test" },
        { hostname: "hadoop-data-node-2.local.vagrant.test" },
        { hostname: "zookeeper-2.local.vagrant.test", memory: "512" },
        { hostname: "zookeeper-1.local.vagrant.test", memory: "512" },
        { hostname: "zookeeper-3.local.vagrant.test", memory: "512" }
    ].each do |node|
        config.vm.define node[:hostname] do |hadoop|

            hadoop.landrush.enabled = true
            hadoop.vm.hostname = node[:hostname]
            hadoop.vm.provider "virtualbox" do |vb|
                vb.gui = false
                vb.memory = node[:memory] || DEFAULT_VM_MEMORY
            end
        end
    end

end
   