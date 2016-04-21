java_install:
  file.recurse:
    - name: /opt/jdk/
    - source: salt://java/jdk1.7.0_21/
    - user : root
    - group: root
    - dir_mode: 755
    - file_mode: 644


/opt/jdk/bin/java:
  file.managed:
    - mode: 755 
    - require:
      - file: java_install

/opt/jdk/bin/jstack:
  file.managed:
    - mode: 755
    - order: last
    - require:
      - file: java_install
