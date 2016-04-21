{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/ucdmtomcat.monit.conf:
  file.managed:
    - source: salt://uc/ucdm/ucdmtomcat.monit.conf 
    - user: root

monit-service:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/ucdmtomcat.monit.conf

