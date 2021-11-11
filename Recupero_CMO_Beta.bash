#!/bin/bash
#Test Recupero CMO&invio CMO in ACQT
# Created By Minutoli L. lminutoli@minsait.com

#Colori
RED='\033[1;31m'
GREEN='\033[1;32m'
WHITE='\033[01;37m'

#Lista IP Macchine PROD

H="10.153.120.188"

#Menu scelta operaione se Rieschedulazione o reinvio verso WB
menu_scelta(){
				echo "1 Rischedula CMO in WAIT"
				echo "2 Reinvio Risposta a WB (CMO in ACQT)"
				echo "q Exit"
}
do_menu(){
			i=-1
			while [ "$i" != "q" ]; do
					menu_scelta
					read i
					i=`echo $i | tr '[A-Z]' '[a-z]'`
					case "$i" in
                        "1")
                        Rischedula_CMO
                        ;;
                        "2")
                        Reinvio_ACQT
                        ;;                 
                        "q")
                        echo "Ciao e grazie"
                        exit 0
                        ;;
                        *)
                        echo "Scelta Errata"
                        ;;
                esac
        done
}		


##################
# Rischedula CMO #
##################
Rischedula_CMO(){
echo -e " ${WHITE}---Lancio del messaggio---"

        filename='CMO_WAIT.txt'
        while read line; do
        JSON="{$line}"
        RETURN_CODE=$(echo $JSON | curl -i -H "Content-Type: application/json" -H "X-HTTP-Method-Override: POST" -d @- http://$H:42722/cmo-api-test/rest/v1/cmo/executeCmo -o /dev/null  -s -w %{http_code})
        #Mostra il corpo del JSON che invio
        echo ${JSON}
        if [ "$RETURN_CODE" != "200" ]
        then
                echo -e "${RED}failed with return code $RETURN_CODE${WHITE}"
        else
                echo -e "${GREEN}done${WHITE}"
        fi
        done < $filename
}

################
# Reinvia a WB #
################
Reinvio_ACQT(){
echo -e " ${WHITE}---Lancio del messaggio---"

        filename='CMO_ACQT.txt'
        while read line; do
        JSON="{$line}"
        RETURN_CODE=$(echo $JSON | curl -i -H "Content-Type: application/json" -H "X-HTTP-Method-Override: POST" -d @- http://$H:42722/cmo-api-test/rest/v1/cmo/acquireCmoExecData -o /dev/null  -s -w %{http_code})
        #Mostra il corpo del JSON che invio
        echo ${JSON}
        if [ "$RETURN_CODE" != "200" ]
        then
                echo -e "${RED}failed with return code $RETURN_CODE${WHITE}"
        else
                echo -e "${GREEN}done${WHITE}"
        fi
        done < $filename
}

do_menu