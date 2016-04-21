#!/bin/bash
portarray=$(sudo /sbin/fdisk -l 2>/dev/null | grep Disk | grep bytes | awk '{print $2}'|tr -d ':'|awk -F/ '{print $NF}')
#length=${#portarray[@]}
printf "{\n"
printf  '\t'"\"data\":["
num=$(echo $portarray | awk '{print NF}')
i=1
for z in $portarray
do
     printf '\n\t\t{'
     printf "\"{#DEV}\":\"$z\"}"
     if [ $i -lt $[$num] ];then
          printf ','
     fi
     i=$((i+1))
done
printf  "\n\t]\n"
printf "}\n"
