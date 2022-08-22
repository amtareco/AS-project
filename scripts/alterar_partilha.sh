#!/bin/bash

DIRECTORY=""
IP_MASK=192.168.0.100
NEW_PERMISSION=""
NEW_VISIBILITY=""
NEW_SYNC=""

read -p "Directory: " DIRECTORY
read -p "New permission: " NEW_PERMISSION
read -p "New visibility: " NEW_VISIBILITY
read -p "New synchronism: " NEW_SYNC

DIRECTORY=/shared/$DIRECTORY

PATH_FILE_CONFIG=/etc/exports

COMPARE_TEXT="$DIRECTORY $IP"

COUNTER=0
SPECIAL=1

while IFS="" read -r line || [[ -n "$line" ]]; do

        ((COUNTER++))
        ((SPECIAL++))
        if [[ $line = *"$COMPARE_TEXT"* ]]; then
                TEXT="$DIRECTORY $IP"
                TEXT+="($NEW_PERMISSION,$NEW_VISIBILITY,$NEW_SYNC)"

                sed -i "$COUNTER i \\$TEXT" $PATH_FILE_CONFIG
                sed -i "$SPECIAL d" $PATH_FILE_CONFIG
        fi
done < $PATH_FILE_CONFIG

systemctl restart nfs 
