###Skipping first 3 fields, 
```
awk '{ $1=""; $2=""; $3=""; print}' filename
[or]
awk '{$1=$2=$3=""; print $0}' somefile
```
###with input field separator:
```
awk -F':' '{ $1=""; $2=""; print}' filename
```
