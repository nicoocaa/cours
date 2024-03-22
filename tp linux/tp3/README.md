# I. Service SSH

## 1. Analyse du service


🌞 **S'assurer que le service `sshd` est démarré**

```bash
[nico@node1 ~]$ systemctl status sshd
● sshd.service - OpenSSH server daemon
     Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; preset: enabled)
     Active: active (running) since Mon 2024-01-29 10:54:47 CET; 18min ago
       Docs: man:sshd(8)
             man:sshd_config(5)
   Main PID: 682 (sshd)
      Tasks: 1 (limit: 4610)
     Memory: 5.0M
        CPU: 207ms
     CGroup: /system.slice/sshd.service
             └─682 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

Jan 29 10:54:47 localhost sshd[682]: main: sshd: ssh-rsa algorithm is disabled
Jan 29 10:54:47 localhost sshd[682]: Server listening on 0.0.0.0 port 22.
Jan 29 10:54:47 localhost sshd[682]: Server listening on :: port 22.
Jan 29 10:54:47 localhost systemd[1]: Started OpenSSH server daemon.
Jan 29 10:55:08 localhost.localdomain sshd[1323]: main: sshd: ssh-rsa algorithm is disabled
Jan 29 10:55:11 localhost.localdomain sshd[1323]: Accepted password for nico from 10.2.1.1 port 59150 ssh2
Jan 29 10:55:11 localhost.localdomain sshd[1323]: pam_unix(sshd:session): session opened for user nico(uid=1000) by (uid=0)
Jan 29 11:05:29 node1.tp2.b1 sshd[1385]: main: sshd: ssh-rsa algorithm is disabled
Jan 29 11:05:31 node1.tp2.b1 sshd[1385]: Accepted password for nico from 10.2.1.1 port 59280 ssh2
Jan 29 11:05:31 node1.tp2.b1 sshd[1385]: pam_unix(sshd:session): session opened for user nico(uid=1000) by (uid=0)
```

🌞 **Analyser les processus liés au service SSH**


```bash
[nico@node1 ~]$ ps -ef | grep sshd
root         682       1  0 10:54 ?        00:00:00 sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups
root        1385     682  0 11:05 ?        00:00:00 sshd: nico [priv]
nico        1389    1385  0 11:05 ?        00:00:00 sshd: nico@pts/0
nico        1421    1390  0 11:13 pts/0    00:00:00 grep --color=auto sshd
```

🌞 **Déterminer le port sur lequel écoute le service SSH**

```bash
[nico@node1 ~]$ sudo ss | grep ssh
tcp   ESTAB  0      0                         10.2.1.11:ssh           10.2.1.1:59280
```

🌞 **Consulter les logs du service SSH**

```bash
[nico@node1 ~]$ journalctl -xe -u sshd
~
~
~
~
~
~
~
~
~
~
~
~
~
~
Jan 29 10:54:47 localhost systemd[1]: Starting OpenSSH server daemon...
░░ Subject: A start job for unit sshd.service has begun execution
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░
░░ A start job for unit sshd.service has begun execution.
░░
░░ The job identifier is 217.
Jan 29 10:54:47 localhost sshd[682]: main: sshd: ssh-rsa algorithm is disabled
Jan 29 10:54:47 localhost sshd[682]: Server listening on 0.0.0.0 port 22.
Jan 29 10:54:47 localhost sshd[682]: Server listening on :: port 22.
Jan 29 10:54:47 localhost systemd[1]: Started OpenSSH server daemon.
░░ Subject: A start job for unit sshd.service has finished successfully
░░ Defined-By: systemd
░░ Support: https://access.redhat.com/support
░░
░░ A start job for unit sshd.service has finished successfully.
░░
░░ The job identifier is 217.
Jan 29 10:55:08 localhost.localdomain sshd[1323]: main: sshd: ssh-rsa algorithm is disabled
Jan 29 10:55:11 localhost.localdomain sshd[1323]: Accepted password for nico from 10.2.1.1 port 59150 ssh2
Jan 29 10:55:11 localhost.localdomain sshd[1323]: pam_unix(sshd:session): session opened for user nico(uid=1000) by (uid=0)
Jan 29 11:05:29 node1.tp2.b1 sshd[1385]: main: sshd: ssh-rsa algorithm is disabled
Jan 29 11:05:31 node1.tp2.b1 sshd[1385]: Accepted password for nico from 10.2.1.1 port 59280 ssh2
Jan 29 11:05:31 node1.tp2.b1 sshd[1385]: pam_unix(sshd:session): session opened for user nico(uid=1000) by (uid=0)
```

