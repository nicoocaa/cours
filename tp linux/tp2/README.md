# Partie : Files and users

# I. Fichiers

## 1. Find me

🌞 **Trouver le chemin vers le répertoire personnel de votre utilisateur**

```bash
[nico@localhost /]$ cd home/nico/
```

🌞 **Trouver le chemin du fichier de logs SSH**

```bash
[nico@localhost log]$ sudo cat secure | grep ssh
Oct 24 10:57:07 localhost sshd[885]: Server listening on 0.0.0.0 port 22.
Oct 24 10:57:07 localhost sshd[885]: Server listening on :: port 22.
Oct 24 11:11:51 localhost sshd[885]: Received signal 15; terminating.
Oct 24 11:11:52 localhost sshd[19939]: Server listening on 0.0.0.0 port 22.
Oct 24 11:11:52 localhost sshd[19939]: Server listening on :: port 22.
Nov 23 09:59:15 localhost sshd[675]: Server listening on 0.0.0.0 port 22.
Nov 23 09:59:15 localhost sshd[675]: Server listening on :: port 22.
Nov 23 10:00:46 localhost sshd[679]: Server listening on 0.0.0.0 port 22.
Nov 23 10:00:46 localhost sshd[679]: Server listening on :: port 22.
Jan 22 11:40:12 localhost sshd[678]: Server listening on 0.0.0.0 port 22.
Jan 22 11:40:12 localhost sshd[678]: Server listening on :: port 22.
Jan 22 11:45:11 localhost sshd[683]: Server listening on 0.0.0.0 port 22.
Jan 22 11:45:11 localhost sshd[683]: Server listening on :: port 22.
Jan 22 11:46:13 localhost sshd[1329]: Accepted password for nico from 10.5.1.1 port 49861 ssh2
Jan 22 11:46:13 localhost sshd[1329]: pam_unix(sshd:session): session opened for user nico(uid=1000) by (uid=0)
Jan 22 11:59:00 localhost sudo[1369]:    nico : TTY=pts/0 ; PWD=/home/nico ; USER=root ; COMMAND=/bin/cat /etc/ssh/sshd_config
```

🌞 **Trouver le chemin du fichier de configuration du serveur SSH**

```bash
[nico@localhost log]$ sudo cat /etc/ssh/sshd_config | grep ssh
#       $OpenBSD: sshd_config,v 1.104 2021/07/02 05:11:21 dtucker Exp $
# This is the sshd server system-wide configuration file.  See
# sshd_config(5) for more information.
# This sshd was compiled with PATH=/usr/local/bin:/usr/bin:/usr/local/sbin:/usr/sbin
# The strategy used for options in the default sshd_config shipped with
# To modify the system-wide sshd configuration, create a  *.conf  file under
#  /etc/ssh/sshd_config.d/  which will be automatically included below
Include /etc/ssh/sshd_config.d/*.conf
# semanage port -a -t ssh_port_t -p tcp #PORTNUMBER
#HostKey /etc/ssh/ssh_host_rsa_key
#HostKey /etc/ssh/ssh_host_ecdsa_key
#HostKey /etc/ssh/ssh_host_ed25519_key
# The default is to check both .ssh/authorized_keys and .ssh/authorized_keys2
# but this is overridden so installations will only check .ssh/authorized_keys
AuthorizedKeysFile      .ssh/authorized_keys
# For this to work you will also need host keys in /etc/ssh/ssh_known_hosts
# Change to yes if you don't trust ~/.ssh/known_hosts for
#PidFile /var/run/sshd.pid
Subsystem       sftp    /usr/libexec/openssh/sftp-server
```
# II. Users

## 1. Nouveau user

🌞 **Créer un nouvel utilisateur**

```bash
[nico@localhost log]$ sudo useradd -m -d /home/papier_alu/marmotte -p chocolat marmotte
```

## 2. Infos enregistrées par le système


🌞 **Prouver que cet utilisateur a été créé**

```bash
[nico@localhost log]$ cat /etc/passwd | grep marmotte
marmotte:x:1001:1001::/home/papier_alu/marmotte:/bin/bash
```

🌞 **Déterminer le *hash* du password de l'utilisateur `marmotte`**

```bash
[nico@localhost log]$ sudo cat /etc/shadow | grep marmotte
marmotte:chocolat:19744:0:99999:7:::
```


## 3. Connexion sur le nouvel utilisateur

🌞 **Tapez une commande pour vous déconnecter : fermer votre session utilisateur**

```[nico@localhost log]$ exit
logout```

🌞 **Assurez-vous que vous pouvez vous connecter en tant que l'utilisateur `marmotte`**

```bash
[marmotte@localhost papier_alu]$ cd ..
[marmotte@localhost home]$ ls
nico  papier_alu
[marmotte@localhost home]$ cd nico/
-bash: cd: nico/: Permission denied
```