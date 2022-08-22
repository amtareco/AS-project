#!/bin/bash

#Directory and ip with mask

PATH_DIRECTORY=/shared${1}

read -p "Diretoria partilhada: " PATH_DIRECTORY

PATH_DIRECTORY=/shared/$PATH_DIRECTORY
PATH_FILE=/etc/exports
COMPARE_TEXT="$PATH_DIRECTORY"

COUNTER=0
SPECIAL=1
while IFS="" read -r line || [[ -n "$line" ]]; do

        ((COUNTER++))
        ((SPECIAL++))
        if [[ $line = *"$COMPARE_TEXT"* ]]; then

                newline=#$line
                sed -i "$COUNTER d" $PATH_FILE
        fi
done < $PATH_FILE

#Remove directory
rm $PATH_DIRECTORY -rf

#restart
systemctl restart nfs 