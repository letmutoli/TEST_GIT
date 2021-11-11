#!/bin/bash

filename='company.txt'
while read line; do

#Reading each line
JSON='{"cmoId": ${line}}'
echo $JSON
done < $filename
