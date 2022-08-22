#!/bin/bash

DOMAIN=""

read -p "Domínio: " DOMAIN

echo "Domínio: $DOMAIN"

PATH_FILE_HTTPD_CONFIG=/etc/httpd/conf/httpd.conf
PATH_FILE_VIRTUALHOST=/hosting/$DOMAIN

COUNTER=0
FOUNF_ZONE=0
COUNTER_ZONE=0
COUNTER_SPECIAL=-1

while IFS="" read -r line || [[ -n "$line" ]]; do
        ((COUNTER++))
        ((COUNTER_SPECIAL++))

        if [[ $line = *"$DOMAIN"* ]]; then
                FOUND_ZONE=1
        fi

        if [[ $FOUND_ZONE = 1 && $COUNTER_ZONE < "9" ]]; then

                ((COUNTER_ZONE++))
                sed -i "$COUNTER d" $PATH_FILE_HTTPD_CONFIG
                ((COUNTER--))
                ((COUNTER_SPECIAL--))
        fi

        if [[ $COUNTER_ZONE = 9 ]]; then
                sed -i "$COUNTER d" $PATH_FILE_HTTPD_CONFIG
                ((COUNTER--))
                ((COUNTER_SPECIAL--))
                ((COUNTER_ZONE++)) 
        fi

done < $PATH_FILE_HTTPD_CONFIG

#Delete directory of web page
rm $PATH_FILE_VIRTUALHOST -rf

#Restart DNS e apache
systemctl restart named
systemctl restart httpd