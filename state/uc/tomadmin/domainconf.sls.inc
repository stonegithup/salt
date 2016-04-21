{% set domainconf = salt['pillar.get']('tom_domains:default') %}
{% do  domainconf.update(salt['pillar.get']('tom_domains:'+ domainname)) %}
{% set userconf = salt['pillar.get']('appusers:default') %}
{% do userconf.update(salt['pillar.get']('appusers:' + username)) %}

/etc/y7tech/:
  file.directory:
    - user: root
    - group: root
    - mode: 775 

/etc/y7tech/{{domainname}}/:
  file.directory:
    - mode: 775
    - user: {{username}}
    - groups: 
      {% for group in userconf['groups'] %}
      - {{ group }}
      {%endfor%}

{{userconf["home"]}}/conf/server.xml:
  file.managed:
    - source: salt://uc/tomadmin/server.xml
    - user: {{username}}
    - mode: 0644
    - template: jinja
    - context:
      admin_port: {{ domainconf['admin_port'] }}
      maxthreads: {{ domainconf['maxthreads'] }}
      minSpareThreads: {{ domainconf['minSpareThreads'] }}
      http_port: {{ domainconf['http_port'] }}
      connectionTimeout: {{ domainconf['connectionTimeout'] }}
      redirectPort: {{ domainconf['redirectPort'] }}
/usr/bin/tomadmin:
  file.managed:
    - source: salt://uc/tomadmin/tomadmin
    - user: root
    - mode: 755
