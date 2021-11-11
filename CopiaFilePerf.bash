#!/bin/bash
# created by Lillo Minutoli lminutoli@minsait.com
#Path certificato per connessione ssh verso le int e wkf
certificato="/app-scripts/appoggio/key_priv_ssh_prod"

# PATH DI ORIGINE DOVE METTERE IL FILE DA COPIARE
percorso="/app-scripts"

# NOME DEL FILE DA COPIARE
#file="workflow.env.properties"

# PATH COMUNE PER INT e WKF
path2WKF="/wls001/beadata/wls122/dwp2beatwf/etc"
path2INT="/wls001/beadata/wls122/dwp2beatint/etc"

echo "COPIA FILE SU INT E\O WKF"

menu_scelta(){
				echo "1 Copia File WKF"
				echo "2 Copia File INT"
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
                        copia_wkf
                        ;;
                        "2")
                        copia_int
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

copia_wkf(){
				echo "Inserire i dati richiesti"
				# NOME DEL FILE DA COPIARE
				echo "file da copiare:"
				read file
				# PATH SUL SERVER DOVE COPIA IL FILE
				echo "Inserire percorso di destinazione"
				read path1
#- COPIA  WKF PERFORMANCE
rm -rf CopiaFPERFWKF.txt
DIR=$path2WKF$path1
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Installing config files in ${DIR}..."
else
  ###  Control will jump here if $DIR does NOT exists ###
echo "Error: ${DIR} not found."
echo "creazione directory in corso"
#creazione directory in caso sia assente
mkdir -p $path1
ssh -i $certificato wp2beatint@10.153.177.98  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.40   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.171  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.46   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.106  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.101  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.18   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.74   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.53   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.66   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.200  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.37   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.119  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.7    "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.55   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.87   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.228  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.152  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.45   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.50   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.37   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.83   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.27   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.27   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.193  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.41   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.17   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.111  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.239.109  "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.154.238.51   "mkdir -p $path2WKF$path1"
ssh -i $certificato wp2beatwf@10.153.128.62   "mkdir -p $path2WKF$path1" 
fi

cp $percorso/$file $path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.82:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.40:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.171:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.46:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.106:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.101:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.18:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.74:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.53:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.66:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.200:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.37:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.119:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.7:$path2WKF$path1/    
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.55:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.87:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.228:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.152:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.45:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.50:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.37:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.83:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.27:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.27:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.193:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.41:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.17:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.111:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.154.239.109:$path2WKF$path1/  
scp -ri $certificato $percorso/$file wp2beatwf@10.154.238.51:$path2WKF$path1/   
scp -ri $certificato $percorso/$file wp2beatwf@10.153.128.62:$path2WKF$path1/   


# VERIFICARE DATA FILE

ls -la $path1/$file > CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.82   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.40   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.171  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.46   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.106  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.101  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.18   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.74   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.53   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.66   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.200  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.37   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.119  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.7    ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.55   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.87   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.228  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.152  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.45   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.50   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.37   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.83   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.27   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.27   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.193  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.41   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.17   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.111  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.239.109  ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.154.238.51   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt
ssh -i $certificato wp2beatwf@10.153.128.62   ls -la$path2WKF$path1/$file >>  CopiaFPERFWKF.txt  

clear
cat CopiaFPERFWKF.txt; cat CopiaFPERFWKF.txt |wc -l
}

copia_int(){
				echo "Inserire i dati richiesti"
				# NOME DEL FILE DA COPIARE
				echo "file da copiare:"
				read file
				# PATH SUL SERVER DOVE COPIA IL FILE
				echo "Inserire percorso di destinazione"
				read path1
#- COPIA  INT PERFORMANCE
rm -rf CopiaFPERFINT.txt
DIR=$path2WKF$path1
if [ -d "$DIR" ]; then
  ### Take action if $DIR exists ###
  echo "Installing config files in ${DIR}..."
else
  ###  Control will jump here if $DIR does NOT exists ###
  echo "Error: ${DIR} not found."
  echo "Error: ${DIR} not found."
echo "creazione directory in corso"
#creazione directory in caso sia assente
ssh -i $certificato wp2beatint@10.153.177.98  "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.186.28  "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.168.77  "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.179.250 "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.185.71  "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.168.209 "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.179.102 "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.187.235 "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.128.45  "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.154.239.95  "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.154.238.114 "mkdir -p $path2INT$path1"
ssh -i $certificato wp2beatint@10.153.128.66  "mkdir -p $path2INT$path1"
fi

cp $percorso/$file $path1/   
scp -ri $certificato $percorso/$file wp2beatint@10.153.177.98:$path2INT$path1/   
scp -ri $certificato $percorso/$file wp2beatint@10.153.186.28:$path2INT$path1/   
scp -ri $certificato $percorso/$file wp2beatint@10.153.168.77:$path2INT$path1/  
scp -ri $certificato $percorso/$file wp2beatint@10.153.179.250:$path2INT$path1/   
scp -ri $certificato $percorso/$file wp2beatint@10.153.185.71:$path2INT$path1/  
scp -ri $certificato $percorso/$file wp2beatint@10.153.168.209:$path2INTF$path1/  
scp -ri $certificato $percorso/$file wp2beatint@10.153.179.102:$path2INT$path1/   
scp -ri $certificato $percorso/$file wp2beatint@10.153.187.235:$path2INT$path1/   
scp -ri $certificato $percorso/$file wp2beatint@10.153.128.45:$path2INT$path1/   
scp -ri $certificato $percorso/$file wp2beatint@10.154.239.95:$path2INT$path1/   
scp -ri $certificato $percorso/$file wp2beatint@10.154.238.114:$path2INT$path1/  
scp -ri $certificato $percorso/$file wp2beatint@10.153.128.66:$path2INT$path2WKF/   

# VERIFICARE DATA FILE
ls -la $path1/$file > CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.177.98   $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.186.28   $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.168.77   $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.179.250  $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.185.71   $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.168.209  $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.179.102  $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.187.235  $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.128.45   $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.154.239.95   $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.154.238.114  $path2INT$path1/$file >>  CopiaFPERFINT.txt
ssh -i $certificato wp2beatint@10.153.128.66   $path2INT$path1/$file >>  CopiaFPERFINT.txt

clear
cat CopiaFPERFINT.txt; cat CopiaFPERFINT.txt |wc -l
}
do_menu