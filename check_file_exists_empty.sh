echo " enter file name "
read file
if [ -s "$file" ]
then
   echo " file exists and is not empty "
else
   echo " file does not exist, or is empty "
fi
