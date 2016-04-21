{% set conf_path="/etc/y7tech/ucdm/" %}
{{conf_path}}database.properties:
  file.managed:
    - source: salt://uc/ucdm/appconf/database.properties
    - user: appUcdm
    - group: Uc
{{conf_path}}/app.properties:
  file.managed:
    - source: salt://uc/ucdm/appconf/app.properties
    - user: appUcdm
    - group: Uc
{{conf_path}}/logoname.properties:
  file.managed:
    - source: salt://uc/ucdm/appconf/logoname.properties
    - user: appUcdm
    - group: Uc
{{conf_path}}/monitor.properties:
  file.managed:
    - source: salt://uc/ucdm/appconf/monitor.properties
    - user: appUcdm
    - group: Uc
{{conf_path}}/amqp.properties:
  file.managed:
    - source: salt://uc/ucdm/appconf/amqp.properties
    - user: appUcdm
    - group: Uc
