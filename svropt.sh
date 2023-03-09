#!/bin/bash

echo -e "\n\nUpdate and Upgrade Linux\n"
sudo apt-get update && sudo apt-get upgrade -y 

echo -e "\n\nInstall htop, glances, whowatch, Isof and ufw\n"
sudo apt install htop glances whowatch lsof ufw -y


echo -e "\n\nCreate Logging Folder\n"
mkdir	-p /var/log/adm
mkdir	-p /var/log/usr
chmod 777 /var/log/usr

echo -e "\n\nSSH Configuration\n"
echo "Port 2222" >> /etc/ssh/sshd_config
#echo "PermitRootLogin yes" >> /etc/ssh/sshd_config
echo "MaxAuthTries 3" >> /etc/ssh/sshd_config
echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config

echo -e "\n\nSetting up Firewall\n"
sudo ufw default deny incoming
sudo ufw default allow outgoing
#sudo ufw allow ssh
sudo ufw allow 2222
sudo ufw allow http
sudo ufw allow https

echo -e "\n\nEnable History Logging\n"
mv bash.bashrc /etc/ 

echo -e "\n\nReboot Server\n"

sudo reboot

echo -e "\n\nDone and Dusted\n"