## 2. Modification du service


🌞 **Identifier le fichier de configuration du serveur SSH**

```bash
[nico@node1 ssh]$ cat ssh_config
#       $OpenBSD: ssh_config,v 1.35 2020/07/17 03:43:42 dtucker Exp $

# This is the ssh client system-wide configuration file.  See
# ssh_config(5) for more information.  This file provides defaults for
# users, and the values can be changed in per-user configuration files
# or on the command line.

# Configuration data is parsed as follows:
#  1. command line options
#  2. user-specific file
#  3. system-wide file
# Any configuration value is only changed the first time it is set.
# Thus, host-specific definitions should be at the beginning of the
# configuration file, and defaults at the end.

# Site-wide defaults for some commonly used options.  For a comprehensive
# list of available options, their meanings and defaults, please see the
# ssh_config(5) man page.

# Host *
#   ForwardAgent no
#   ForwardX11 no
#   PasswordAuthentication yes
#   HostbasedAuthentication no
#   GSSAPIAuthentication no
#   GSSAPIDelegateCredentials no
#   GSSAPIKeyExchange no
#   GSSAPITrustDNS no
#   BatchMode no
#   CheckHostIP yes
#   AddressFamily any
#   ConnectTimeout 0
#   StrictHostKeyChecking ask
#   IdentityFile ~/.ssh/id_rsa
#   IdentityFile ~/.ssh/id_dsa
#   IdentityFile ~/.ssh/id_ecdsa
#   IdentityFile ~/.ssh/id_ed25519
#   Port 22
#   Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc
#   MACs hmac-md5,hmac-sha1,umac-64@openssh.com
#   EscapeChar ~
#   Tunnel no
#   TunnelDevice any:any
#   PermitLocalCommand no
#   VisualHostKey no
#   ProxyCommand ssh -q -W %h:%p gateway.example.com
#   RekeyLimit 1G 1h
#   UserKnownHostsFile ~/.ssh/known_hosts.d/%k
#
# This system is following system-wide crypto policy.
# To modify the crypto properties (Ciphers, MACs, ...), create a  *.conf
#  file under  /etc/ssh/ssh_config.d/  which will be automatically
# included below. For more information, see manual page for
#  update-crypto-policies(8)  and  ssh_config(5).
Include /etc/ssh/ssh_config.d/*.conf
```
🌞 **Modifier le fichier de conf**
```bash
[nico@node1 ssh]$ echo $RANDOM
2552
[nico@node1 ssh]$ sudo cat /etc/ssh/sshd_config | grep Port
#Port 22
#GatewayPorts no
[nico@node1 ssh]$ sudo firewall-cmd --remove-port=22/tcp --permanent
Warning: NOT_ENABLED: 22:tcp
success
[nico@node1 ssh]$ sudo firewall-cmd --add-port=2552/tcp --permanent
success
[nico@node1 ssh]$ sudo firewall-cmd --reload
success
[nico@node1 ssh]$ sudo firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp0s3 enp0s8
  sources:
  services: cockpit dhcpv6-client ssh
  ports: 2552/tcp
  protocols:
  forward: yes
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
```
🌞 **Redémarrer le service**

```bash
[nico@node1 ssh]$ sudo systemctl restart firewalld
```
🌞 Effectuer une connexion SSH sur le nouveau port

```
PS C:\Users\nico> ssh -p 25847 nico@10.2.1.11
nico@10.2.1.11's password:
Last login: Mon Jan 29 12:00:41 2024
[nico@node1 ~]$
```

II. Service HTTP

🌞 Installer le serveur NGINX

```
[nico@node1 ~]$ sudo dnf install nginx
Rocky Linux 9 - BaseOS                                                404  B/s | 4.1 kB     00:10
Rocky Linux 9 - BaseOS                                                142 kB/s | 2.2 MB     00:15
Rocky Linux 9 - AppStream                                             447  B/s | 4.5 kB     00:10
Rocky Linux 9 - AppStream                                             475 kB/s | 7.4 MB     00:15
Rocky Linux 9 - Extras                                                290  B/s | 2.9 kB     00:10
Package nginx-1:1.20.1-14.el9_2.1.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
```

🌞 Démarrer le service NGINX

