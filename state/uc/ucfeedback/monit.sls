{% include 'basic/monit/init.sls' %}
/etc/monit/conf.d/ucfeedbacktomcat.monit.conf:
  file.managed:
    - source: salt://uc/ucfeedback/ucfeedbacktomcat.monit.conf 
    - user: root

monit-ucfeedback:
  service:
    - running
    - name: monit
    - reload: True
    - watch:
      - file: /etc/monit/conf.d/ucfeedbacktomcat.monit.conf

