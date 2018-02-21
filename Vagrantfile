# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.

HADOOP_HOSTS_COUNT = 3

Vagrant.configure("2") do |config|

    config.vm.box = "centos/7"
    config.vm.network "private_network", type: "dhcp"

    config.vm.provider "virtualbox" do |vb|
        # Display the VirtualBox GUI when booting the machine
        vb.gui = false
        # Customize the amount of memory on the VM:
        vb.memory = "1024"
    end

    config.vm.provision "ansible" do |ansible|
        ansible.playbook = "provision-network.yml"
    end

    config.vm.define "ambari-server" do |ambari|
    
        ambari.vm.hostname = "ambari-server.local"

        ambari.vm.provision "ansible" do |ansible|
            ansible.playbook = "provision-ambari-server.yml"
        end

    end

    (1..HADOOP_HOSTS_COUNT).each do |node_id|

        config.vm.define "hadoop-#{node_id}" do |hadoop|
    
            hadoop.vm.hostname = "hadoop-#{node_id}.local"

            hadoop.vm.provision "ansible" do |ansible|
                ansible.playbook = "provision-ambari-agent.yml"
            end

            hadoop.vm.provision "ansible" do |ansible|
                ansible.playbook = "provision-mysql.yml"
            end
    
        end

    end

end
  