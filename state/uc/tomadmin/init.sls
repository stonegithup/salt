/usr/bin/tomadmin:
  file.managed:
    - source: salt://uc/tomadmin/tomadmin
    - user: root
    - group: root
    - mode: 755
