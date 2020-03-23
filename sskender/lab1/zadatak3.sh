#!/bin/bash

for file in localhost_access_log.*-02-*.txt;
do
    echo "datum: $(date -d $(echo $file | awk -F '.' '{print $2}' ) +'%d-%m-%Y')"
    echo "--------------------------------------------------"

    formatlog=''

    IFS=$'\n' # split only by new lines
    for line in $(cat $file | awk -F '"' '{print $2}' | sort | uniq);
    do
        formatlog+="$(grep -c $line $file) : $line\n"
    done

    echo -e $formatlog | sort -V -r # natural reverse sort
done
