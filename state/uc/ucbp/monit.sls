{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/ucbptomcat.monit.conf:
  file.managed:
    - source: salt://uc/ucbp/ucbptomcat.monit.conf 
    - user: root

monit-ucbp:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/ucbptomcat.monit.conf

