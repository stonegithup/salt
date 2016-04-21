{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/memcached.monit.conf:
  file.managed:
    - source: salt://uc/memcached/memcached.monit.conf 
    - user: root

monit-memcached:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/memcached.monit.conf

