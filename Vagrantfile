# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.require_plugin "vagrant-omnibus"

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu-12.04"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"

  config.vm.hostname = "zibbet-db"

  config.vm.network :private_network, ip: "172.16.66.66"

  config.vm.provider "virtualbox" do |v|
    v.customize ["modifyvm", :id, "--memory", 768]
    v.customize ["modifyvm", :id, "--cpus", 1]
  end

  unless ENV["VAGRANT_NO_PLUGINS"]
    config.omnibus.chef_version = "11.10.4"
  end

  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "vendor/cookbooks"
    chef.json = JSON.parse(IO.read("chef.json"))
    chef.formatter = ENV.fetch("CHEF_FORMAT", "null").downcase.to_sym
    chef.log_level = ENV.fetch("CHEF_LOG", "info").downcase.to_sym
  end
end
