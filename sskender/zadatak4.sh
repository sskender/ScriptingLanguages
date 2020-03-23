#!/bin/bash

# source and destination folders
src=$1
des=$2

IFS=$'\n' # split by new line
for image in $(find $src -type f -iname "*.jpg");
do
    # create folder (if not exist) from modified date
    moddate=$(stat --format %y $image | awk -F ' ' '{print $2}' | read modified; date -d "$modified" +'%Y-%m')
    mkdir -p $des/$moddate; mv $image $des/$moddate/
done
