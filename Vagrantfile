# -*- mode: ruby -*-
# vi: set ft=ruby :

# If you want a CentOS box, use:
#
#     BOX_OS=centos vagrant up
#
# Otherwise it'll be an ubuntu box
#

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  if (ENV['BOX_OS'] != 'centos')
    config.vm.box = "precise64"
    config.vm.box_url = "http://files.vagrantup.com/precise64.box"
    config.vm.provision :shell, path: "./vagrantProvUbuntu.sh"
  else
    config.vm.box = "centos6.5"
    config.vm.box_url = "https://github.com/2creatives/vagrant-centos/releases/download/v6.5.1/centos65-x86_64-20131205.box"
    config.vm.provision :shell, path: "./vagrantProvCentOS.sh"
  end

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 9013, host: 9013, auto_correct: true
  config.vm.network :forwarded_port, guest: 8080, host: 8080, auto_correct: true

end
