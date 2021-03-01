
#!/bin/bash

#### Bash-Script zum initialisieren und provisionieren eines neuen Debian-Betriebssystems ####
#### Wird aufgerufen von "debian.sh" ####


#### System Update & Upgrade ####

echo $'\n'
echo 'Installiere Essentials'
echo $'\n'
echo 'Vorbereitung...'
echo $'\n'

sleep 2

apt-get update -y
apt-get install -f
apt-get dist-upgrade -y
apt-get autoremove -y



#### Essentials ####

echo $'\n'
echo 'installiere Neofetch'
echo $'\n'
sleep 2
apt-get install -y neofetch

echo $'\n'
echo 'installiere Tmux'
echo $'\n'
sleep 2
apt-get install -y tmux

echo $'\n'
echo 'installiere Locate'
echo $'\n'
sleep 2
apt-get install -y locate

echo $'\n'
echo 'installiere Wget'
echo $'\n'
sleep 2
apt-get install -y wget

echo $'\n'
echo 'installiere Curl'
echo $'\n'
sleep 2
apt-get install -y curl

echo $'\n'
echo 'installiere Htop'
echo $'\n'
sleep 2
apt-get install -y htop

echo $'\n'
echo 'installiere Avahi'
echo $'\n'
sleep 2
apt-get install -y avahi-daemon

echo $'\n'
echo 'installiere Speedtest'
echo $'\n'
sleep 2
apt-get install -y speedtest-cli

echo $'\n'
echo 'installiere C-Matrix'
echo $'\n'
sleep 2
apt-get install -y cmatrix

echo $'\n'
echo 'installiere Chromium'
echo $'\n'
sleep 2
apt-get install -y chromium

echo $'\n'
echo 'installiere Firefox'
echo $'\n'
sleep 2
apt-get install -y firefox firefox-esr

echo $'\n'
echo 'installiere ncdu'
echo $'\n'
sleep 2
apt-get install -y ncdu

echo $'\n'
echo 'installiere G-Parted'
echo $'\n'
sleep 2
apt-get install -y gparted

echo $'\n'
echo 'installiere GnuPG'
echo $'\n'
sleep 2
apt-get install -y gnupg

echo $'\n'
echo 'installiere Build-Tools'
echo $'\n'
sleep 2
apt-get install -y build-essential gcc make cmake flex module-assistant

echo $'\n'
echo 'installiere Z-Shell'
echo $'\n'
sleep 2
apt-get install -y zsh

echo $'\n'
echo 'installiere rsync'
echo $'\n'
sleep 2
apt-get install -y rsync

echo $'\n'
echo 'installiere FFmpeg & Youtube-dl'
echo $'\n'
sleep 2
apt-get install -y ffmpeg youtube-dl

echo $'\n'
echo 'installiere Ranger'
echo $'\n'
sleep 2
apt-get install -y ranger

echo $'\n'
echo 'installiere Snap'
echo $'\n'
sleep 2
apt-get install -y snapd
snap install core

echo $'\n'
echo 'installiere Bitwarden'
echo $'\n'
sleep 2
snap install bitwarden



#### Google Chrome ####

echo $'\n'
echo "Möchtest du Google-Chrome installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./$absolutepath/Scripts/Debian/chrome.sh); break;;
        No ) break;;
    esac
done



#### Text Editors ####

echo $'\n'
echo 'installiere Vim'
echo $'\n'
sleep 2

apt-get install -y vim
apt-get install -f

echo $'\n'
echo "Möchtest du Visual Studio Code installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./$absolutepath/Scripts/Debian/vscode.sh); break;;
        No ) break;;
    esac
done



#### Software-Properties-Common ####

echo $'\n'
echo "Möchtest du Software-Properties-Common installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt install software-properties-common && apt-get install -f; break;;
        No ) break;;
    esac
done


#### Python Install ####

echo $'\n'
echo "Möchtest du Python installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./$absolutepath/Scripts/Debian/python.sh); break;;
        No ) break;;
    esac
done


#### Virutalization ####

echo $'\n'
echo 'Virtualisierungs-Software'
echo $'\n'
sleep 2

echo $'\n'
echo "Möchtest du Virt-Manager installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) apt-get install -y virt-manager  && apt-get install -f; break;;
        No ) break;;
    esac
done


echo $'\n'
echo "Möchtest du Docker installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./$absolutepath/Scripts/Debian/docker.sh); break;;
        No ) break;;
    esac
done


apt-get install -f


echo $'\n'
echo 'Software Installation abgeschlossen'
echo $'\n'
sleep 2

exit