{% set domainname = 'ucsolr' %}
{% set username= 'appUcsolr' %}

{% include 'apachetomcat/doamin_install.sls.inc' with context %}
{% include 'uc/tomadmin/domainconf.sls.inc' with context %}


tomcate_install:
  file.recurse:
    - name: /opt/ucsolrtomcat/solr/
    - source: salt://uc/ucsolr/solr/
    - include_empty: True
    - user : appUcsolr
    - group: Uc
    - dir_mode: 755 
