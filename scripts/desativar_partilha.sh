/#!/bin/bash

#Directory and ip with mask

PATH_DIRECTORY=""
IP=192.168.0.100

read -p "Diretoria partilhada: " PATH_DIRECTORY

PATH_FILE=/etc/exports
COMPARE_TEXT="$PATH_DIRECTORY $IP"

COUNTER=0
SPECIAL=1
while IFS="" read -r line || [[ -n "$line" ]]; do

        ((COUNTER++))
        ((SPECIAL++))
        if [[ $line = *"$COMPARE_TEXT"* && ${line:0:1} != "#" ]]; then

                newline=#$line

                sed -i "$COUNTER i \\$newline" $PATH_FILE
                sed -i "$SPECIAL d" $PATH_FILE
        fi
done < $PATH_FILE

systemctl restart nfs 