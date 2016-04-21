mongodb:
  pkg:
    - installed
  service:
   - name: mongodb
   - running
   - watch:
     - file: /etc/mongodb.conf
   - require:
     - pkg: mongodb

/etc/mongodb.conf:
  file.managed:
    - source: salt://uc/mongodb/mongodb.conf
    - user: root
    - mode: 644
