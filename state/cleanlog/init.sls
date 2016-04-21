/etc/logrotate.d/tomcat:
  file.managed:
    - source: salt://cleanlog/tomcat
    - user: root
    - group: root
    - mode: 755 
/usr/sbin/logrotate /etc/logrotate.d/tomcat  
  cron.present:
    - identifier: clean_log 
    - user: root
    - minute: 59 
    - hour: 23 
  
