zabbix-agent:
  pkg:
    - installed
    - skip_verify: True
  service.running:
    - restart: True
    - watch:
      - file: /etc/zabbix/zabbix_agentd.conf

/etc/zabbix/zabbix_agentd.conf:
  file.managed:
    - source: salt://zabbix/conf/zabbix_agentd.conf
    - user: root
    - group: root
    - mode: 0666
    - require:
      - pkg: zabbix-agent
    - template: jinja

/etc/sudoers.d/zabbix:
  file.managed:
    - source: salt://zabbix/conf/zabbix
    - user: root
    - group: root
    - mode: 0440

/etc/sudoers.d/:
  file.directory:
  - user: root
  - group: root
  - dir_mode: 755

/etc/zabbix/mybin/:
  file.directory:
  - user: zabbix
  - group: zabbix
  - dir_mode: 755
/etc/zabbix/mybin/discover_cpu.sh:
  file.managed:
    - source: salt://zabbix/mybin/discover_cpu.sh
    - user: root
    - group: root
    - mode: 755

/etc/zabbix/mybin/discover_dev.sh:
  file.managed:
    - source: salt://zabbix/mybin/discover_dev.sh
    - user: root
    - group: root
    - mode: 755

/etc/zabbix/mybin/discover_process.sh:
  file.managed:
    - source: salt://zabbix/mybin/discover_process.sh
    - user: root
    - group: root
    - mode: 755

/etc/zabbix/mybin/checkpid.sh:
  file.managed:
    - source: salt://zabbix/mybin/checkpid.sh
    - user: root
    - group: root
    - mode: 755



/etc/zabbix/mybin/nginx_status.sh:
  file.managed:
    - source: salt://zabbix/mybin/nginx_status.sh
    - user: root
    - group: root
    - mode: 755
/etc/zabbix/mybin/netstate.sh:
  file.managed:
    - source: salt://zabbix/mybin/netstate.sh
    - user: root
    - group: root
    - mode: 755

/etc/zabbix/mybin/get_netstate.sh:
  file.managed:
    - source: salt://zabbix/mybin/get_netstate.sh
    - user: root
    - group: root
    - mode: 755




