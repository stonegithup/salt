git:
  pkg.installed:
    {% if grains["os"] == 'Debian' %}
    - name: git
    {% endif %}
/usr/share/y7tech/:
  file.directory:
    - user: root
    - mode: 755
/usr/share/y7tech/id_rsa.git:
  file.managed:
    - source: salt://basic/conf/id_rsa.git
    - user: root
    - mode: 600

/root/.ssh/id_rsa:
  file.managed:
    - source: salt://basic/conf/id_rsa.git
    - user: root
    - mode: 600

