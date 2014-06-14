wget -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add -
sudo echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list
sudo eho "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" >> /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install webmin
sudo apt-get clean -y
sudo apt-get autocolean -y
sudo apt-get autoremove -y
