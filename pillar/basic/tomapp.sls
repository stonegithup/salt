tom_domains:
  default:
    xms: 512
    xmx: 512
    maxthreads: 1500
    minSpareThreads: 100
    connectionTimeout: 20000
    admin_port: 8008
    http_port: 8080
    redirectPort: 8443
    xss: 512
    appname:

  ucdisk:
    xms: 1024
    xmx: 2048
    admin_port: 8006
    http_port: 8080
    redirectPort: 8443
    appname: ucdisk
    xss: 1024

  ucindexer:
    xms: 512
    xmx: 512
    admin_port: 8011
    http_port: 8085
    redirectPort: 8448
    appname: ucindexer

  ucsolr:
    xms: 512
    xmx: 512
    admin_port: 8012
    http_port: 8086
    redirectPort: 8449
    appname: ucsolr

  ucbp:
    xms: 512
    xmx: 512
    admin_port: 8013
    http_port: 8087
    redirectPort: 8450
    appname: ucbp

  ucdm:
    xms: 128
    xmx: 128
    admin_port: 8014
    http_port: 8088
    redirectPort: 8451
    appname: ucdm

  ucoffice:
    xms: 2048
    xmx: 2048
    xss: 2048
    admin_port: 8015
    http_port: 8089
    redirectPort: 8452
    appname: ucoffice

  uctraffic:
    xms: 128
    xmx: 128
    admin_port: 8016
    http_port: 8090
    redirectPort: 8453
    appname: uctraffic

  ucfeedback:
    xms: 128
    xmx: 128
    admin_port: 8017
    http_port: 8091
    redirectPort: 8454
    appname: ucfeedback

  dzsw:
    xms: 1024
    xmx: 1024
    appname: wing
