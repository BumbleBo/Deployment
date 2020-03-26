echo "Configure network dispatcher"
sudo apt-get update
sudo apt-get install -y network-manager
echo -e "#!/bin/bash\nlogger \"Running $0\"\ncase \"$1\" in\n    eth*)\n        if [ \"$2\" == up ]; then		logger \"$1 $2 wifi off\"\n		nmcli radio wifi off        elif [ \"$2\" == down ]; then\n		logger \"$1 $2 wifi on\"\n		nmcli radio wifi on	\n	fi\n        ;;\nesac" > /etc/NetworkManager/dispatcher.d/50wifioff
sudo chmod 755 /etc/NetworkManager/dispatcher.d/50wifioff