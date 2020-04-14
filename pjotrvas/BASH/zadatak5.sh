echo $1
echo $2

datoteke=$(find $1 -name $2)
ukupno=0
echo $datoteke | while read line
do
        jedan=$(cat $line | wc -l)
        ukupno=$(($ukupno+$jedan))
done

echo $ukupno
