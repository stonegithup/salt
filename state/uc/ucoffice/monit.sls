{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/ucofficetomcat.monit.conf:
  file.managed:
    - source: salt://uc/ucoffice/ucofficetomcat.monit.conf 
    - user: root

/etc/monit/conf.d/soffice.monit.conf:
  file.managed:
    - source: salt://uc/ucoffice/soffice.monit.conf 
    - user: root

monit-ucoffice:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/ucofficetomcat.monit.conf
      - file: /etc/monit/conf.d/soffice.monit.conf

