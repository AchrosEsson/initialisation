PS3="Bitte wähle deinen Benutzer aus: "
select username in "(getent passwd {1000..60000} | cut -d: -f1)"
do 
    echo "Gewähler Benutzer: $username"
done
