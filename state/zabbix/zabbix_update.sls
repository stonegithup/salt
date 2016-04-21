/etc/zabbix/zabbix_agentd.conf:
  file.managed:
    - source: salt://zabbix/conf/zabbix_agentd.conf
    - user: root
    - group: root
    - mode: 0666
    - template: jinja
