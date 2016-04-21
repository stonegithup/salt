{% set appuser= 'appUcpcapp' %}
{% set userconf = salt['pillar.get']('appusers:default') %} 
{% do userconf.update(salt['pillar.get']('appusers:' + appuser)) %}

{{ userconf['home'] }}/pcapp.jar:
  file.managed:
    - source: salt://uc/pcapp/y7pc-app.jar
    - user: appUcpcapp
    - mode: 744

/etc/init.d/pcapp:
  file.managed:
    - source: salt://uc/pcapp/pcapp
    - user: root
    - mode: 755

