lista=$@
prebaceno=0
for last; do true; done
if [ ! -d "$last" ]; then
	mkdir $last
	echo "Kreirano je kazalo $last."
fi

for l in $(echo -e $(echo $lista | sed 's/\ /\\n/g'))
do 
	if [ $l != $last ]; then
		echo $l
		cp $l $last/
		prebaceno=$((prebaceno+1))		
	fi
done

echo "$prebaceno datoteka kopirano je u kazalo $last"
		
