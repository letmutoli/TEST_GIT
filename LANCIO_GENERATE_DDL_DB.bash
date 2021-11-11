#!/bin/bash
#Generazione DDL DB
# Created By Minutoli L. lminutoli@minsait.com

#Colori
#RED='\033[1;31m'
#GREEN='\033[1;32m'
#WHITE='\033[01;37m'


while getopts s:u:p flag
do
	case "${flag}" in
		s) schema=${OPTARG};;
		u) user=${OPTARG};;
		p) pwd=${OPTARG};;
	esac
done
echo ------"lancio dello script generate ddl"-------
echo "sql script su schema: $schema con user: $user"
echo -----------------------------------------------
echo --------------------"FINE"---------------------