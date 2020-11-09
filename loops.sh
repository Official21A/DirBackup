#!/usr/bin/bash

# test of for loops
for i in 1 2 3; do
	echo $i
done


for s in $( cat sample.txt ); do
	echo $s " >> "
   	echo  -n $s | wc -c
done 


# test of while loops
counter=0
while [ $counter -lt 3 ]; do
    let counter+=1
    echo $counter
done

# oppsite of while
counter=6
until [ $counter -lt 3 ]; do
    let counter-=1
    echo $counter
done