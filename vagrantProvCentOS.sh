echo "Provisioning a CentOS box"

sudo yum install -y npm

npm install -g grunt-cli
npm install -g bower
npm install -g karma

cd /vagrant
npm install
bower install --allow-root --config.interactive=false 
echo "Starting up grunt server"

sudo nohup grunt server-noopen --host=0.0.0.0 0<&- &>/dev/null &


