#!/usr/bin/bash

for i in 1 2 3; do
	echo $i
done


for s in $( cat sample.txt ); do
	 echo $s " >> "
   	echo  -n $s | wc -c
done 
