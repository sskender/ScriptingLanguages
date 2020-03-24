#/bin/bash

DES=${!#} # last argument
COPIED=0

mkdir -p $DES
echo "Folder $DES created"

for file in $@;
do
    if [[ "$file" != "$DES" ]];
    then
        if [[ ! -a $file || ! -r $file ]];
        then
            echo "Error: $file not exist or not readable" >> /dev/stderr
        else
            cp -u $file $DES
            COPIED=$((COPIED+1))
        fi
    fi
done

echo "$COPIED files copied to $DES"
