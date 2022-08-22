#!/bin/bash

DOMAIN=""
IP=""

read -p "Domínio: " DOMAIN
read -p "IP: " IP

IFS='.' read -ra ADDR <<< "$IP"
        ST=${ADDR[0]}
        ND=${ADDR[1]}
        RD=${ADDR[2]}
        TH=${ADDR[3]}

REVERSE_NAME=$RD.$ND.$ST.in-addr.arpa
FILE_FWD=/etc/named.conf
FILE_FWD_CONFIG=/var/named/$REVERSE_NAME.hosts

COUNTER=0
FOUNF_ZONE=0
COUNTER_ZONE=0

while IFS="" read -r line || [[ -n "$line" ]]; do
        ((COUNTER++))

        if [[ $line = *"$REVERSE_NAME"* ]]; then
                FOUND_ZONE=1
        fi

        if [[ $FOUND_ZONE = 1 && $COUNTER_ZONE < 4 ]]; then

                ((COUNTER_ZONE++))
                sed -i "$COUNTER d" $FILE_FWD
                ((COUNTER--))
        fi
done < $FILE_FWD

#Delete file on /var/named/.hosts
rm $FILE_FWD_CONFIG

#Restart DNS
systemctl restart named