#!/bin/bash

# source and destination folders
SRC=$1
DES=$2

IFS=$'\n' # split by new line
for image in $(find $SRC -type f -iname "*.jpg");
do
    # create folder (if not exist) from modified date
    modlong=$(stat --format %y $image | awk -F ' ' '{print $1}')
    modshort=$(date -d "$modlong" +'%Y-%m')
    mkdir -p $DES/$modshort; mv $image $DES/$modshort/
done
