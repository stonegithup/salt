{% set conf_path="/etc/y7tech/ucdisk/" %}

{{conf_path}}/database.properties:
  file.managed:
    - source: salt://uc/ucdisk/appconf/database.properties
    - user: appUcdisk
    - group: Uc

{{conf_path}}/app.properties:
  file.managed:
    - source: salt://uc/ucdisk/appconf/app.properties
    - user: appUcdisk
    - group: Uc

{{conf_path}}/memcached.properties:
  file.managed:
    - source: salt://uc/ucdisk/appconf/memcached.properties
    - user: appUcdisk
    - group: Uc

