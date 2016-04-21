{% set userconf = salt['pillar.get']('appusers:default') %} 
{% do userconf.update(salt['pillar.get']('appusers:' + appuser)) %}
{{ appuser }}:
  user.present:
    - shell: {{ userconf['shell'] }}
    {% if userconf['home'] %}
    - home: {{ userconf['home'] }}
    {% else %} 
    - createhome: True
    {% endif %}
    {% if userconf['uid'] %}
    - uid: {{ userconf['uid'] }}
    {% endif %}  
    - gid: Uc
    - system: True
    {% if userconf['passwd'] %}
    - password: {{ userconf['passwd'] }}      
    {% endif %} 
    {% if userconf['groups'] %}             
    - groups:    
      {% for group in userconf['groups'] %}
      - {{ group }} 
      {% endfor %} 
    {% endif %}   
