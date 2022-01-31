#!/bin/bash
#Script to Generate Random Numbers

rm -rf inputFile
RANDOM=$$

num=0  #starting number
maxcount=9  #maximum count value is 10 numbers. If need, we can increase the number

while [[ ${num} -le ${maxcount} ]]
do 
	echo $num, $(($RANDOM%300)) >> inputFile
	(( num = num + 1))
done
