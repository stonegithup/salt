#mkfile:
#  cmd.run:
#    - name: mkdir /opt/mongobak
#    - user: root 
/opt/mongobak/:
  file.directory:
    - user: op
    - group: op
    - mode: 775

/opt/mongobak/backup.py:
  file.managed:
    - source: salt://mongobak/conf/backup.py
    - user: op
    - group: op
    - mode: 755 
/opt/mongobak/system_logging.py:
  file.managed:
  - source: salt://mongobak/conf/system_logging.py
  - user: op
  - group: op
  - mode: 755
/opt/mongobak/send_mail.py:
  file.managed:
  - source: salt://mongobak/conf/send_mail.py
  - user: op
  - group: op
  - mode: 755

