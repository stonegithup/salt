base:
  '*.y7tech.cn':
    - basic.dns
    - basic.hostname
    - basic.iptables
    - basic.ssh
    - basic.hosts
    - basic.vim
    - basic.package
    #- basic.monit
    - basic.git
    - zabbix
  'uc*.y7tech.cn':
    - basic.appbase
    - basic.git
    - basic.user
  'dzsw.y7tech.cn':
    - basic.appbase
    - basic.user
  'traffic.y7tech.cn':
    - basic.appbase
    - basic.user
  'of*.y7tech.cn':
    - basic.appbase
    - basic.user
  'nginx*.y7tech.cn':
    - basic.appbase
    - basic.user
  'mt.y7tech.cn':
    - basic.user.master
  '*.hdjy.com':
    - basic.appbase
    - basic.package
