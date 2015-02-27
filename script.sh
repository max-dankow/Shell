#!/bin/bash

#echo "$0 "
#echo "$1 "
#echo "$2 "

for file in "$@"; do

if [ -a "$file" ]
then 
    echo "$file"
else 
    echo "File $file not foud."
fi

done
