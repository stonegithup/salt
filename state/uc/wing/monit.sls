{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/wingtomcat.monit.conf:
  file.managed:
    - source: salt://uc/wing/wingtomcat.monit.conf 
    - user: root

monit-wing:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/wingtomcat.monit.conf

