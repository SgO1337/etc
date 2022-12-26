#!/bin/bash
#este shell script busca y reemplaza strings en todo un directorio de archivos (incluyendo subdirectorios)
#el formato del archivo debe ser el siguiente: (el guion es un delimitador, si se quieren incluir guiones o apostrofes se pueden cancelar con un \backslash\)
#stringOriginal-stringReemplazo
largo=`wc -l archivo.txt | cut -d ' ' -f1`
for ((i=1; i<=$largo; i++))
do
	stringOriginal=`sed -n -e $i"p" archivo.txt | cut -d "-" -f1 | sed 's/[[:blank:]]*$//'` && stringReemplazo=`sed -n -e $i"p" archivo.txt | cut -d "-" -f2 | awk '$1=$1' | sed 's/[[:blank:]]*$//'` 
	find directorio -type f -exec sed -i "s/$stringOriginal/$stringReemplazo/g" {} +
done