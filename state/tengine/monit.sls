{% include  'basic/monit/init.sls' %}
/etc/monit/conf.d/tengine.monit.conf:
  file.managed:
    - source: salt://tengine/tengine.monit.conf
    - user: root

monit-service:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file:  /etc/monit/conf.d/tengine.monit.conf

