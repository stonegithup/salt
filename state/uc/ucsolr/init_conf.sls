{% set conf_path="/etc/y7tech/ucsolr/" %}

{{conf_path}}/database.properties:
  file.managed:
    - source: salt://uc/ucsolr/appconf/database.properties
    - user: appUcsolr
    - group: Uc

{{conf_path}}/app.properties:
  file.managed:
    - source: salt://uc/ucsolr/appconf/app.properties
    - user: appUcsolr
    - group: Uc

{{conf_path}}/connector.properties:
  file.managed:
    - source: salt://uc/ucsolr/appconf/connector.properties
    - user: appUcsolr
    - group: Uc
