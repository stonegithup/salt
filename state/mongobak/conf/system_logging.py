#/usr/bin/evn python
#coding=utf-8

'''
Created on 2015年11月4日

@author: zhangyb
'''


import os
import sys
import time
import logging
import logging.handlers
#import system_config

LOGGER_DIR = "/tmp/mongodb_bak"
if not os.path.exists(LOGGER_DIR):
    os.mkdir(LOGGER_DIR)
def tofile(file_name):
    myformat = '%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s'
    logging.basicConfig(level=logging.DEBUG,format= myformat)
    file_path = os.path.join(LOGGER_DIR, file_name)
    Rthandler = logging.handlers.TimedRotatingFileHandler(file_path, 'H', 12, 60)
    Rthandler.setLevel(logging.INFO)
    formatter = logging.Formatter(myformat)
    Rthandler.setFormatter(formatter)
    Rthandler.suffix = "%Y%m%d-%H%M.log"
    logging.getLogger('').addHandler(Rthandler)
    return logging
