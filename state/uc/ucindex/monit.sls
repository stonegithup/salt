{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/ucindextomcat.monit.conf:
  file.managed:
    - source: salt://uc/ucindex/ucindextomcat.monit.conf 
    - user: root

monit-index:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/ucindextomcat.monit.conf

