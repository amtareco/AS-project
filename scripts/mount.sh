#!/bin/bash

DIRECTORY_SERVER=""
DIRECTORY_CLIENT=""

read -p "Folder shared on server: " DIRECTORY_SERVER
read -p "Folder on client: " DIRECTORY_CLIENT

PATH_SHARED=/shared/$DIRECTORY_SERVER
PATH2_SHARED2=/storage/$DIRECTORY_CLIENT


mkdir -p $PATH_SHARED
chmod 777 $PATH_SHARED

mount -t nfs 192.168.0.100:$PATH_SHARED $PATH2_SHARED2

echo "192.168.0.100:$PATH_SHARED $PATH2_SHARED2 nfs defaults 0 0" >> /etc/fstab

systemctl restart nfs #service nfs restart
