{% if grains['os'] == 'Debian' %}
/etc/apt/sources.list.d/zabbix.list:
  file.managed:
    - source: salt://zabbix/conf/zabbix_debian.list
    - user: root
    - group: root
    - mode: 0644
{% endif %}

key-add:
  cmd.run:
    - name: apt-key adv --recv-keys --keyserver keyserver.ubuntu.com D13D58E479EA5ED4

repo-update:
  cmd.run:
    - name: apt-get update

