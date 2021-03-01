#!/bin/bash

#### Bash-Script zur installation von Docker ####

echo $'\n'
echo 'installiere Docker'
echo $'\n'
echo 'rufe Docker Installations-Skript auf...'
echo $'\n'

sleep 2


curl -fsSL https://get.docker.com -o get-docker.sh
(. ./get-docker.sh)

echo $'\n'
echo 'Skript ausgeführt, installiere Docker-Compose...'
echo $'\n'

sleep 2

echo 'Holen von Docker-Compose...'
echo $'\n'


sudo curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

echo $'\n'
echo 'Mache Binärdateien ausführbar...'

sleep 2

chmod +x /usr/local/bin/docker-compose


echo $'\n'
echo 'Erstelle symbolische Verknüpfung...'
echo $'\n'

sleep 2


ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

#apt install -y docker-compose
apt update -y
apt-get install -f

echo $'\n'
docker --version
echo $'\n'
docker-compose --version
echo $'\n'
echo 'Docker wurde erfolgreich installiert, kehre zurück...'
echo $'\n'

sleep 3

exit