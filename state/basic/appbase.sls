#all Uc tom app 所在的组
Uc:
  group.present:
    - system: True
    - gid: 500
#
#all  app 都属于这组
App: 
  group.present:  
    - system: True 
    - gid: 501   
    
{#-
{% for dept in ['ucbptomcat', 'ucdisktomcat', 'ucdmtomcat','ucindexertomcat','ucsolrtomcat'] %}                                                                                 
/opt/{{ dept }}:
  file.directory:
    - user: {{ appuser }}
    - group: Uc
    - mode: 775
    - makedirs: False
    - require:
      - group: Uc
{% endfor %} 
-#}
