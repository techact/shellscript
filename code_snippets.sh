cat /tmp/d.conf
hosts="1.1.1.1,2.2.2.2,3.3.3.3"

cat test.sh
source /tmp/d.conf
out=$(echo $hosts | tr "," "\n")
for i in $out
do
   echo $i
done
