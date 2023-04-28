#!/bin/bash

# Output printing in console and writing to log file
export LOG_FILE=log.txt
function console_log {
  echo $1
  echo $1>>$LOG_FILE
}

exec 3>&1 1>>${LOG_FILE} 2>&1

echo "This is stdout"
echo "This is stderr" 1>&2
echo "This is the console (fd 3)" 1>&3
echo "This is both the log and the console" | tee /dev/fd/3

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
#checking java is running or not
count=$(ps aux | grep java | grep -v grep | wc -l)
echo $count
while [[ $count -ne 0 ]]
do
       echo "Counting $count"
       count=$(ps aux | grep java | grep -v grep | wc -l)
done

#Checking process (run.sh) until stopped over remote ssh
ssh -o StrictHostKeyChecking=no -i /path/to/private_key.pem user@hostname 'bash -s' << EOF 2>&1 >> /tmp/results.log
ps aux | grep run.sh | grep -v grep
count=\$(ps aux | grep ven.sh| grep -v grep | wc -l)
echo \$count
proc_status() {
    while [[ \$count -ne "\$1" ]]; do count=\$(ps aux | grep run.sh | grep -v grep | wc -l); echo "\$count" ;done
}
proc_status "0"
EOF
