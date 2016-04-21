{% set conf_path="/etc/y7tech/ucindexer/" %}

{{conf_path}}/database.properties:
  file.managed:
    - source: salt://uc/ucindex/appconf/database.properties
    - user: appUcindexer
    - group: Uc

{{conf_path}}/app.properties:
  file.managed:
    - source: salt://uc/ucindex/appconf/app.properties
    - user: appUcindexer
    - group: Uc
