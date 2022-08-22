#!/bin/bash

DOMAIN=""
HOSTNAME=$(hostname)
IP=""
read -p "Domínio: " DOMAIN
read -p "IP: " IP

echo "zone \"$DOMAIN\" IN {
        type master;
        file \"/var/named/$DOMAIN.hosts\";
};" >> /etc/named.conf

FORWARD_FILE=/var/named/$DOMAIN.hosts
touch $FORWARD_FILE

echo "\$ttl 38400
@       IN      SOA     $HOSTNAME. mail.$DOMAIN.(
                        1165190726 ;serial
                        10800 ;refresh
                        3600 ; retry
                        604800 ; expire
                        38400 ; minimum
                        )
        IN      NS      $HOSTNAME.
@       IN      A       $IP
www     IN      A       $IP" > $FORWARD_FILE
