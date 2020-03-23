#!/bin/bash

# source and destination folders
src=$1
des=$2

IFS=$'\n' # split by new line
for image in $(find $src -type f -iname "*.jpg");
do
    # create folder (if not exist) from modified date
    modlong=$(stat --format %y $image | awk -F ' ' '{print $1}')
    modshort=$(date -d "$modlong" +'%Y-%m')
    mkdir -p $des/$modshort; mv $image $des/$modshort/
done
