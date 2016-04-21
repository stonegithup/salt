/etc/hostname:
  file.managed:
    - source: salt://basic/conf/hostname
    - template: jinja
    - defaults:
       hostname: {{grains['id']}}
hostname:
  cmd.run:
    - name: hostname {{grains['id']}}
