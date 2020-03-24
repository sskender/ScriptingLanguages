#!/bin/bash

grep -i "banana\|jabuka\|jagoda\|dinja\|lubenica" namirnice.txt
grep -iv "banana\|jabuka\|jagoda\|dinja\|lubenica" namirnice.txt > ne-voce.txt

grep -rwE "([A-Z]{3}[0-9]{6})" ~/projekti/

find . -type f -mtime +7 -mtime -14 -ls

for i in {1..15}; do echo $i; done
