/etc/rsyncd.secrets:
  file.managed:
  - source: salt://mongobak/conf/rsyncd.secrets
  - user: root
  - group: root
  - mode: 600
