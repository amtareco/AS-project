#!/bin/bash

DIRECTORY_1=""
DIRECTORY_2=/etc/backups

read -p "Diretoria onde se encontra o ficheiro/pasta: " DIRECTORY_1

# Verifica se a dir existe, se não, cria
if [ ! -d “$DIRECTORY_2” ];

then
        mkdir -p $DIRECTORY_2
fi

data=$(date "+%Hh%Mm_%F")

tar -czf $DIRECTORY_2/$data.tgz --absolute-names $DIRECTORY_1


