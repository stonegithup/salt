app:
  git:
    - home: /home/git/
    - port: 8080
    - pro: tcp
    - tname: mtcp
  nginx:
    - home: /etc/nginx/
    - port: 80
    - pro: tcp
    - tname: mtcp
  ssh:
    - home: /etc/ssh
    - port: 22
    - pro: tcp
    - tname: mtcp  
  apache2:
    - home: /etc/apache2/
    - port: 80
    - pro: tcp
    - tname: mtcp
  mysql:
    - home: /etc/mysql/
    - port: 3306
    - pro: tcp
    - tname: mtcp
  rsync:
    - home: /etc/rsync.d/
    - port: 873
    - pro: tcp
    - tname: mtcp
