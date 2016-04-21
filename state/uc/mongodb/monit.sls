{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/mongodb.monit.conf:
  file.managed:
    - source: salt://uc/mongodb/mongodb.monit.conf 
    - user: root

monit-mongo:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/mongodb.monit.conf

