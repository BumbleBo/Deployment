
function appendToFile
{
    text=$1
    filePath=$2
    
    if ! grep -q "$1" "$2"; then
        sudo echo "$1" >> "$2"
    fi
}

wget -O- http://www.webmin.com/jcameron-key.asc | sudo apt-key add -
appendToFile "deb http://download.webmin.com/download/repository sarge contrib" /etc/apt/sources.list
appendToFile "deb http://webmin.mirror.somersettechsolutions.co.uk/repository sarge contrib" /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y webmin
