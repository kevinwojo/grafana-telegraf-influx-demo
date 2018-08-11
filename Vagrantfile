# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  #config.vm.provision "shell", inline: "echo Hello"

  config.vm.define "monitor" do |monitor|
    monitor.vm.box = "ubuntu/xenial64"
    monitor.vm.network "private_network", ip: "192.168.33.10"
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    monitor.vm.provision "shell" do |s|
    s.inline = <<-SHELL
       echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
       echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
     SHELL
    end
 
  end

  config.vm.define "wtelegraoldhost" do |wildhost|
    wildhost.vm.box = "ubuntu/xenial64"
    wildhost.vm.network "private_network", ip: "192.168.33.20"
    ssh_pub_key = File.readlines("#{Dir.home}/.ssh/id_rsa.pub").first.strip
    wildhost.vm.provision "shell" do |s|
    s.inline = <<-SHELL
       echo #{ssh_pub_key} >> /home/vagrant/.ssh/authorized_keys
       echo #{ssh_pub_key} >> /root/.ssh/authorized_keys
     SHELL
    end
  end
end
