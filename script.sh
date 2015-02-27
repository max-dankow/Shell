#!/bin/bash

complex=0

rm answer.txt

for file in "$@"; do
if [ "$file" = "-i" -o "$file" = "--complex" ] 
then
    complex=1
else
    if [ -a "$file" ]
    then
	if [ "$complex" = 1 ] 
        then
            cat $file | ./sol -i >> answer.txt
        else 
            cat $file | ./sol >> answer.txt
        fi
    else 
        echo "File $file not foud."
    fi
fi

done
#echo; echo

cat answer.txt | awk ' {print $2, $4, $7, $9} '
