
{% for pkg in ['make','libpcre3','libpcre3-dev','libcurl4-openssl-dev'] %}
{{pkg}}:
  pkg:
    - installed
    - skip_verify: True
{% endfor %}

wget_tengine:
  cmd.run:
    - name: wget http://source.y7tech.cn/system/tengine-2.1.1.tar.gz
    - cwd: /tmp/

extract_tengine:
  cmd.run:
    - name: tar xf tengine-2.1.1.tar.gz
    - cwd: /tmp/
    - require:
      - cmd: wget_tengine

./configure --prefix=/usr/share/tengine --with-ld-opt=-Wl,-rpath,/usr/share/tengine/luajit/lib --sbin-path=/usr/sbin/tengine --conf-path=/etc/tengine/nginx.conf --error-log-path=/var/log/tengine/error.log --http-log-path=/var/log/tengine/access.log --pid-path=/run/tengine.pid --lock-path=/run/tengine.lock --user=www-data --group=www-data --with-http_sysguard_module --with-http_ssl_module --with-http_realip_module --with-http_addition_module --with-http_sub_module --with-http_dav_module --with-http_flv_module --with-http_mp4_module --with-http_gzip_static_module --with-http_random_index_module --with-http_secure_link_module --with-http_stub_status_module --with-mail --with-mail_ssl_module --with-file-aio --with-ipv6:
    cmd.run:
      - cwd: /tmp/tengine-2.1.1/
      - require:
        - cmd: extract_tengine

compile_tengine:
  cmd.run:
    - cwd: /tmp/tengine-2.1.1/
    - name: make && make install

rm -rf /tmp/tengine-2.1.1/:
  cmd.run:
    - require:
      - cmd: compile_tengine

/var/log/tengine:
  file.directory:
    - user: www-data

/var/run/tengine:
  file.directory:
    - user: www-data

/etc/tengine/:
  file.directory:
    - user: root

/etc/tengine/conf.d/:
  file.directory:
    - user: root

/etc/tengine/sites-enabled/:
  file.directory:
    - user: root
{% if grains['id'].find('nginx') > -1 %}
{% endif %}

{% if grains['id'].find('uc') > -1 %}
/etc/tengine/nginx.conf:
  file.managed:
    - source: salt://tengine/files/nginx.conf
    - require:
      - cmd: compile_tengine

/etc/tengine/conf.d/ucdisk.conf:
  file.managed:
    - source: salt://tengine/files/ucdisk.conf
    - require:
      - cmd: compile_tengine

{% endif %}
/etc/init.d/tengine:
  file.managed:
    - source: salt://tengine/files/tengine.sh
    - user: root
    - group: root
    - mode: 755

update-rc.d -f tengine start 99 2 3 4 5 . stop 99 0 1 6 .:
  cmd.run:
    - user: root
