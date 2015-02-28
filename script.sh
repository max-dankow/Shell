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
            cat $file | ./sol -i | tr '.' ',' >> answer.txt
        else 
            cat $file | ./sol | tr '.' ',' >> answer.txt
        fi
    else 
        echo "File $file not foud."
    fi
fi

done

echo "Answers are:"
cat answer.txt

echo "Sort by biggest root:"
sort -k7 -g -k9 -g answer.txt > sorted.txt
cat sorted.txt

cat sorted.txt | awk '{if ("$9" = "0"){print $9}}'
