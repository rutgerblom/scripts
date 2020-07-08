#!/bin/bash
####
RETENTION=3
#############
echo Deleting files and directories older than $RETENTION days
find /vcenter_backup/* -mtime +$RETENTION -exec rm {} \;
find /vcenter_backup/*/* -mtime +$RETENTION -type d -exec rmdir {} \;