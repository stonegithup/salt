#!/bin/bash
tt=3
if [ -f /etc/profile ]
then
	. /etc/profile
fi

file=`find /tmp -maxdepth 1  -mtime -$tt -name www_inter_ok`
if ! [ -n $file ]
then
	echo "file time err 已结超过$tt min 没有更新过了"
	exit
fi
grep -v ^$ $file 
