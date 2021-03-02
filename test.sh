#!/bin/bash

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

