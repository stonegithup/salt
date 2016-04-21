{% set time_point = salt['grains.get']('nodename')[2:5].strip("0") %}
/usr/bin/python /opt/mongobak/backup.py:
  cron.present:
  - identifier: mongo_bak
  - user: root
  - minute: {{time_point}}
  - hour: '9-18/3,0'
  
