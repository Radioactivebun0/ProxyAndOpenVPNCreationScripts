#!/usr/bin/env bash

echo "what was the link that remote.it gave you? "
read linkk 
eval "$linkk"
echo "Connected to remote.it, starting proxy install..."

echo "Making sure the system is updated..."
sudo apt-get update
echo "The system was updated!"

sh -c "$(curl -L https://raw.githubusercontent.com/Nyr/openvpn-install/master/openvpn-install.sh)"
