izvorisni=$1
novif=$2

mkdir -p $novif

slike=$(find $izvorisni -type f -iname "*.jpg")

echo $slike | while read s
do
	datum=$(stat -f "%Sm" -t "%Y-%m" $s)
	mkdir -p  $novif/$datum
	mv $s $novif/$datum
done
