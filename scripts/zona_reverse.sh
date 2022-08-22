#!/bin/bash

DOMAIN=""
IP=""
HOSTNAME=$(hostname)

read -p "Dominio: " DOMAIN
read -p "IP: " IP

IFS='.' read -ra ADDR <<< "$IP"
        ST=${ADDR[0]}
        ND=${ADDR[1]}
        RD=${ADDR[2]}
        TH=${ADDR[3]}
REVERSE_NAME=$RD.$ND.$ST.in-addr.arpa

REVERSE_FILE=/var/named/$REVERSE_NAME.hosts


if [ -e "$REVERSE_FILE" ];
then
	echo "$TH     IN      PTR     $DOMAIN." >> $REVERSE_FILE
	systemctl restart named 

else
	touch $REVERSE_FILE

	echo "\$ttl 38400
@       IN      SOA     $HOSTNAME. mail.$DOMAIN.(
                        1165190726
                        10800
                        3600
                        604800
                        38400
                        )
        IN      NS      $HOSTNAME.
$TH     IN      PTR     $DOMAIN." >> $REVERSE_FILE


	echo "zone \"$REVERSE_NAME\" IN {
        type master;
        file \"/var/named/$REVERSE_NAME.hosts\";
	};" >> /etc/named.conf


	systemctl restart named
fi