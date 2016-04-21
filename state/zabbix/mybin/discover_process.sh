#!/bin/bash
if ! [ -d /etc/monit/conf.d/ ]
then
exit
fi
portarray=$(grep check /etc/monit/conf.d/* |awk '{print $3}')
#length=${#portarray[@]}
printf "{\n"
printf  '\t'"\"data\":["
num=$(echo $portarray | awk '{print NF}')
i=1
for z in $portarray
do
     printf '\n\t\t{'
     printf "\"{#PROC}\":\"$z\"}"
     if [ $i -lt $[$num] ];then
          printf ','
     fi
     i=$((i+1))
done
printf  "\n\t]\n"
printf "}\n"
