sudo bash ./update.sh
sudo bash ./tools/networkmanager.config.sh
sudo bash ./webmin/webmin.install.sh

sudo apt-get clean -y
sudo apt-get autocolean -y
sudo apt-get autoremove -y
