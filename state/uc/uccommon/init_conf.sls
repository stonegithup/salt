{% set conf_path="/etc/y7tech/uccommon" %}

{{conf_path}}/:
  file.directory:
    - user: appUcdisk
    - group: Uc
    - mode: 775 

{{conf_path}}/uccommon-app.properties:
  file.managed:
    - source: salt://uc/uccommon/appconf/uccommon-app.properties
    - user: appUcdisk
    - group: Uc
    - mode: 664 
