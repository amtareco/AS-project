#!/bin/bash

echo "
######## MENU ########

Selecione uma das opções:
1 - Instalar/conf Serviços
2 - Criar um Dominio
3 - Criar um VirtualHost
4 - Adicionar um Registo a um Dominio
5 - Eliminar zona Forward/Virtualhost/Reverse
6 - Criar uma Partilha
7 - Efectuar Backup de ficheiros
8 - Criar um Raid 1
9 - Sair."


chmod 755 ~/scripts/instalacoes.sh
chmod 755 ~/scripts/dns.sh
chmod 755 ~/scripts/virtualHost.sh
chmod 755 ~/scripts/registos.sh
chmod 755 ~/scripts/menu.sh
chmod 755 ~/scripts/eliminar_f_vh_r.sh
chmod 755 ~/scripts/partilha.sh
chmod 755 ~/scripts/backup.sh
chmod 755 ~/scripts/raid.sh

ANSWER=""
read -p "Opção: " ANSWER

if [ "$ANSWER" == "1" ]
then
        echo " "
        ~/scripts/instalações.sh
        ~/scripts/menu.sh

elif [ "$ANSWER" == "2" ]
then
        echo " "
        ~/scripts/dns.sh
        ~/scripts/menu.sh

elif [ "$ANSWER" == "3" ]
then
        echo " "
        ~/scripts/virtualHost.sh
        ~/scripts/menu.sh

elif [ "$ANSWER" == "4" ]
then
        echo " "
        ~/scripts/registos.sh
        ~/scripts/menu.sh

elif [ "$ANSWER" == "5" ]
then
        echo " "
        ~/scripts/eliminar_f_vh_r.sh
        ~/scripts/menu.sh

elif [ "$ANSWER" == "6" ]
then
        echo " "
        ~/scripts/partilha.sh
        ~/scripts/menu.sh

elif [ "$ANSWER" == "7" ]
then
        echo " "
        ~/scripts/backup.sh
        ~/scripts/menu.sh

elif [ "$ANSWER" == "8" ]
then
        echo " "
        ~/scripts/raid.sh
        ~/scripts/menu.sh

elif [ "$ANSWER" == "9" ]
then
        echo " "
        exit 0

else
        echo "Escolha uma opção válida"
        ~/scripts/menu.sh

fi

