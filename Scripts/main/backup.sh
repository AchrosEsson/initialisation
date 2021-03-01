
#!/bin/bash

#### Bash-Script zum Konfigureieren eines Backup ####

echo -n 'Enter your desired Backup destination: ' 
        read backup_location
        touch ~/.zshrc
        echo "rsync -zrvh /home $backup_location" >> ~/.zshrc

echo $'\n'
echo -n 'Backup einrichtung Abgeschlossen ' 
echo $'\n'

exit
