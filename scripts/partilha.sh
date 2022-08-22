#!/bin/bash

echo "Selecione uma das opções:
1 - Criar uma partilha
2 - Eliminar uma partilha
3 - Alterar uma partilha
4 - Desativar uma partilha
5 - Voltar ao Menu"

chmod 755 ~/scripts/criar_partilha.sh
chmod 755 ~/scripts/eliminar_partilha.sh
chmod 755 ~/scripts/alterar_partilha.sh
chmod 755 ~/scripts/desativar_partilha.sh
chmod 755 ~/scripts/partilha.sh
chmod 755 ~/scripts/menu.sh


ANSWER=""
read -p "Opção: " ANSWER

if [ "$ANSWER" == "1" ]
then
        echo " "
        ~/scripts/criar_partilha.sh

elif [ "$ANSWER" == "2" ]
then
        echo " "
        ~/scripts/eliminar_partilha.sh

elif [ "$ANSWER" == "3" ]
then
        echo " "
        ~/scripts/alterar_partilha.sh

elif [ "$ANSWER" == "4" ]
then
        echo " "
        ~/scripts/desativar_partilha.sh

elif [ "$ANSWER" == "5" ]
then
        echo " "
        ~/scripts/menu.sh
else
        echo "Escolha uma opção válida"
        ~/scripts/partilha.sh

fi
