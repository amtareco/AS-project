#!/bin/bash

DOMAIN=""

read -p "Domínio: " DOMAIN

echo "Domínio: $DOMAIN"

FILE_FWD=/etc/named.conf
FILE_FWD_CONFIG=/var/named/$DOMAIN.hosts

#Delete on /etc/named.conf
PATH_FILE_CONFIG=/etc/named.conf

COUNTER=0
FOUND_ZONE=0
COUNTER_ZONE=0

while IFS="" read -r line || [[ -n "$line" ]]; do
        ((COUNTER++))

        if [[ $line = *"$DOMAIN"* ]]; then
                FOUND_ZONE=1
        fi

        if [[ $FOUND_ZONE = 1 && $COUNTER_ZONE < 4 ]]; then

                ((COUNTER_ZONE++))
                sed -i "$COUNTER d" $PATH_FILE_CONFIG
                ((COUNTER--))
        fi
done < $PATH_FILE_CONFIG

#Delete file on /var/named/.hosts
rm $FILE_FWD_CONFIG

#Restart DNS
systemctl restart named
