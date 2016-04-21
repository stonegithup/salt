{% include 'java/init.sls' %}
{% set domainconf = salt['pillar.get']('tom_domains:default') %}
{% do  domainconf.update(salt['pillar.get']('tom_domains:'+ domainname)) %}
{% set userconf = salt['pillar.get']('appusers:default') %}
{% do userconf.update(salt['pillar.get']('appusers:' + username)) %}

{{domainname}}_install:
  file.recurse:
    - name: {{userconf['home']}}
    - source: salt://apachetomcat/apache-tomcat/
    - user : {{username}}
    - groups:
      {% for group in userconf['groups'] %}
      - {{ group }}
      {%endfor%}
    - dir_mode: 755
    - file_mode: 644

{{userconf['home']}}/bin/catalina.sh:
  file.managed:
    - mode: 755
    - require:
      - file: {{domainname}}_install
    - source: salt://apachetomcat/conf/catalina.sh

{{userconf['home']}}/bin/setclasspath.sh:
  file.managed:
    - mode: 644
    - require:
      - file: {{domainname}}_install
    - source: salt://apachetomcat/conf/setclasspath.sh
    - context: 
      domainconf: {{ domainconf }}
    - template: jinja
    - order: last
