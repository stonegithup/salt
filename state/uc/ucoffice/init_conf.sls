{% set conf_path="/etc/y7tech/ucoffice/" %}

{{conf_path}}/app.properties:
  file.managed:
    - source: salt://uc/ucoffice/appconf/app.properties
    - user: appUcoffice
    - group: Uc

{{conf_path}}/applicationContext.xml:
  file.managed:
    - source: salt://uc/ucoffice/appconf/applicationContext.xml
    - user: appUcoffice
    - group: Uc
/data/:
  file.directory:
    - user: root
    - mode: 755

/data/pic/:
  file.directory:
    - user: appUcoffice
    - group: Uc
    - mode: 755
