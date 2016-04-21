/root/.ssh:
  file.directory:
    - user: root
    - group: root

/root/.ssh/authorized_keys:
  file.managed:
    - source: salt://basic/conf/authorized_keys
    - user: root
    - mode: 400

/etc/ssh/ssh_config:
  file.managed:
    - source: salt://basic/conf/ssh_config
    - user: root
    - mode: 644

ssh:
  pkg:
    - name: ssh
    - installed
  service:
    - name: ssh
    - running
    - reload: True
    - watch:
      - file: /etc/ssh/sshd_config

/etc/ssh/sshd_config:
  file.managed:
    - source: salt://basic/conf/sshd_config 
    - user: root 
    - group: root
    - mode: 644
