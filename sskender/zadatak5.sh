#!/bin/bash

echo -e "$1\n$2"
find $1 -type f -iname "$2" -exec cat {} \; | wc -l
