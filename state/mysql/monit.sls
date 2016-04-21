{% include  'basic/monit/init.sls' %}
/etc/monit/conf.d/mysql.monit.conf:
  file.managed:
    - source: salt://mysql/mysql.monit.conf
    - user: root

monit-service:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file:  /etc/monit/conf.d/mysql.monit.conf

