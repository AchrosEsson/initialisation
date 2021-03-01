#!/bin/bash

#### Bash-Script zur installation von VS-Code ####

echo $'\n'
echo 'installiere VS-Code'
echo $'\n'
sleep 2


echo $'\n'
echo 'installiere Abhängkeiten'
sudo apt install -y software-properties-common apt-transport-https

echo $'\n'
echo 'Importiere Microsoft GPG-Schlüssel'
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -

echo $'\n'
echo 'Füge das Visual Studio Code Repository zum System hinzu'
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

echo $'\n'
echo 'Installiere VS-Code'
sudo apt update -y
sudo apt install -y code
apt-get install -f

exit