```
[nico@node1 ~]$ sudo systemctl start nginx
[sudo] password for nico:
[nico@node1 ~]$ systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; vendor preset: disabled)
     Active: active (running) since Tue 2024-01-30 09:07:19 CET; 13s ago
    Process: 905 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
    Process: 906 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
    Process: 907 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
   Main PID: 908 (nginx)
      Tasks: 2 (limit: 5896)
     Memory: 3.3M
        CPU: 17ms
     CGroup: /system.slice/nginx.service
             ├─908 "nginx: master process /usr/sbin/nginx"
             └─909 "nginx: worker process"

Jan 30 09:07:19 node1.tp3.b1 systemd[1]: Starting The nginx HTTP and reverse proxy server...
```

🌞 Déterminer sur quel port tourne NGINX

```
[nico@node1 ~]$ sudo dnf update
[nico@node1 ~]$ sudo dnf install net-tools
[nico@node1 ~]$ netstat --version
```
```SHELL
[nico@node1 ~]$ sudo netstat -plnt | grep nginx
tcp        0      0 0.0.0.0:80              0.0.0.0:*               LISTEN      908/nginx: master p
tcp6       0      0 :::80                   :::*                    LISTEN      908/nginx: master p
```
```
[nico@node1 ~]$ sudo firewall-cmd --add-port=80/tcp --permanent
success
[nico@node1 ~]$ sudo firewall-cmd --reload
success
```

🌞 Déterminer les processus liés au service NGINX

```
[nico@node1 ~]$ ps aux | grep nginx
root         908  0.0  0.0  10084   300 ?        Ss   09:07   0:00 nginx: master process /usr/sbin/nginx
nginx        909  0.0  0.2  13852  2396 ?        S    09:07   0:00 nginx: worker process
nico    42794  0.0  0.2   6408  2176 pts/0    S+   09:35   0:00 grep --color=auto nginx
```

🌞 Déterminer le nom de l'utilisateur qui lance NGINX

```
[nico@node1 ~]$ ps aux | grep nginx
🌞root         908  0.0  0.0  10084   300 ?        Ss   09:07   0:00 nginx: master process /usr/sbin/nginx🌞
nginx        909  0.0  0.2  13852  2396 ?        S    09:07   0:00 nginx: worker process
nico    42794  0.0  0.2   6408  2176 pts/0    S+   09:35   0:00 grep --color=auto nginx
```
```
[nico@node1 ~]$ cat /etc/passwd | grep nginx
nginx:x:991:991:Nginx web server:/var/lib/nginx:/sbin/nologin
```

🌞 Test !

```
[nico@node1 ~]$ sudo curl http://10.2.1.11:80 | head -n 7
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
  0     0    0     0    0     0      0      0 --:--:-- --:--:-- --:--:--     0<!doctype html>
<html>
  <head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>HTTP Server Test Page powered by: Rocky Linux</title>
    <style type="text/css">
100  7620  100  7620    0     0   744k      0 --:--:-- --:--:-- --:--:--  826k
curl: (23) Failed writing body
```


2. Analyser la conf de NGINX
🌞 Déterminer le path du fichier de configuration de NGINX

```
[nico@node1 ~]$ ls -al /etc/nginx/nginx.conf
-rw-r--r--. 1 root root 2334 Oct 16 20:00 /etc/nginx/nginx.conf
```


🌞 Trouver dans le fichier de conf

```SHELL
[nico@node1 ~]$ cat /etc/nginx/nginx.conf | grep server -A 10
    server {
        listen       80;
        listen       [::]:80;
        server_name  _;
        root         /usr/share/nginx/html;

        # Load configuration files for the default server block.
        include /etc/nginx/default.d/*.conf;

        error_page 404 /404.html;
        location = /404.html {
        }

        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
        }
    }
--
# Settings for a TLS enabled server.
#
#    server {
#        listen       443 ssl http2;
#        listen       [::]:443 ssl http2;
#        server_name  _;
#        root         /usr/share/nginx/html;
#
#        ssl_certificate "/etc/pki/nginx/server.crt";
#        ssl_certificate_key "/etc/pki/nginx/private/server.key";
#        ssl_session_cache shared:SSL:1m;
#        ssl_session_timeout  10m;
#        ssl_ciphers PROFILE=SYSTEM;
#        ssl_prefer_server_ciphers on;
#
#        # Load configuration files for the default server block.
#        include /etc/nginx/default.d/*.conf;
#
#        error_page 404 /404.html;
#            location = /40x.html {
#        }
#
#        error_page 500 502 503 504 /50x.html;
#            location = /50x.html {
#        }
#    }
```

