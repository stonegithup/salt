#!/bin/bash
#
#
if [ $# -lt 1 ]
then
exit
fi
if [ -f /etc/monit/conf.d/"$1"* ]
then
  pidfile=$(grep "$1" /etc/monit/conf.d/"$1"* |head -1 |awk '{print $NF}')
  if ! [ -f $pidfile ] 
  then
    if [ $# -lt 2 ]
    then
      echo 3
      exit
    else
      echo 1
      exit
    fi
  fi
  pid=$(cat $pidfile)

  if ls /proc/"$pid"/ >> /dev/null 2>&1 
  then
    if [ "$2" = "PID" ] 
    then
      echo $pid
      exit
    fi

    if [ "$2" = "LIMITS" ] 
    then
      ls /proc/"$pid"/ >> /dev/null && cat /proc/"$pid"/limits |grep "Max open files" |awk '{print $4}'
      exit
    fi
    if [ "$2" = "START" ]
    then
    JIFFIES=`cat /proc/$pid/stat|cut -d " " -f22`
    UPTIME=` grep btime /proc/stat | cut -d " " -f2`
    START_SEC=$(($UPTIME + $JIFFIES / $(getconf CLK_TCK)))
    date -d "1970-01-01 UTC $START_SEC seconds" +"%Y-%m-%d %H:%M:%S"
    exit
    fi
    echo 0
    exit
  fi
  echo 2
fi
