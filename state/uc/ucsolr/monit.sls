{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/ucsolrtomcat.monit.conf:
  file.managed:
    - source: salt://uc/ucsolr/ucsolrtomcat.monit.conf 
    - user: root

monit-solr:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/ucsolrtomcat.monit.conf

