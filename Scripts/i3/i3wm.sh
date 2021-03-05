#!/bin/bash

#### Bash-Script zur installation von i3-Gaps ####

#### Deffiniere Variable "$absolutepath3" ####

absolutepath3="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

echo $'\n'
echo 'Installiere i3 Gaps - Rounded Corners'
echo $'\n'

sleep 2



echo $'\n'
echo "Mit welchem Konto möchtest du i3 nutzen?"
echo $'\n'

#### Deffiniere Variable "$user" ####

cd /home && select d in */; do test -n "$d" && break; echo ">>> Invalid Selection"; done
cd "$d" && user=$(pwd)

echo $'\n'
echo "Du hast folgendes Verzeichnis gewählt:"
echo $'\n'

echo $user

sleep 2



echo $'\n'
echo 'installiere i3'
#echo $'\n'
#apt-get install -y  i3 i3-wm



echo $'\n'
echo 'Klone i3 Repository...'
echo $'\n'

git clone https://github.com/maestrogerardo/i3-gaps-deb.git

#### Deffiniere Variable "$absolutepath1" ####

absolutepath1="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

cd $absolutepath1/i3-gaps-deb

(. ./i3-gaps-deb)

echo $'\n'
echo 'Installiere essentials...'
echo $'\n'

sleep 2

echo $'\n'
echo 'installiere Polybar'
echo $'\n'
apt-get install -y polybar

echo $'\n'
echo 'installiere Nitrogen'
echo $'\n'
apt-get install -y nitrogen

echo $'\n'
echo 'installiere Feh'
echo $'\n'
apt-get install -y feh

echo $'\n'
echo 'installiere Rofi'
echo $'\n'
apt-get install -y rofi

echo $'\n'
echo 'installiere Compton'
echo $'\n'
apt-get install -y compton

echo $'\n'
echo 'installiere Xfce4-Terminal'
echo $'\n'
apt-get install -y xfce4-terminal

echo $'\n'
echo 'installiere Nautilus'
echo $'\n'
apt-get install -y nautilus

echo $'\n'
echo 'installiere Hack-Font'
echo $'\n'
apt-get install -y fonts-hack fonts-hack-otf fonts-hack-ttf fonts-hack-web 

echo $'\n'
echo 'installiere Theming-Tools'
echo $'\n'
apt-get install -y lxappearance gtk-chtheme qt4-qtconfig




#### Deffiniere Variable "$username" ####

OPTIONS=$(getent passwd {1000..60000} | cut -d: -f1) 

echo $'\n'
PS3="Bitte wähle deinen Benutzer aus: "


select username in $OPTIONS

do
        echo $'\n'
        echo "Gewähler Benutzer: $username"
        echo $'\n'

        break
done

sleep 2




echo $'\n'
echo 'installiere Powerline Fonts'
echo $'\n'
cd $absolutepath3
git clone https://github.com/powerline/fonts.git
cd $absolutepath3'fonts'
su $username -c '(. ./install.sh)'


echo $'\n'
echo 'installiere Polybar-Theme...'
echo $'\n'
cd $absolutepath3
git clone https://github.com/adi1090x/polybar-themes.git
cd $absolutepath3'polybar-themes'
su $username -c '(. ./setup.sh)'

echo $'\n'
echo 'Kopiere Wallpaper...'
echo $'\n'

DIR="$user/.wallpaper/"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Der Ordner ${DIR} exestiert bereits..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir ${DIR}
  :
fi

cp -r $absolutepath3\polybar-themes/wallpapers/* $user\.wallpaper/


echo $'\n'
echo 'Kopiere i3-config...'
echo $'\n'



DIR="$user/.config/i3/"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Der Ordner ${DIR} exestiert bereits..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir ${DIR}
  :
fi

cp -r "$absolutepath3/Scripts/i3/config" "$user/.config/i3/config"

sleep 2

echo $'\n'
echo 'Kopiere polybar-config...'
echo $'\n'




DIR="$user/.config/polybar/"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Der Ordner ${DIR} exestiert bereits..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir ${DIR}
  :
fi



cp -r $absolutepath3\Scripts/polybar/* "$user/.config/polybar/"

sleep 2

echo $'\n'
echo 'Kopiere rofi-config...'
echo $'\n'

DIR="$user/.config/rofi/"
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Der Ordner ${DIR} exestiert bereits..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  mkdir ${DIR}
  :
fi

cp -r "$absolutepath3/Scripts/rofi/config.rasi" "$user/.config/rofi/config.rasi"

sleep 2

echo $'\n'
echo 'i3 wurde erfolgreich installiert, kehre zurück...'
echo $'\n'

sleep 3

exit


