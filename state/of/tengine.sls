/tmp/apache-tomcat.zip:
  file.managed:
    - source: salt://apachetomcat/apache-tomcat-7.0.40.zip
unzip:
  pkg.installed

unzip /tmp/apache-tomcat.zip -d /opt/:
  cmd.run:
    - user: root
    - require:
      - file:  /tmp/apache-tomcat.zip
      - pkg: unzip
mv /opt/apache-tomcat-7.0.40 /opt/ucofficetomcat/:
  cmd.run:
    - user: root


