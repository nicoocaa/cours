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

🌞 **Effectuer une connexion SSH sur le nouveau port**

- depuis votre PC
- il faudra utiliser une option à la commande `ssh` pour vous connecter à la VM

> Je vous conseille de remettre le port par défaut une fois que cette partie est terminée.

✨ **Bonus : affiner la conf du serveur SSH**

- faites vos plus belles recherches internet pour améliorer la conf de SSH
- par "améliorer" on entend essentiellement ici : augmenter son niveau de sécurité
- le but c'est pas de me rendre 10000 lignes de conf que vous pompez sur internet pour le bonus, mais de vous éveiller à divers aspects de SSH, la sécu ou d'autres choses liées

![Such a hacker](./img/such_a_hacker.png)