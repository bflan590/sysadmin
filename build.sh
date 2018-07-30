#!/bin/bash
#This script allows for simple deployment and standardized configuration.

#Program Dependencies
echo "Installing Dependencies.."
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410 931FF8E79F0876134EDDBDCCA87FF9DF48BF1C90
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
echo "Sublime Complete"

#Update the Repo List, Programs, and Kernel
apt-get update -y
apt-get upgrade -y

#Install applications
apt-get install -y vim net-tools nmap spotify-client sublime-text git python ruby libxss1 libappindicator1 libindicator7 curl

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome*.deb

