#!/bin/bash

<<<<<<< HEAD
#### Bash-Script zur installation von Rounded Corners für i3-gaps, Gogh Color Scheme ####
=======
#### Bash-Script zur installation von Rounded Corners für i3-gaps ####
>>>>>>> d6735eeb72f7a2208ba458d843db71b9731f1141



echo $'\n'
echo 'Klone i3-radius Repository...'
echo $'\n'

git clone https://github.com/terroo/i3-radius

echo $'\n'
echo 'Verschiebe "/usr/bin/i3" zu "/usr/bin/i3_original"...'
echo $'\n'

mv "$(which i3)" "$(which i3)_original"

echo $'\n'
echo 'Erstelle Binaries...'
echo $'\n'

#### Deffiniere Variable "$absolutepath2" ####

absolutepath="$(cd "$(dirname "$1")"; pwd -P)/$(basename "$1")"

cd $absolutepath/i3-radius && sh build.sh

sleep 2

echo $'\n'
<<<<<<< HEAD
echo 'Installiere Gogh Color Scheme...'
echo $'\n'

bash -c  "$(wget -qO- https://git.io/vQgMr)" 

echo $'\n'
echo 'i3 wurde erfolgreich konfigurier, bitte i3 neustarten...'
=======
echo 'Rounded-Corners wurde erfolgreich installiert, bitte i3 neustarten...'
>>>>>>> d6735eeb72f7a2208ba458d843db71b9731f1141
echo $'\n'

sleep 2

exit