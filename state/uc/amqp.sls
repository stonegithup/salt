{% set conf_path="/etc/y7tech/ucdm/" %}
{{conf_path}}/amqp.properties:
  file.managed:
    - source: salt://uc/ucdm/appconf/amqp.properties
    - user: appUcdm
    - group: Uc
