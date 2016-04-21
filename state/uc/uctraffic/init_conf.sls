{% set conf_path="/etc/y7tech/uctraffic/" %}
{#-
{{conf_path}}/database.properties:
  file.managed:
    - source: salt://uc/uctraffic/appconf/database.properties
    - user: appUcbp
    - group: Uc

{{conf_path}}/app.properties:
  file.managed:
    - source: salt://uc/uctraffic/appconf/app.properties
    - user: appUcbp
    - group: Uc
-#}
