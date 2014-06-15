wget http://download.opensuse.org/repositories/isv:ownCloud:community/xUbuntu_14.04/Release.key
sudo apt-key add - < Release.key  

sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/community/xUbuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud.list"

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install mysql-server
sudo apt-get install owncloud

sudo a2enmod ssl
sudo a2ensite default-ssl
sudo service apache2 reload
