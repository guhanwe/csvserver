#!/bin/bash
#Script to Generate Random Numbers

rm -rf inputFile
RANDOM=$$

num=0  #starting number
maxcount=10  #maximum count value 10. If need, we can increase the number

while [[ ${num} -le ${maxcount} ]]
do 
	echo $num, $(($RANDOM%300)) >> inputFile
	(( num = num + 1))
done
