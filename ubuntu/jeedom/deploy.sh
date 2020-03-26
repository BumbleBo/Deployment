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

echo "Configure fstab"
appendToFile "username=jeedom\npassword= ypi1FWY5" /home/pi/.RinzlerNasJeedomCred
appendToFile "//RinzlerNas/home/backup /var/www/html/backup cifs vers=1.0,_netdev,users,auto,users,credentials=/home/pi/.RinzlerNasJeedomCred 0 0" /etc/fstab

echo "Configure network dispatcher"
sudo apt-get install -y network-manager
appendToFile "#!/bin/bash\nlogger \"Running $0\"\ncase \"$1\" in\n    eth*)\n        if [ \"$2\" == up ]; then		logger \"$1 $2 wifi off\"\n		nmcli radio wifi off        elif [ \"$2\" == down ]; then\n		logger \"$1 $2 wifi on\"\n		nmcli radio wifi on	\n	fi\n        ;;\nesac" /etc/NetworkManager/dispatcher.d/50wifioff
sudo chmod 755 /etc/NetworkManager/dispatcher.d/50wifioff

sudo wget https://raw.githubusercontent.com/jeedom/core/stable/install/install.sh

sudo chmod +x install.sh
sudo ./install.sh
