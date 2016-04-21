{% include  'basic/monit/init.sls' %}
/etc/monit/conf.d/zabbix-agent.monit.conf:
  file.managed:
    - source: salt://zabbix/conf/zabbix-agent.monit.conf 
    - user: root

monit-service:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/zabbix-agent.monit.conf

