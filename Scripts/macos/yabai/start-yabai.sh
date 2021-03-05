#!/bin/bash

#### Bash-Script zum initialisieren von Yabi & Skhd ####

echo $'\n'
echo 'Installiere Skriptzusatz...'
echo $'\n'

sudo yabai --install-sa 

echo $'\n'
echo 'Lade Skriptzusatz...'
echo $'\n'

sudo yabai --load-sa 

echo $'\n'
echo 'Starte Yabai...'
echo $'\n'

brew services restart yabai 

echo $'\n'
echo 'Starte Skhd...'
echo $'\n'

brew services restart Skhd

echo $'\n'
echo 'Starte Übersicht...'
echo $'\n'

open -a Übersicht

echo $'\n'
echo 'Erfolgreich gestartet'
echo $'\n'

sleep 2

exit



