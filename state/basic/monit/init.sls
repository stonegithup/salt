{% if grains['os'] == "Debian" %}
monit:
  pkg:
    - installed
    - skip_verify: True
  service:
    - running
    - reload: True
    - watch:
      - file: /etc/default/monit
      - file: /etc/monit/monitrc
      - file: /etc/init.d/monit
      - file: /etc/pam.d/monit
    - requires:
      - file: /etc/pam.d/monit

/etc/default/monit:
  file.managed:
    - source: salt://basic/monit/monit.default

/etc/monit/monitrc:
  file.managed:
    - source: salt://basic/monit/monitrc
    - user: root
    - group: root
    - mode: 700

/etc/pam.d/monit:
  file.managed:
    - source: salt://basic/monit/monit.pam
    - mode: 644

/etc/init.d/monit:
  file.managed:
    - source: salt://basic/monit/monit.init
    - mode: 744
{% endif %}