```
[nico@node1 ~]$ cat /etc/nginx/nginx.conf | grep include
include /usr/share/nginx/modules/*.conf;
    include             /etc/nginx/mime.types;
    # See http://nginx.org/en/docs/ngx_core_module.html#include
    include /etc/nginx/conf.d/*.conf;
        include /etc/nginx/default.d/*.conf;
#        include /etc/nginx/default.d/*.conf;
```


3. Déployer un nouveau site web
🌞 Créer un site web

```
[nico@node1 ~]$ sudo mkdir -p /var/www/tp3_linux
```
```
[nico@node1 ~]$ cd /var/www/tp3_linux
```
```
[nico@node1 tp3_linux]$ sudo nano index.html
```
```
[nico@node1 tp3_linux]$ sudo cat index.html
<h1>MEOW mon premier serveur web</h1>
```

🌞 Gérer les permissions

```
[nico@node1 ~]$ sudo chown -R nginx:nginx /var/www/tp3_linux
[sudo] password for nico:
```

🌞 Adapter la conf NGINX
```
[nico@node1 ~]$ sudo systemctl restart nginx
[nico@node1 ~]$ sudo nano /etc/nginx/nginx.conf

[nico@node1 nginx]$ ls
[nico@node1 nginx]$ cd conf.d
[nico@node1 conf.d]$ ls
[nico@node1 conf.d]$ sudo nano tp3.conf
[nico@node1 conf.d]$ echo $RANDOM
21850
[nico@node1 conf.d]$ sudo nano tp3.conf
[nico@node1 conf.d]$ sudo systemctl restart nginx
[nico@node1 conf.d]$ sudo firewall-cmd --add-port=21850/tcp --permanent
success
[nico@node1 conf.d]$ sudo firewall-cmd --reload
success
```

🌞 Visitez votre super site web

```
[nico@node1 conf.d]$ curl http://10.2.1.11:21850
<h1>MEOW mon premier serveur web</h1>
```


III. Your own services



🌞 Afficher le fichier de service SSH

```
[nico@node1 ~]$ systemctl status sshd
● sshd.service - OpenSSH server daemon
     Loaded: loaded (/usr/lib/systemd/system/sshd.service; enabled; preset: enabled)
     Active: active (running) since Tue 2024-01-30 09:24:06 CET; 1h 45min ago
       Docs: man:sshd(8)
             man:sshd_config(5)
   Main PID: 18011 (sshd)
      Tasks: 1 (limit: 5896)
     Memory: 3.1M
        CPU: 47ms
     CGroup: /system.slice/sshd.service
             └─18011 "sshd: /usr/sbin/sshd -D [listener] 0 of 10-100 startups"

Jan 30 09:24:06 node1.tp3.b1 systemd[1]: Starting OpenSSH server daemon...
Jan 30 09:24:06 node1.tp3.b1 sshd[18011]: Server listening on 0.0.0.0 port 25847.
Jan 30 09:24:06 node1.tp3.b1 sshd[18011]: Server listening on :: port 25847.
```
```
[nico@node1 ~]$ cat /usr/lib/systemd/system/sshd.service | grep 'ExecStart='
ExecStart=/usr/sbin/sshd -D $OPTIONS
```
```
[nico@node1 ~]$ sudo systemctl start sshd
```


🌞 Afficher le fichier de service NGINX

