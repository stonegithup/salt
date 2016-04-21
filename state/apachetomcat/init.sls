#不是一个完整的apachetomcat 去掉了 server.xml 
tomcate_install:
  file.recurse:
    - name: /opt/apache-tomcat/
    - source: salt://apachetomcat/apache-tomcat/
    - include_empty: True
    - user : root
    - group: root
    - dir_mode: 755
    - file_mode: 644
 
/opt/apache-tomcat/bin/catalina.sh:
  file.managed:
    - mode: 755
    - require:
      - file: tomcate_install
#/opt/apache-tomcat/bin/catalina.sh:
#  file.managed:
#    - source: salt://apachetomcat/conf/catalina.sh

#/opt/apache-tomcat/bin/setclasspath.sh:
#  file.managed:
#    - source: salt://apachetomcat/conf/setclasspath.sh

#/opt/apache-tomcat/appconf/:
#  file.directory:
#    - user : root
#    - group: root
#    - dir_mode: 755
#    - file_mode: 644
#    - recurse:
#      - user
#      - group
#      - mode

{% include "java/init.sls" %}
