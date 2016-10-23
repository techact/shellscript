#!/bin/bash

# This script find run levels of services. 
# Usage oof this script
#chmod +x /path/to/find_runlevel.sh
#/path/to/find_runlevel.sh
# Its asking user input as below,
 #Enter service name to find runlevel : "
#then enter service name, for example apache2 
clear
echo -en "\nEnter service name to find runlevel : " 
read service_name
file_exists=$(ls /etc/rc*.d/*${service_name} | grep $service_name | wc -l)
echo $file_exists
if [[ ! $file_exists -gt 0 ]]; then
   echo "No"
   exit 0
fi
COFF='\033[00m'
RED='\033[0;31m'
GREEN='\033[0;32m'
new="$service_name   "
for i in {0..6}
do
   out=$(ls /etc/rc${i}.d/* | grep  "$service_name")
   s_name=$(echo $out | awk -F'/' '{print $4}')
   echo $s_name
   pri=${s_name:1:2}
   statt=$(echo $s_name | awk '{print substr ($0, 0,2)}' | tr -d [0-9])
   if [[ "$statt" == "S" ]]; then
      staa="on" 
      
      new="${new} ${i}:${staa}    "
      start_pri=$pri
   else 
      staa="off"
      new="${new} ${i}:${staa}    "
      stop_pri=${pri}
   fi
done
echo -e "\n$new"
echo -e "\n${GREEN}Start Priority : ${start_pri} ${COFF}"
echo -e "${RED}Stop Priority  : $stop_pri ${COFF}\n\n"

#echo "$(tput setaf $i)This is ($i) $(tput sgr0)";