```
[nico@node1 ~]$ systemctl status nginx
● nginx.service - The nginx HTTP and reverse proxy server
     Loaded: loaded (/usr/lib/systemd/system/nginx.service; disabled; preset: disabled)
     Active: active (running) since Tue 2024-01-30 10:56:27 CET; 17min ago
    Process: 42996 ExecStartPre=/usr/bin/rm -f /run/nginx.pid (code=exited, status=0/SUCCESS)
    Process: 42997 ExecStartPre=/usr/sbin/nginx -t (code=exited, status=0/SUCCESS)
    Process: 42998 ExecStart=/usr/sbin/nginx (code=exited, status=0/SUCCESS)
   Main PID: 42999 (nginx)
      Tasks: 2 (limit: 5896)
     Memory: 1.9M
        CPU: 16ms
     CGroup: /system.slice/nginx.service
             ├─42999 "nginx: master process /usr/sbin/nginx"
             └─43000 "nginx: worker process"

Jan 30 10:56:27 node1.tp3.b1 systemd[1]: nginx.service: Deactivated successfully.
Jan 30 10:56:27 node1.tp3.b1 systemd[1]: Stopped The nginx HTTP and reverse proxy server.
Jan 30 10:56:27 node1.tp3.b1 systemd[1]: Starting The nginx HTTP and reverse proxy server...
Jan 30 10:56:27 node1.tp3.b1 nginx[42997]: nginx: the configuration file /etc/nginx/nginx.conf syntax>
Jan 30 10:56:27 node1.tp3.b1 nginx[42997]: nginx: configuration file /etc/nginx/nginx.conf test is su>
Jan 30 10:56:27 node1.tp3.b1 systemd[1]: Started The nginx HTTP and reverse proxy server.
```
```
[nico@node1 ~]$ cat /usr/lib/systemd/system/nginx.service | grep 'ExecStart='
ExecStart=/usr/sbin/nginx
```

🌞 Créez le fichier /etc/systemd/system/tp3_nc.service

```
[nico@node1 ~]$ echo $RANDOM
13584
[nico@node1 ~]$ sudo nano /etc/systemd/system/tp3_nc.service
[nico@node1 ~]$ sudo firewall-cmd --add-port=13584/tcp --permanent
success
[nico@node1 ~]$ sudo firewall-cmd --reload
success
```

🌞 Indiquer au système qu'on a modifié les fichiers de service

```
[nico@node1 ~]$ sudo systemctl daemon-reload
```

🌞 Démarrer notre service de ouf

```
[nico@node1 ~]$ sudo systemctl start tp3_nc.service
```

🌞 Vérifier que ça fonctionne

```
[nico@node1 ~]$ sudo systemctl status tp3_nc.service
● tp3_nc.service - Super netcat tout fou
     Loaded: loaded (/etc/systemd/system/tp3_nc.service; static)
     Active: active (running) since Tue 2024-01-30 11:23:19 CET; 50s ago
   Main PID: 43109 (nc)
      Tasks: 1 (limit: 5896)
     Memory: 1.1M
        CPU: 4ms
     CGroup: /system.slice/tp3_nc.service
             └─43109 /usr/bin/nc -l 13584 -k

Jan 30 11:23:19 node1.tp3.b1 systemd[1]: Started Super netcat tout fou.
```
```
[nico@node1 ~]$ ss -tln | grep 13584
LISTEN 0      10           0.0.0.0:13584      0.0.0.0:*
LISTEN 0      10              [::]:13584         [::]:*
```

```
[nico@node1 ~]$ sudo journalctl -xe -u tp3_nc.service -f
Jan 30 11:23:19 node1.tp3.b1 systemd[1]: Started Super netcat tout fou.
░░ Subject: A start job for unit tp3_nc.service has finished successfully
░░ Defined-By: systemd
░░ Support: https://wiki.rockylinux.org/rocky/support
░░
░░ A start job for unit tp3_nc.service has finished successfully.
░░
░░ The job identifier is 3615.
Jan 30 11:29:00 node1.tp3.b1 nc[43109]: SSH-2.0-OpenSSH_9.5
Jan 30 11:29:07 node1.tp3.b1 nc[43109]: SSH-2.0-OpenSSH_9.5
Jan 30 11:59:04 node1.tp3.b1 nc[43109]: gfd
Jan 30 12:11:39 node1.tp3.b1 nc[43109]: dfs
Jan 30 12:11:40 node1.tp3.b1 nc[43109]: fdsq
Jan 30 12:11:40 node1.tp3.b1 nc[43109]: dfsq
Jan 30 12:13:20 node1.tp3.b1 nc[43109]: bonjour
Jan 30 12:13:23 node1.tp3.b1 nc[43109]: ça va
Jan 30 12:13:26 node1.tp3.b1 nc[43109]: no
```


🌞 Les logs de votre service

