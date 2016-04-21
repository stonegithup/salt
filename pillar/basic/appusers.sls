appusers:
  default:
    home: false
    shell: /bin/false
    uid: null
    passwd: null
    groups:

  appUcdisk:
    home: /opt/ucdisktomcat/
    shell: /bin/bash
    uid: 500
    groups:
      - Uc
  
  appUcdm:
    home: /opt/ucdmtomcat/
    shell: /bin/bash
    uid: 501
    groups:
      - Uc

  appUcbp:
    home: /opt/ucbptomcat/
    shell: /bin/bash
    uid: 502
    groups:
      - Uc

  appUcindexer:
    home: /opt/ucindexertomcat/
    shell: /bin/bash
    uid: 503
    groups:
      - Uc

  appUcsolr:
    home: /opt/ucsolrtomcat/
    shell: /bin/bash
    uid: 504
    groups:
      - Uc

  appUcoffice:
    home: /opt/ucofficetomcat/
    shell: /bin/bash
    uid: 505
    groups:
      - Uc

  appWing:
    home: /opt/wingtomcat/
    shell: /bin/bash
    uid: 506
    groups:
      - Uc
      - App

  appUcpcapp:
    home: /opt/pcapp/
    shell: /bin/bash
    uid: 507
    groups:
      - Uc

  appUctraffic:
    home: /opt/uctraffictomcat
    shell: /bin/bash
    uid: 508
    groups:
      - Uc

  appUcfeedback:
    home: /opt/ucfeedbacktomcat
    shell: /bin/bash
    uid: 509
    groups:
      - Uc
