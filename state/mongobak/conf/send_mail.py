#!/usr/bin/python
#coding-utf-8
'''
@author: zhangyb
'''


import smtplib
def send(mongo_num):
    sender = 'zabbix@ronglian.com'
    receivers = ['ybzhang@ronglian.com','mqfeng@ronglian.com']

    message = """From: mongodb back failed <bakup@ronglian.com>
    To: To Person <ybzhang@ronglian.com>
    Subject: mongodb back failed

    %s,mongodb back fialed.
    """ % mongo_num
    try:
        smtpObj = smtplib.SMTP('mail.ronglian.com')
        smtpObj.sendmail(sender, receivers, message)         
        print "Successfully sent email"
    except:
        print "Error: unable to send email"
if __name__ == "__main__":
    send(mongo_num)
