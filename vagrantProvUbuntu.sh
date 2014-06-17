echo "Provisioning an Ubuntu box"
#
# The suggested way of getting node to run on Ubuntu:
#   https://github.com/joyent/node/wiki/Installing-Node.js-via-package-manager#wiki-ubuntu-mint-elementary-os
#
sudo apt-get update
sudo apt-get install -y python-software-properties python g++ make
sudo add-apt-repository ppa:chris-lea/node.js
sudo apt-get update
sudo apt-get install -y nodejs

# -- git is needed, so install it
sudo apt-get install -y git

# -- from api-designer instructions
npm install -g grunt-cli
npm install -g bower
npm install -g karma

# -- got to the right place and build the project
cd /vagrant
npm install
bower install --allow-root --config.interactive=false

# -- background it so Vagrant properly returns
nohup grunt server-noopen --host=0.0.0.0 &


