#!/bin/bash

echo "Criação de um domínimo.
Selecione uma das opções:
1 - Criar zona Forward.
2 - Criar zons Reverse.
3 - Criar zona Forward e Reverse
4 - Voltar ao menu"

ANSWER=""
read -p "Opção: " ANSWER

chmod 755 ~/scripts/zona_forward.sh
chmod 755 ~/scripts/zona_reverse.sh
chmod 755 ~/scripts/dns.sh
chmod 755 ~/scripts/menu.sh

if [ "$ANSWER" == "1" ]
then
        echo "###Zona Forward###"
        ~/scripts/zona_forward.sh
        echo "Zona Forward criada."
        systemctl restart named
elif [ "$ANSWER" == "2" ]
then
         echo "###Zona Reverse###"
         ~/scripts/zona_reverse.sh
        echo "Zona Reverse criada."
        systemctl restart named
elif [ "$ANSWER" == "3" ]
then
         echo "###Zona Forward###"
        ~/scripts/zona_forward.sh
        echo "###Zona Reverse###"
        ~/scripts/zona_reverse.sh
        echo "Zona Forward e Reverse criadas."
        systemctl restart named

elif [ "$ANSWER" == "4" ]
then
        echo " "
        ~/scripts/menu.sh
else
        echo "Escolha uma opção válida"
        ~/scripts/dns.sh
fi