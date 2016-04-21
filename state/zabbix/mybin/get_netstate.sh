#!/bin/sh
#
#write by minqiang.feng
#
#@ 2015-03-19
D=60
file=/tmp/netstat.zb
if [ $# -lt  1 ]
then
	exit -1;
fi
if [ $# -eq  2 ]
then
	D=$2
else
	D=60
fi
T=`date +%s`
if [ -f $file ];then
	nT=`grep Date $file|awk '{print $2}'`
	Re=`echo $T $nT $D |awk '{if (( $1 - $2 ) > $3){ print "0" } else {print "1"} }'`
	if [ $Re -eq 0 ]
	then 
		Value=`/etc/zabbix/mybin/netstate.sh | grep $1 |awk '{print $NF}'`
	else
		Value=`grep  $1  $file | awk '{print $NF}'`
	fi
else
	Value=`bash /etc/zabbix/mybin/netstate.sh | grep $1 |awk '{print $NF}'`
fi
if [ "$Value" = "" ]
then 
	echo 0
else
	echo $Value
fi

