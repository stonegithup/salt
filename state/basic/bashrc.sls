/root/.bashrc:
  file.managed:
    - source: salt://basic/conf/bashrc
    - user: root
    - group: root

