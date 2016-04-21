{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/pcapp.monit.conf:
  file.managed:
    - source: salt://uc/pcapp/pcapp.monit.conf 
    - user: root

monit-service:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/pcapp.monit.conf

