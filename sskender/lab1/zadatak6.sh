#/bin/bash

DEST=${!#} # last argument
COPIED=0

mkdir -p $DEST
echo "Folder $DEST created"

for file in $@;
do
    if [[ "$file" != "$DEST" ]];
    then
        if [[ ! -a $file || ! -r $file ]];
        then
            echo "Error: $file not exist or not readable" >> /dev/stderr
        else
            cp -u $file $DEST
            COPIED=$((COPIED+1))
        fi
    fi
done

echo "$COPIED files copied to $DEST"
