{% include 'basic/monit/init.sls' %}

{% if grains['os'] == 'Debian' %}
/etc/monit/conf.d/activemq.monit.conf:
  file.managed:
    - source: salt://uc/activemq/activemq.monit.conf 
    - user: root

monit-activemq:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/activemq.monit.conf

{% endif %}
