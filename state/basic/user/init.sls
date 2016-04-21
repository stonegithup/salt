# use the following command to generate password hash:
# $ mkpasswd -m sha-512
# "password":"$6$pfQ6QtCz9xoQ$4/OX3.9boOvvPeiQ/eaniVTnPCf1o0/mZaWe7HJkv4krSn2Km3PEIgvJQWyHFXq.z0w3sSahjo0teurMicoBb/",
#
#/home/:
#  file.directory:
#    - user: root
#    - group: root
#    - mode: 755
cheese:
  group.present:
    - name: op
    - gid: 499
    - system: True

{% set users = {
  "op":{
      "shell":"/bin/bash",
      "home":"/home/op",
      "createhome":True,
      "uid":5000,
      "gid":5000,
      "gid_from_name":True,
      "password":"$6$yBf2n0zp2Z$bsLifley2EBt1IPqd9znQhzAT4R6uj7uKvP/BTCl2CGzhtX9MPY2dbknoEJyl9JKIyggj99fbZg/n1m16.lmJ/",
      "groups":["op"],
      "sudoservers":"none",
      "saltmaster":False
  },
  "yuancheng":{
      "shell":"/bin/bash",
      "home":"/home/yuancheng/",
      "createhome":True,
      "uid":5001,
      "gid":5001,
      "gid_from_name":True,
      "password":"$6$slc5WQuHEos$K.1/VkqzK1ML91jqopxpaFgKfQHYnbNt0Rmv1bSo5q1b1IEbLkeBrOrycvvOqQToF3WKCBgDcitC8a69exRD01",
      "groups":["op"],
      "sudoservers":"none",
      "saltmaster":False
  },
  "yfhua":{
      "shell":"/bin/bash",
      "home":"/home/yfhua",
      "createhome":True,
      "uid":5002,
      "gid":5002,
      "gid_from_name":True,
      "password":"$6$vbESrfE03eg$WAYdypgeB5JYUIJLQa79QPVMwf.hIzi16TZZxBr/MElUXiqu9xnVAHVuen1wzDsi62K3SuIttN/JB5KHhHjx11",
      "groups":["op"],
      "sudoservers":"none",
      "saltmaster":False
  }, 
  "ypzhao01":{
      "shell":"/bin/bash",
      "home":"/home/ypzhao01",
      "createhome":True,
      "uid":5003,
      "gid":5003,
      "gid_from_name":True,
      "password":"$6$ZMUy1Ka569Pey$E5tA88M1kOlX3GhTBKfUw6NMqUN6eSGZtmbtOJR8I2GttPGd2t2voclF1Rzl60QAZULVQNseqSOI9DW8sY1Lf.",
      "groups":["op"],
      "sudoservers":"none",
      "saltmaster":False
  },
  "zmwang":{
      "shell":"/bin/bash",
      "home":"/home/zmwang/",
      "createhome":True,
      "uid":5004,
      "gid":5004,
      "gid_from_name":True,
      "password":"$6$kQDlZibljogMPD7$PU7uckw3la7qeLpvVyV1.Ee.6gFIK/I8ud31R2FsAIb2WdH95B75Qn2IMslQjcHVy0EmzteU.UrHWIjL.uV0C.",
      "groups":["op"],
      "sudoservers":"none",
      "saltmaster":False
  },
  "limin":{
      "shell":"/bin/bash",
      "home":"/home/limin",
      "createhome":True,
      "uid":5005,
      "gid":5005,
      "gid_from_name":True,
      "password":"$6$8uo7h/UPt$C1fr4Wd1hMluWlWzw9e1nSitBdo0re8oLfDwgUWJQZTMbyZeOF6MhBpbMhYeuCHDfQM7i3AAQJneuG1oHgZFy1",
      "groups":["op"],
      "sudoservers":"none",
      "saltmaster":True
  },
  "liangke":{
      "shell":"/bin/bash",
      "home":"/home/liangke",
      "createhome":True,
      "uid":5006,
      "gid":5006,
      "gid_from_name":True,
      "password":"$6$BstaaDKMzAMlloOI$a/KFGx3mV8QLcGX/wCg2y516lQx.NAtdQiNjyoygogzpaqZeYvEiQC5z8d23NEjl4ClT2I.viXrV/6uYIh7JH/",
      "groups":["op"],
      "sudoservers":"none",
      "saltmaster":False
  },
  "wumin01":{
      "shell":"/bin/bash",
      "home":"/home/wumin01/",
      "createhome":True,
      "uid":5007,
      "gid":5007,
      "gid_from_name":True,
      "password":"$6$y5Zohz2sy2d1$QT2iiXMK0/etQjRiIiy/Ep1Nr1odMOvgs59ZGtSml0o5mlFOsqitthcBQDJhBm5ZuVCOs/F4cbMQBfKMQaIvz/",
      "groups":["op"],
      "sudoservers":"none",
      "saltmaster":False
  },
}

%}

{% for user,userconf in users.items() %}
{{user}}:
  user.present:
    - shell: {{userconf.shell}}
    - home: {{userconf.home}}
    - createhome: {{userconf.createhome}}
    - uid: {{userconf.uid}}
    - gid: {{userconf.gid}}
    - gid_from_name: {{userconf.gid_from_name}}
    - password: {{userconf.password}}
    - groups:
      {% for group in userconf.groups %}
      - {{group}}
      {% endfor %}
      {% if userconf.sudoservers == "all" %}
      - sudo 
      {% elif grains['id'] in userconf.sudoservers %}
      - sudo
      {% endif %}
      {% if grains['id'] == 'mt.y7tech.cn' and userconf.saltmaster == True %}
      - saltmaster
      {% endif %}
{% endfor %}

#{% for delete_user in [ 'ybzhang', 'jbcao' ] %}
#{{ delete_user }}: 
#  user.absent:
#      - force: True
#{% endfor %}
