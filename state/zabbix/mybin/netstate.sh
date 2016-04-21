#!/bin/bash
#
#write by minqiang.feng
#@ 2015-03-19
#

file=/tmp/netstat.zb

echo Date `date +%s` > $file
echo Date `date +%s` 

netstat -ant|grep -v grep |grep -v State |grep -v established |awk '{arr[$NF]+=1 } END{for (i in arr){ print i,arr[i]} }' >> $file
netstat -ant|grep -v grep |grep -v State |grep -v established |awk '{arr[$NF]+=1 } END{for (i in arr){ print i,arr[i]} }' 

