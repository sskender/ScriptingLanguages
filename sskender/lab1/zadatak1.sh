#!/bin/bash

proba="Ovo je proba"
echo $proba

lista_datoteka=$(ls *)
echo $lista_datoteka

proba3="$proba. $proba. $proba. "

a=4
b=3
c=7
d=$((($a+4)*$b%$c))

broj_rijeci=$(cat *.txt | wc -w)

ls ~

cat /etc/passwd | cut -d':' -f1,6,7

ps -o uid,pid,comm | grep "[0-9]" | cut -d' ' -f2,3,4
