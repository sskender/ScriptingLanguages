proba="Ovo je proba"
echo $proba
lista_datoteka=$(ls)
echo $lista_datoteka
proba3="$proba. $proba. $proba."
a=4
b=3
c=7
d=$((($a+4)*$b%$c))
broj_rijeci=$(cat *.txt | wc -w)
ls ~
cat /etc/passwd|cut -f1 -d":" -f6 -d":" -f7 -d":"
ps -eo uid,pid,comm
