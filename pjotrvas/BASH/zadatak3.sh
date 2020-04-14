for file in localhost_access_log.*-02-*.txt
do
	datump=$(echo $file | awk -F '.' '{print $2}')	
	datumn=$(date -jf "%Y-%m-%d" "$datump" +"%d-%m-%Y")
	echo "datum: $datumn"	
	echo "--------------------------------------------------"
	records=$(cat $file | cut -d'"' -f2  | sort | uniq)
	allrecords=""
	echo $records| while read r; 
		do
		total=$(grep $r $file | wc -l )
		allrecords="$allrecords\n$total : $r"
	done
	echo $allrecords | sort -r
done
