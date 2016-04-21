{% set conf_path="/etc/y7tech/ucfeedback/" %}

{{conf_path}}/database.properties:
  file.managed:
    - source: salt://uc/ucfeedback/appconf/database.properties
    - user: appUcfeedback
    - group: Uc

{{conf_path}}/app.properties:
  file.managed:
    - source: salt://uc/ucfeedback/appconf/app.properties
    - user: appUcfeedback
    - group: Uc

