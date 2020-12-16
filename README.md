# Linux Home Directory & Mysql Database Backup Tool (Bash script)

### Installation
To work administrator permissions and mysql root password required.

```sh
$ sudo su
$ git clone https://github.com/mehmetdilekci0/homedir-and-mysql-backup-tool.git
$ cd homedir-and-mysql-backupper/
$ chmod +x backupper.sh
$ sh backupper.sh or ./backupper.sh
```

`BACKUP_DIR="Backups"` -> creates backup folder

`USER="root"` -> mysql user must be root

`PASSWORD=""` -> default value

`ExcludeFolder="^docker$|^centos$|^vmail$"` -> /home/ from directory 

`ExcludeDatabases="^information_schema$|^mysql$"` -> All databases
