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

#### Installiere Configs ####

echo $'\n'
echo 'Klone GitHub Repository...'
echo $'\n'
sleep 2

git clone https://github.com/AchrosEsson/initialisation/tree/main/Scripts.git

echo $'\n'
echo 'Klonen abgeschlossen'
echo $'\n'
sleep 2

absolutepath="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

(. ./$absolutepath/Scripts/main/vscode.sh)





#### Erstelle ~/.config ####

DIRECTORY='~/.config/'

if [ ! -d "$DIRECTORY" ]; then
  # Control will enter here if $DIRECTORY doesn't exist.
  mkdir ~/.config/
fi

#### Kopiere tmux.conf ####

echo $'\n'
echo 'Kopiere Tmux-Konfiguration'
echo $'\n'

cp $absolutepath/Scripts/tmux/tmux.conf ~/.tmux.conf

mkdir ~/Scripts

cp $absolutepath/Scripts/tmux/my-tmux ~/Scripts/my-tmux

chmod +x ~/Scripts/my-tmux

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



#### Python Install ####
echo $'\n'
echo "Möchtest du Python installieren?"
echo $'\n'
select yn in "Yes" "No"; do
    case $yn in
        Yes ) (. ./$absolutepath/Scripts/main/python.sh); break;;
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
        Yes ) (. ./$absolutepath/Scripts/main/docker.sh); break;;
        No ) break;;
    esac
done



#### Installiere Zsh - Prezto ####

#echo 'Installiere Zsh - Prezto'

#sleep 2

# 1. Launch Zsh:
#echo 'Starte Zsh...'
#sleep 2
#zsh 

# 2. Clone the repository:
#echo 'Klone GitHub Repository...'
#sleep 2
#git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

# 3. Create a new Zsh configuration by copying the Zsh configuration files provided:
#echo 'erstelle neue Zsh Konfiguration...'
#sleep 2
#setopt EXTENDED_GLOB
#for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
#  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
#done

# 4. Set Zsh as your default shell:
#echo 'setze Zsh als Standard-Shell...'
#chsh -s /bin/zsh


#echo 'Zsh erfolgreich installiert'
#sleep 2

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
        Yes ) (. ./$absolutepath/Scripts/main/i3/i3wm.sh); break;;
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


