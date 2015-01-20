backupsites
===========

This repository is made to sort and cleanup backup files on a linux server.

Usage
-----

Set the proper permissions on this file, and setup on a cronjob that runs once a day.

```
# Set proper permissios
chmod 755 /home/backupsites.sh

# Add to cronjob that runs at 3am
0 3 * * * /home/backupsites.sh
```

This script will create daily, weekly and monthly subdirectories in the `backupdir` folder with the archived/organized files.

Options
-------

- `backupdir`: The directory which backups are located.
- `weeklybackupday`: The day of the week which backups are ran (ex. Sunday).
 
