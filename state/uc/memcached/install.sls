memcached:
  pkg:
    - installed
    - skip_verify: True
  service:
    - running
    - reload: True
    - watch:
      - file: /etc/memcached.conf

/etc/memcached.conf:
  file.managed:
    - source: salt://uc/memcached/memcached.conf
