{% if grains['os'] == "Debian" %}
install_activemq:
  file.recurse:
    - name: /opt/apache-activemq/
    - source: salt://uc/activemq/apache-activemq
    - include_empty: True
    - user : root
    - group: root
    - dir_mode: 755
    - file_mode: 755 
{% include "java/init.sls" %}
/opt/apache-activemq/bin/env:
  file.managed:
      - source: salt://uc/activemq/env.debian
      - template: jinja
      - user: root
      - mode: 755
start_activemq:
  cmd.run:
      - name: /opt/apache-activemq/bin/activemq start
      - user: root
{% endif %}

{% if grains['os'] == "CentOS" %}
wget:
  pkg:
    - installed

install_activemq:
  file.managed:
    - name: /opt/apache-activemq-5.11.1-bin.tar.gz
    - source:  http://source.y7tech.cn/activemq/apache-activemq-5.11.1-bin.tar.gz
    - source_hash: http://source.y7tech.cn/activemq/apache-activemq-5.11.1-bin.tar.gz.md5
    - cwd: /opt/
    - user: root

extract_activemq:
  cmd.run:
    - name: tar -zxvf apache-activemq-5.11.1-bin.tar.gz
    - cwd: /opt/
    - user: root
    - require:
      - file: install_activemq
rename_activemq:
  cmd.run:
    - name: mv apache-activemq-5.11.1 apache-activemq 
    - cwd: /opt/
    - user: root
    - require:
      - cmd: extract_activemq
{% include "java/init.sls" %}
/opt/apache-activemq/bin/env:
  file.managed:
    - source: salt://uc/activemq/env.CentOS
    - user: root
    - mode: 755
start_activemq:
  cmd.run:
    - name: /opt/apache-activemq/bin/activemq start
    - user: root
{% endif %}
