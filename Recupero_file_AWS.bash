#!/bin/bash
# created by Lillo Minutoli
work_flow=(
"elaawi2bew04"  
"elaawi2bew05" 
"elaawi2bew08" 
"elaawi2bew09" 
"elaawi2bew16" 
"elaawi2bew17" 
"elaawi2bew18" 
"elaawi2bew19" 
"elaawi2bew24" 
"elaawi2bew25" 
"elaawi2bew26" 
"elaawi2bew27" 
"elaawi2bew28" 
"elaawi2bew29" 
"elaawi2bew38" 
"elaawi2bew31" 
"elaawi2bew32" 
"elaawi2bew39" 
"elaawi2bew34" 
"elaawi2bew35" 
"elaawi2bew40" 
"elaawi2bew37" 
"elaawi2bew55" 
"elaawi2bew56" 
"elaawi2bew57" 
"elaawi2bew58" 
"elaawi2bew59" 
"elaawi2bew60")


echo "Download file AWS"

menu_scelta(){
				echo "1 Visualizza file"
				echo "2 Copia file"
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
                        Visualizza_file
                        ;;
                        "2")
                        copia_file
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

Visualizza_file(){
				echo "dati per la visulizzazione del file"
				echo "inserire data [YYYYMMDD]:"
				read data
				echo "Inserire dati per il file da visulizzare"
				echo "inserire tipologia [dcm, dcmrf, dco, lpo]:"
				read type
				echo "Indiciare su worflow [1-28]:"
				read wls
				echo "inserire giorno del file [1-31]:"
				read day
				echo "inserire l'ora [1-24]"
				read hour
				aws s3 ls s3://enel-prod-glin-ap04024-2beatdownloadfiles/$data/$type.${work_flow[$wls-1]}.$day"_"$hour"."zip --region eu-central-1
}

copia_file(){
				echo "dati per la copia del file"
				echo "inserire data [YYYYMMDD]:"
				read data
				echo "Inserire dati per il file da copiare"
				echo "inserire tipologia [dcm, dcmrf, dco, lpo]:"
				read type
				echo "Indiciare su worflow [1-28]"
				read wls
				echo "inserire giorno del file [1-31]:"
				read day
				echo "inserire l'ora [1-24]:"
				read hour
				echo "inserire il path:"
				read path
				aws s3 cp s3://enel-prod-glin-ap04024-2beatdownloadfiles/$data/$type.${work_flow[$wls-1]}.$day"_"$hour"."zip $path --region eu-central-1
}
do_menu