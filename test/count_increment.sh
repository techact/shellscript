#!/bin/bash

#COUNTER=$((COUNTER+1))

echo "Type 1"
x=1
for i in 1 2 3 4 5
do
   echo "Welcome count $x times"
   x=$(( $x + 1 ))
   echo "Welcome $i times"
done
echo "Type 2"
a=2
for out in 1 2 4 5 6 7 8 9 0
do
	echo "Count : $a"
	if [ "$a" == "6" ]; then
		echo "count is 6"
#		exit 
	fi
	a=$(($a + 1))
	
done
echo "Type 3"
count=1
while [ $count -lt 10 ]
do
	echo "Counting $count"
	count=`expr $count + 1`
done

echo "type 4"

while :
do
	read -p "Enter two numnbers ( - 1 to quit ) : " a b
	if [ $a -eq -1 ]
	then
		break
	fi
	ans=$(( a + b ))
	echo $ans
done