```
[nico@node1 ~]$ sudo journalctl -xe -u tp3_nc | grep start
░░ Subject: A start job for unit tp3_nc.service has finished successfully
░░ A start job for unit tp3_nc.service has finished successfully.
```
```
[nico@node1 ~]$ sudo journalctl -xe -u tp3_nc | grep nc
░░ Subject: A start job for unit tp3_nc.service has finished successfully
░░ A start job for unit tp3_nc.service has finished successfully.
Jan 30 11:29:00 node1.tp3.b1 nc[43109]: SSH-2.0-OpenSSH_9.5
Jan 30 11:29:07 node1.tp3.b1 nc[43109]: SSH-2.0-OpenSSH_9.5
Jan 30 11:59:04 node1.tp3.b1 nc[43109]: gfd
Jan 30 12:11:40 node1.tp3.b1 nc[43109]: dfsq
Jan 30 12:13:20 node1.tp3.b1 nc[43109]: bonjour
Jan 30 12:13:23 node1.tp3.b1 nc[43109]: ça va
Jan 30 12:13:26 node1.tp3.b1 nc[43109]: no
```
```
[nico@node1 ~]$  sudo journalctl -xe -u tp3_nc | grep finished
░░ Subject: A start job for unit tp3_nc.service has finished successfully
░░ A start job for unit tp3_nc.service has finished successfully. 
```

🌞 S'amuser à kill le processus

```
[nico@node1 ~]$ ps -fe | grep nc
dbus         657       1  0 08:58 ?        00:00:00 /usr/bin/dbus-broker-launch --scope system --audit
root         693       1  0 08:58 ?        00:00:00 login -- nico
nico      839       1  0 09:04 ?        00:00:00 /usr/lib/systemd/systemd --user
nico      841     839  0 09:04 ?        00:00:00 (sd-pam)
nico      849     693  0 09:04 tty1     00:00:00 -bash
🌞root       43109       1  0 11:23 ?        00:00:00 /usr/bin/nc -l 13584 -k🌞
root       43166   18011  0 12:01 ?        00:00:00 sshd: nico [priv]
nico    43170   43166  0 12:01 ?        00:00:00 sshd: nico@pts/0
nico    43171   43170  0 12:01 pts/0    00:00:00 -bash
nico    43230   43171  0 12:20 pts/0    00:00:00 ps -fe
nico    43231   43171  0 12:20 pts/0    00:00:00 grep --color=auto nc
```
```
[nico@node1 ~]$ sudo kill 43109
```

🌞 Affiner la définition du service

```
[nico@node1 ~]$ sudo cat /etc/systemd/system/tp3_nc.service
[Unit]
Description=Super netcat tout fou

[Service]
Restart=always
ExecStart=/usr/bin/nc -l 13584 -k
```
```
[nico@node1 ~]$ sudo systemctl start tp3_nc.service
[nico@node1 ~]$  ps -fe | grep nc
dbus         657       1  0 08:58 ?        00:00:00 /usr/bin/dbus-broker-launch --scope system --audit
root         693       1  0 08:58 ?        00:00:00 login -- nico
nico      839       1  0 09:04 ?        00:00:00 /usr/lib/systemd/systemd --user
nico      841     839  0 09:04 ?        00:00:00 (sd-pam)
nico      849     693  0 09:04 tty1     00:00:00 -bash
root       43166   18011  0 12:01 ?        00:00:00 sshd: nico [priv]
nico    43170   43166  0 12:01 ?        00:00:00 sshd: nico@pts/0
nico    43171   43170  0 12:01 pts/0    00:00:00 -bash
root       43259       1  0 12:28 ?        00:00:00 /usr/bin/nc -l 13584 -k
nico    43260   43171  0 12:29 pts/0    00:00:00 ps -fe
nico    43261   43171  0 12:29 pts/0    00:00:00 grep --color=auto nc
```
```
[nico@node1 ~]$ sudo kill 43259
```
```
[nico@node1 ~]$  ps -fe | grep nc
dbus         657       1  0 08:58 ?        00:00:00 /usr/bin/dbus-broker-launch --scope system --audit
root         693       1  0 08:58 ?        00:00:00 login -- nico
nico      839       1  0 09:04 ?        00:00:00 /usr/lib/systemd/systemd --user
nico      841     839  0 09:04 ?        00:00:00 (sd-pam)
nico      849     693  0 09:04 tty1     00:00:00 -bash
root       43166   18011  0 12:01 ?        00:00:00 sshd: nico [priv]
nico    43170   43166  0 12:01 ?        00:00:00 sshd: nico@pts/0
nico    43171   43170  0 12:01 pts/0    00:00:00 -bash
root       43265       1  0 12:29 ?        00:00:00 /usr/bin/nc -l 13584 -k
nico    43266   43171  0 12:29 pts/0    00:00:00 ps -fe
nico    43267   43171  0 12:29 pts/0    00:00:00 grep --color=auto nc
```