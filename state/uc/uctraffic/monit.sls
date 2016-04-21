{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/uctraffictomcat.monit.conf:
  file.managed:
    - source: salt://uc/uctraffic/uctraffictomcat.monit.conf 
    - user: root

monit-uctraffic:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/uctraffictomcat.monit.conf

