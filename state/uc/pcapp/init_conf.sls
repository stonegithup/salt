{% set conf_path="/etc/y7tech/pcapp/" %}
{{conf_path}}:
  file.directory:
    - user: appUcpcapp
    - group: Uc
    - mode: 775 

{{conf_path}}/y7pcapp.properties:
  file.managed:
    - source: salt://uc/pcapp/appconf/y7pcapp.properties
    - user: appUcpcapp
    - group: Uc
