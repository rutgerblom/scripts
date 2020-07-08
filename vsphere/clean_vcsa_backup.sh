#!/bin/bash
find /vcenter_backup/* -mtime +1 #-exec rm {} \;
find /vcenter_backup/*/* -mtime +1 -type d #-exec rmdir {} \;