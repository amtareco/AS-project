#!/bin/bash

DOMAIN=""
REGISTER_TYPE=""
VALUE=""
IP=192.168.0.100

read -p "Domínio: " DOMAIN
read -p "Tipo de Registo: " REGISTER_TYPE
read -p "Value: " VALUE
read -p "IP: " IP

FILE_FWD_CONF=/var/named/$DOMAIN.hosts

if [ -e "$FILE_FWD_CONF" ];
then
        if [ "$REGISTER_TYPE" = "A" ];
        then
                #echo "Tipo de registo  A"
                echo "$VALUE    IN      A       $IP" >> $FILE_FWD_CONF
        elif [ "$REGISTER_TYPE" = "MX" ];
        then
                #echo "Tipo de registo MX"
                echo "  MX      10      $VALUE.$DOMAIN." >> $FILE_FWD_CONF
        else
                echo "Registo invalido { A : MX }"
        fi

        systemctl restart named
        systemctl restart httpd

else
        echo "Domínio inválido: $DOMAIN não existe"
fi

