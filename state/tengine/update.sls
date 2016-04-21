/etc/tengine/nginx.conf:
  file.managed:
    - source: salt://tengine/files/nginx.conf

{% if grains['id'].find('uc') > -1 %}
/etc/tengine/conf.d/ucdisk.conf:
  file.managed:
    - source: salt://tengine/files/ucdisk.conf
{% endif %}

/etc/init.d/tengine:
  file.managed:
    - source: salt://tengine/files/tengine.sh
    - mode: 755

{% if grains['id'].find('nginx') == 0 and grains['id'] in ['nginx1.y7tech.cn','nginx2.y7tech.cn','nginx3.y7tech.cn','nginx4.y7tech.cn'] %}
{% include 'basic/git.sls' %}

git@git.y7tech.cn:mqfeng/nginx.git:
  git.latest:
    - target: /opt/nginx/
    - identity: {{ salt['pillar.get']('deploykeys_prefix') }} 
    - user: root
    - require:
      - pkg: git

bash /opt/nginx/bin/getnginx.sh:
  cron.present:
    - user: root
    #- minute: 10,20,30,40,50,00
    - minute: '*/3'

{% endif %}

/etc/tengine/conf.d/monit.conf:
  file.managed:
    - source: salt://tengine/files/nginx-status.conf
    - mode: 644
    - user: root

tengine:
  service.running:
    - reload: True
    - watch:
      {% if grains['id'].find('nginx') == 0 and grains['id'] in ['nginx1.y7tech.cn','nginx2.y7tech.cn','nginx3.y7tech.cn','nginx4.y7tech.cn'] %}
      - git: git@git.y7tech.cn:mqfeng/nginx.git
      {%endif%}
      - file: /etc/tengine/nginx.conf
