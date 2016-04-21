/etc/vim/vimrc:
  file.managed:
{% if grains["id"] !=  "mt.y7tech.cn" %}
    - source: salt://basic/conf/vimrc
{% else %}
    - source: salt://basic/conf/vimrc.mt
{% endif %}
    - user: root
    - group: root

