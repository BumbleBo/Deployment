function appendToFile
{
    text=$1
    filePath=$2
    
    if ! grep -q "$1" "$2"; then
        sudo echo -e "$1" >> "$2"
    fi
}

sudo apt-get update
sudo apt-get install -y dirmngr
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 886DDD89
sudo apt-get install apt-transport-https
sudo apt-get install -y apache2

wget -O- https://raw.githubusercontent.com/jeedom/core/master/install/install.sh | sudo bash

echo "Configure fstab"
appendToFile "username=jeedom\npassword= ypi1FWY5" /home/pi/.RinzlerNasJeedomCred
appendToFile "//RinzlerNas/home/backup /var/www/html/backup cifs vers=1.0,_netdev,users,auto,users,credentials=/home/pi/.RinzlerNasJeedomCred 0 0" /etc/fstab

sudo mount -a
