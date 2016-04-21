/etc/iptables.conf:
  file.managed:
    - source: salt://basic/conf/iptables.conf
    - template: jinja
/etc/init.d/salt-minion:
  file.managed:
    - source: salt://basic/conf/salt-minion
bash /etc/iptables.conf:
  cmd.run:
    - user: root
