sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get dist-upgrade
sudo apt-get remove -y --purge $(dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d')
sudo apt-get autoclean -y
sudo apt-get autoremove -y
