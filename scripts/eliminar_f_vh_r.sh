#!/bin/bash

echo "Selecione uma das opções:
1 - Eliminar zona Forward
2 - Eliminar um VirtualHost
3 - Eliminar zona Reverse
4 - Voltar ao menu"

chmod 755 ~/scripts/eliminar_zona_forward.sh
chmod 755 ~/scripts/eliminar_virtualHost.sh
chmod 755 ~/scripts/eliminar_zona_reverse.sh
chmod 755 ~/scripts/eliminar_f_vh_r.sh
chmod 755 ~/scripts/menu.sh

ANSWER=""
read -p "Opção: " ANSWER

if [ "$ANSWER" == "1" ]
then
        echo " "
        ~/scripts/eliminar_zona_forward.sh

elif [ "$ANSWER" == "2" ]
then
        echo " "
        ~/scripts/eliminar_virtualHost.sh

elif [ "$ANSWER" == "3" ]
then
        echo " "
        ~/scripts/eliminar_zona_reverse.sh

elif [ "$ANSWER" == "4" ]
then
        echo " "
        ~/scripts/menu.sh
else
        echo "Escolha uma opção válida"
        ~/scripts/eliminar_f_vh_r.sh

fi
