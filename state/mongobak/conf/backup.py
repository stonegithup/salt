#/usr/bin/evn python
#coding=utf-8

'''
Created on 2015��11��4��

@author: zhangyb
'''
import datetime
import commands
import socket
import os
import system_logging
import send_mail

mongo_num = "ucdisk" + socket.gethostname()[3:5]
td = datetime.datetime.now().strftime("%Y-%m-%d-%H-%M")
#back_dir = "/tmp/" + td
mylogger = system_logging.tofile("backcup.log")

def mk():
    back_dir = "/tmp/" + socket.gethostname().split(".")[0]
    if not os.path.exists(back_dir):
        os.mkdir(back_dir)
        mylogger.info("mkdir successed")
    return back_dir

def bak(name,path):
    bak_com = "mongodump -d %s -o %s" % (name,path)
    bak_res = commands.getstatusoutput(bak_com)
    if bak_res[0] != 0:
        mylogger.info(bak_com)
        mylogger.info("bakup failed")
        raise False
    mylogger.info("bakup successed")
    return True
def tar(path,name,bktime):
    bak_name = name + "_" + bktime + ".tar.gz"
    tar_com = "tar zcf "+ path + '/' + bak_name + " -C " + path +' ' + name + " --remove-files"
    tar_res = commands.getstatusoutput(tar_com)
    if tar_res[0] != 0:
        mylogger.info(tar_com)
        mylogger.info("tar failed")
        raise False
    mylogger.info("tar successed")
    os.chdir(path)
    md5_com = "md5sum " + bak_name + " > " + name + "_" + bktime +".md5"
    md5_res = commands.getstatusoutput(md5_com)
    if md5_res[0] != 0:
        mylogger.info(md5_com)
        mylogger.info("md5sum failed")
        raise False
    mylogger.info("tar successed")
    return True
#rsync -vzrtopg --progress --password-file=/etc/rsyncd.secrets /bak/ucdisk05 y7tech@10.44.182.124::mongodb
def send(path):
    send_com = "rsync -vzrtopg --progress  --password-file=/etc/rsyncd.secrets %s op@119.57.173.137::mongoback" % path
    send_res = commands.getstatusoutput(send_com)
    if send_res[0] != 0:
        mylogger.info(send_com)
        mylogger.info("rsync failed")
        raise False
    rm_com = "rm -rf " + path
    rm_res = commands.getstatusoutput(rm_com)
    if rm_res[0] != 0:
        mylogger.info(rm_com)
        mylogger.info("delete failed")
        raise False    
    mylogger.info("send successed")  
    return True
def do():
    db_com = "grep mongo.name /etc/y7tech/ucdisk/database.properties"
    db_res = commands.getstatusoutput(db_com)
    if db_res[0] != 0:
        mylogger.info(db_com)
        mylogger.info("get dbname failed")
        raise False
    if db_res[1].split('=')[1] == "@DATABASE_NAME@":
        mylogger.info("This db is not data")
        return True
    else:
        db_name = db_res[1].split('=')[1]
    back_dir = mk()    
    bak(db_name,back_dir)
    tar(back_dir,db_name,td)
    send(back_dir)
#do()
if __name__ == "__main__":
    try:
        do()
    except:
        send_mail.send(mongo_num)
        mylogger.info("mongodb bakup failed")
