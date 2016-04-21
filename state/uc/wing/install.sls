{% set domainname = 'wing' %}
{% set username= 'appWing' %}

{% include 'apachetomcat/doamin_install.sls.inc' with context %}
{% include 'uc/tomadmin/domainconf.sls.inc' with context %}
