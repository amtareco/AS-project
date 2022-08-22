#!/bin/bash



PATH_SHARED=""
IP_MASK=""
PERMISSION=""
VISIBILITY=""
SYNCHRONISM=""

read -p "File to share: " PATH_SHARED
read -p "IP and mask: " IP_MASK
read -p "Permission: " PERMISSION
read -p "Visibility: " VISIBILITY
read -p "Synchronism: " SYNCHRONISM

PATH_SHARED=/shared/$PATH_SHARED
echo "File to share: $PATH_SHARED"
mkdir -p $PATH_SHARED
chmod 777 $PATH_SHARED
echo "$PATH_SHARED $IP_MASK($PERMISSION,$VISIBILITY,$SYNCHRONISM)" >> /etc/exports

systemctl restart nfs  