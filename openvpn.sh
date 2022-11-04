#!/usr/bin/env bash

echo "what was the link that remote.it gave you? "
read linkk 
eval "$linkk"
echo "Connected to remote.it, starting proxy install..."

echo "Making sure the system is updated..."
sudo apt-get update
echo "The system was updated!"

sudo apt-get -y install git
git clone https://github.com/Nyr/openvpn-install.git

sudo chmod +x openvpn-install/openvpn-install.sh
./openvpn-install/openvpn-install.sh
