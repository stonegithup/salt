{% set conf_path="/etc/y7tech/ucbp/" %}

{{conf_path}}/database.properties:
  file.managed:
    - source: salt://uc/ucbp/appconf/database.properties
    - user: appUcbp
    - group: Uc

{{conf_path}}/app.properties:
  file.managed:
    - source: salt://uc/ucbp/appconf/app.properties
    - user: appUcbp
    - group: Uc

