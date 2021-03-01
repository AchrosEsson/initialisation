#!/bin/bash

#### Bash-Script zum initialisieren und provisionieren eines neuen Debian-Betriebssystems ####

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

echo $'\n'
echo 'initialisiere System...'
echo $'\n'
sleep 2



#### Gather User Data ####

echo 'Einrichten von Git-Login'
echo -n 'Gib deinen Git-Namen ein: '
read git_name
echo -n 'Gib deine GIT-Email ein: '
read git_email
echo -n 'Gib deinen GitHub-Benutzername ein: '
read git_user



#### GIT ####

echo $'\n'
echo 'installiere Git'
echo $'\n'
sleep 2

apt-get install -y git
apt-get install -fy
git config --global user.name $git_name
git config --global user.email $git_email
git config --global user.name $git_user
git config --global push.default matching
git config --global core.editor "nano"



#### Erstelle "absolutepath" Variable ####

absolutepath="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"



#### Rufe software.sh auf ####

(. .$absolutepath/Scripts/Debian/software.sh)



#### Erstelle ~/.config ####

echo $'\n'
echo 'Erstelle ~/.config'
echo $'\n'

DIR="~/.config/"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Der Ordner ${DIR} exestiert bereits..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir ${DIR}
  exit 1
fi



#### Kopiere tmux.conf ####

echo $'\n'
echo 'Kopiere Tmux-Konfiguration'
echo $'\n'
echo 'Erstelle ~/Scripts'
echo $'\n'

DIR="~/Scripts"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Der Ordner ${DIR} exestiert bereits..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir ${DIR}
  exit 1
fi

cp -r $absolutepath/Scripts/tmux/tmux.conf ~/.tmux.conf

cp -r $absolutepath/Scripts/tmux/my-tmux ~/Scripts/my-tmux

chmod +x ~/Scripts/my-tmux

echo $'\n'
echo 'Erledigt'
echo $'\n'
sleep 2



#### Kopiere .zshrc ####

echo $'\n'
echo 'Kopiere Z-Shell-Konfiguration'
echo $'\n'
sleep 2

cp -r $absolutepath/Scripts/zsh/zshrc ~/.zshrc 

sleep 2



#### Kopiere Polybar Konfiguarion ####

echo $'\n'
echo 'Kopiere Polybar Konfiguarion'
echo $'\n'
sleep 2

cp -r $absolutepath/Scripts/polybar/shades ~/.config/

sleep 2



#### konfiguriere Backports ####

echo $'\n'
echo "Möchtest du Backports aktivieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "deb http://ftp.debian.org/debian stretch-backports main contrib" > /etc/apt/sources.list.d/ftp-stretch-backports.list && echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list.d/backports.list && echo "deb http://deb.debian.org/debian stretch-backports main contrib" >> /etc/apt/sources.list.d/stretch-backports.list && apt update -y; break;;
        No ) break;;
    esac
done



#### Virtualbox-Guest-Modules ####

echo $'\n'
echo "Möchtest du Virtualbox-Guest-Modules installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "deb http://ftp.debian.org/debian stretch-backports main contrib" > /etc/apt/sources.list.d/stretch-backports.list && apt update -y && apt install -y virtualbox-guest-dkms linux-headers-$(uname -r); break;;
        No ) break;;
    esac
done



#### i3 - Window Manager ####

echo $'\n'
echo "Möchtest du i3 Window Manager installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./$absolutepath/Scripts/i3/i3wm.sh); break;;
        No ) break;;
    esac
done



#### konfiguriere Backup ####

echo $'\n'
echo "Möchtest du eine Backup-location bestimmen?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. .$absolutepath/Scripts/main/backup.sh); break;;
        No ) break;;
    esac
done


echo $'\n'
echo 'Aufräumen...'
echo $'\n'

mkdir ~/.wallpaper
apt update -y
apt-get install -f
apt auto-remove
echo "source /etc/profile" >> ~/.bashrc
echo "source /etc/profile" >> ~/.zshrc
updatedb



#### Finalization ####

echo $'\n'
echo 'Systemeinrichtung abgeschlossen. Viel Spaß!'
echo $'\n'

sleep 2



#echo 'Bitte Shell neustarten!'


exit


