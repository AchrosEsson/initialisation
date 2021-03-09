#!/bin/bash

#### Bash-Script zur installation von Rounded Corners für i3-gaps, Gogh Color Scheme ####



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
echo 'Installiere Gogh Color Scheme...'
echo $'\n'

bash -c  "$(wget -qO- https://git.io/vQgMr)" 

echo $'\n'
echo 'i3 wurde erfolgreich konfigurier, bitte i3 neustarten...'
echo $'\n'

sleep 2

exit