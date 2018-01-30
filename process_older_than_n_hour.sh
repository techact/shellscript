out="/tmp/ps_out.txt"
cat /dev/null > $out
ps -eo pid,pcpu,pmem,etime,cmd --sort=start_time|grep -v "grep\|php-fpm" | grep "php\|\.sh" | awk '{$2=$3=""; print $0}' > /tmp/ps.txt
IFS=$'\n'
for i in $(cat /tmp/ps.txt)
do
   running_time=$(echo "$i" | awk '{print $2}' | awk -F':' '{print NF; exit}')
   if [[ $((running_time)) == "3" ]]; then
      hour=$(echo "$i" | awk '{print $2}' | awk -F':' '{print $1}' | cut -d'-' -f2)
      if [ $hour -gt 01 ]; then
          echo "$i" $hour >> $out
      fi
   elif [[ $((running_time)) == "2" ]]; then
      minute=$(echo "$i" | awk '{print $2}' | awk -F':' '{print $1}')
      if [ $minute -gt "30" ]; then
          echo "$i" $minute >> $out
      fi
   fi
done
if [[ -s $out ]]; then
   cat $out  | mail -s "Process running older than $hour hour"  "abc@xyz.com"
fi

