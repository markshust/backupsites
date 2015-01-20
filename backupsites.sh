#!/bin/sh
#
# THIS IS A COPYING/CLEANUP SCRIPT AS BACKUPS ARE RSYNCD DOWN TO THIS SERVER
# author: mark shust <mark@shust.com>
#

##############
### CONFIG ###
##############
backupdir=/home/username/backups/sites
weeklybackupday=Sunday



################################################################################
### DO NOT MODIFY ANYTHING BELOW THS LINE UNLESS YOU KNOW WHAT YOU ARE DOING ###
################################################################################

# get date vars
YEAR=`date +%Y`
MONTH=`date +%m`
DAY=`date +%d`
DAYNAME=`date +%A`

###############
### COPYING ###
###############

# move backups to monthly dir on first of month
if [ "$DAY" = 01 ]; then
  echo "Monthly backup day, copying to monthly folder";
  cp -R `find $backupdir/daily/ -mindepth 1 -type d -mtime 0` $backupdir/monthly/
fi

#move backups to weekly dir on specified weekday
if [ "$DAYNAME" = "$weeklybackupday" ]; then
  echo "Weekly backup day, copying to weekly folder...";
  cp -R `find $backupdir/daily/ -mindepth 1 -type d -mtime 0` $backupdir/weekly/
fi

################
### CLEANING ###
################

echo "Cleaning backups in daily directory older than a week";
find $backupdir/daily/ -maxdepth 1 -type d -mtime +5 -exec rm -rf {} \;

echo "Cleaning backups in weekly directory older than a month";
find $backupdir/weekly/ -maxdepth 1 -type d -mtime +29 -exec rm -rf {} \;

echo "Cleaning backups in monthly directory older than a year";
find $backupdir/monthly/ -maxdepth 1 -type d -mtime +363 -exec rm -rf {} \;

