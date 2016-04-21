/etc/hosts:
  file.managed:
    - source: salt://basic/conf/hosts
    - template: jinja
