/etc/resolv.conf:
  file.managed:
    - source: salt://basic/conf/resolv.conf
