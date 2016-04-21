{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/ucdisktomcat.monit.conf:
  file.managed:
    - source: salt://uc/ucdisk/ucdisktomcat.monit.conf 
    - user: root

monit-ucdisk:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/ucdisktomcat.monit.conf

