{#- {% if grains['id'].find("of") >-1 %} -#}
libreoffice:
  pkg.installed

imagemagick:
    pkg.installed

# install 字体
ttf-arphic-uming:
    pkg.installed

ttf-wqy-zenhei:
    pkg.installed

uuid:
    pkg.installed

/usr/bin/office:
  file.managed:
    - source: salt://uc/ucoffice/office.sh
    - user: root
    - mode: 755

/usr/share/fonts/msyh.ttc:
  file.managed:
    - source: salt://uc/ucoffice/msyh.ttc
    - user: root
    - mode: 644

{#- {% endif %} -#}
