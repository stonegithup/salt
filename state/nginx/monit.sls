{% include  'basic/monit/init.sls' %}
/etc/monit/conf.d/nginx.monit.conf:
  file.managed:
    - source: salt://nginx/nginx.monit.conf
    - user: root

monit-service:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file:  /etc/monit/conf.d/nginx.monit.conf

