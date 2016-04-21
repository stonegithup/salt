{% set domainname = 'uctraffic' %}
{% set username= 'appUctraffic' %}

{% include 'apachetomcat/doamin_install.sls.inc' with context %}
{% include 'uc/tomadmin/domainconf.sls.inc' with context %}


mysql-server:
  pkg.installed
