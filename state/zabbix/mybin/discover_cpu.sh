#!/bin/bash
#cpuarray=$(cat /proc/cpuinfo|grep processor | awk '{print $3 }')
#length=${#cpuarray[@]}
length=$(cat /proc/cpuinfo|grep processor | awk 'END{print $NF+1 }')
printf "{\n"
printf  '\t'"\"data\":["
for ((i=0;i<$length;i++))
do
     printf '\n\t\t{'
     printf "\"{#CPU}\":\"$i\"}"
     if [ $i -lt $[$length-1] ];then
          printf ','
     fi
done
printf  "\n\t]\n"
printf "}\n"
