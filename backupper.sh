#!/bin/bash

DATE=$(date +%d-%m-%Y)
TIME=$(date +%H-%M-%S)

################################################################################
BACKUP_DIR="Backups"
USER="root"
PASSWORD=""
ExcludeFolder="^docker$|^centos$|^vmail$"
ExcludeDatabases="^Database$|^information_schema$|^performance_schema$|^mysql$"
################################################################################

printf "\n"
echo "Linux Home Directory and Mysql Database Backup Tool"
printf "\n"

read -r -p "Do you want to run it? [Y/n] " input
 
case $input in
    [yY][eE][sS]|[yY])

stty -echo
printf "Please Enter The Mysql Root Password: "
read PASSWORD
stty echo
printf "\n"

#create new folder
mkdir -p $BACKUP_DIR/$DATE

ls /home | egrep -v $ExcludeFolder > list-home-backup-dir4324277.txt

#To backup (tar.gz) home directory
for userdir in `more list-home-backup-dir4324277.txt`
do
tar -zcvpf $BACKUP_DIR/$DATE/$userdir-$DATE-$TIME.tar.gz /home/$userdir
done
echo "compression completed!"

#To backup databases
databases=`mysql -u $USER -p$PASSWORD -e "SHOW DATABASES;" | tr -d "| " | egrep -v $ExcludeDatabases`

for db in $databases; do
    echo "Dumping database: $db"
    #--default-character-set= change if different
    mysqldump --default-character-set=utf8mb4 -u $USER -p$PASSWORD --databases $db > $BACKUP_DIR/$DATE/$db-$DATE-$TIME.sql
done

rm list-home-backup-dir4324277.txt

 ;;
    [nN][oO]|[nN])
 echo "exited"
       ;;
    *)
 echo "Invalid input..."
 exit 1
 ;;
esac