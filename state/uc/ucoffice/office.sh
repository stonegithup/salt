#!/bin/bash
pidfile=/var/run/soffice
cpunum=`cat /proc/cpuinfo |grep processor |wc -l`


function start(){
[ $cpunum -le 2 ] && { 
if [ -e $pidfile.$1 ] ; then 
    pid=`cat $pidfile.$1`
    pid2=`ps -ef |awk '($2=="'$pid'"){print $0}'`
    if [ "$pid" = "$pid2" ]
    then
        echo "The process $pid is Exist , Not start"
    else
        _start $@
    fi
else
    _start $@
fi
pid1=`ps -ef | awk '($2==$pid1){print $2}'`
}
[ $cpunum -gt 2 ] && {
    pid=`cat $pidfile.$1`
    pid2=`ps -ef |awk '($2=="'$pid'"){print $0}'`
    if [ "$pid" = "$pid2" ]
    then
        echo "The process $pid is Exist , Not start" 
    else
        _start $@
    fi
    shift
    pid=`cat $pidfile.$1`                                                                                                  
    pid2=`ps -ef |awk '($2=="'$pid'"){print $0}'`                                                                          
    if [ "$pid" = "$pid2" ]                                                                                                
    then                                                                                                                   
        echo "The process $pid is Exist , Not start"                                                                       
    else                                                                                                                   
        _start $@                                                                                                          
    fi
}
}

function _start(){
nohup /usr/lib/libreoffice/program/soffice.bin --headless --accept=socket,host=0.0.0.0,port=$1\;urp\; --nofirststartwizard &
sleep 1
pid=`ps -ef |grep soffice.bin |grep $1 |grep -v grep |awk '{print $2}'`
echo $pid 
echo $pid > $pidfile.$1
}

function stop(){
    pids=`cat $pidfile.*`
    kill -9 $pids >> /dev/null 2>&1
}
function help(){
    echo $0 stop 
    echo $0 start 
    echo $0 restart
}
action=$1
shift
case $action in
    start)
     start 8100 8102 8103
        ;;
    stop)
        stop
        ;;
    restart)
        stop
        start 8100 8102 8103
        ;;
    *)
        help
        ;;
esac


