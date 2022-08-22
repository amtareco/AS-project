#!/bin/bash

NEW_DIRECTORY=""

read -p "Diretoria: " NEW_DIRECTORY

NEW_DIRECTORY=$NEW_DIRECTORY

mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/sdb /dev/sdc --spare-devices=1 /dev/sdd

mkfs.ext4 /dev/md0
mkdir /$NEW_DIRECTORY
mount /dev/md0 /$NEW_DIRECTORY
