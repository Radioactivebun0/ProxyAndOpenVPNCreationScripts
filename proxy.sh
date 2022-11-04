#!/usr/bin/env bash

echo "what was the link that remote.it gave you? "
read linkk 
eval "$linkk" >/dev/null
echo "Connected to remote.it, starting proxy install..."

echo "Making sure the system is updated..."
sudo apt-get update
echo "The system was updated!"

echo "Installing squid..."
sudo apt-get -y install squid >/dev/null
echo "Installed squid!"

echo "Installing apache2-utils"
sudo apt-get -y install apache2-utils >/dev/null
echo "Installed apache2-utils!"

echo "Creating passwords file..."
sudo touch /etc/squid/squid_passwd
echo "Created passwords file!"

echo "Updating file perms..."
sudo chown proxy /etc/squid/squid_passwd
echo "Updated file perms!"

echo "Creating user"
echo "What do you want the username to be?"
read username
eval "sudo htpasswd /etc/squid/squid_passwd $username"
echo "Created user!"

echo "Updating config file"
echo -e "auth_param basic program /usr/lib/squid/basic_ncsa_auth /etc/squid/squid_passwd\nacl ncsa_users proxy_auth REQUIRED\nhttp_access allow ncsa_users\n" | sudo tee -a /etc/squid/squid.conf
echo "Updated config file!"

trap 'sudo service squid restart' ERR
sudo systemctl restart squid
