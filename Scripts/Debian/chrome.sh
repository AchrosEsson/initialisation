#!/bin/bash

#### Bash-Script zur installation von Google-Chrome ####

echo $'\n'
echo 'installiere Google-Chrome'
echo $'\n'
sleep 2

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb
rm google-chrome-stable_current_amd64.deb
apt-get -f install
cd $cwd

exit
