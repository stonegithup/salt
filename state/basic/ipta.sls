/etc/iptables.conf:
  file.managed:
    - source: salt://basic/conf/iptables.conf
    - template: jinja
