# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

DEFAULT_VM_MEMORY = "1024"
VM_BOOT_TIMEOUT = 120
NETWORK_GATEWAY = "172.28.128.1"

Vagrant.configure("2") do |config|

    config.vm.box = "centos/7"
    config.vm.boot_timeout = VM_BOOT_TIMEOUT

    # IMPORTANT: Because of vagrant's dynamic ansible inventory, and the need of using it's values as hostnames,
    # the VM name must be the same of it's FQDN
    hosts = [
        { hostname: "hadoop-name-node.local", memory: "1536" },
        { hostname: "hadoop-secondary-name-node.local" },
        { hostname: "hadoop-data-node-1.local" },
        { hostname: "hadoop-data-node-2.local" },
        { hostname: "zookeeper-2.local", memory: "512" },
        { hostname: "zookeeper-1.local", memory: "512" },
        { hostname: "zookeeper-3.local", memory: "512" }
    ]

    config.vm.provision "ansible" do |ansible|
        ansible.extra_vars = { domain_names: domain_names(hosts) }
        ansible.playbook = "provision-network.yml"
    end
  
    hosts.each_with_index do |node, i|
        config.vm.define node[:hostname] do |hadoop|
            hadoop.vm.hostname = node[:hostname]
            hadoop.vm.network "private_network", ip: "#{NETWORK_GATEWAY}#{i}"
            hadoop.vm.provider "virtualbox" do |vb|
                vb.gui = false
                vb.memory = node[:memory] || DEFAULT_VM_MEMORY
            end

            hdp_provision(config) if node == hosts.last
        end
    end

end

def hdp_provision(config)
    config.vm.provision "ansible" do |ansible|
        ansible.limit = "all"
        ansible.playbook = "provision.yml"
        ansible.extra_vars = { ha: true }
        ansible.groups = {
            "hadoop" => [],
            "name_node" => ["hadoop-name-node.local"],
            "secondary_name_node" => ["hadoop-secondary-name-node.local"],
            "data_nodes" => ["hadoop-data-node-[1:2].local"],
            "resource_manager" => ["hadoop-name-node.local"],
            "job_history_server" => ["hadoop-name-node.local"],
            "hadoop:children" => ["name_node", "secondary_name_node", "data_nodes"],
            "journal_nodes" => [],
            "journal_nodes:children" => ["secondary_name_node", "data_nodes"],
            "zookeeper" => ["zookeeper-[1:3].local"],
            "name_node:vars" => { "name_node_id" => "nn1" },
            "secondary_name_node:vars" => { "name_node_id" => "nn2" }
        }
    end
end
   
def domain_names(hosts)
    hosts.each_with_index.map { |host, i| { ip: "#{NETWORK_GATEWAY}#{i}", fqdn: host[:hostname] } }
end
