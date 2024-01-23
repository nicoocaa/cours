# II. SSH

## 1. Fingerprint

### B. Manips


🌞 **Effectuez une connexion SSH en vérifiant le fingerprint**

```shell
ssh nico@10.7.1.11
The authenticity of host '10.7.1.11 (10.7.1.11)' can't be established.
ED25519 key fingerprint is SHA256:H1o38uB9l53N8/GAgnyVbCSqkn+/v73DYcvgJPucueg.
This key is not known by any other names
Are you sure you want to continue connecting (yes/no/[fingerprint])? yes
Warning: Permanently added '10.7.1.11' (ED25519) to the list of known hosts.

```

## 2. Conf serveur SSH

On va faire un truc très basique, pour manipuler un peu toujours les cartes réseau, les IP, les ports, toussa : on va choisir explicitement l'IP et le port où tourne notre serveur SSH sur `router`.

La configuration du serveur SSH se fait dans le fichier `/etc/ssh/sshd_config`, utilisez `nano` pour le modifier par exemple.

Il faut être admin pour modifier le fichier, il faudra donc préfixer votre commande avec `sudo`.

🌞 **Consulter l'état actuel**

```shell
[nico@router ~]$ ss -tpn
State        Recv-Q        Send-Q               Local Address:Port               Peer Address:Port        Process
ESTAB        0             52                      10.7.1.254:22                     10.7.1.1:60039
```

🌞 **Prouvez que le changement a pris effet**

```shell
sudo ss -ltpn
State        Recv-Q        Send-Q               Local Address:Port                Peer Address:Port       Process
LISTEN       0             128                     10.7.1.254:22000                    0.0.0.0:*           users:(("sshd",pid=1513,fd=3))
```

🌞 **N'oubliez pas d'ouvrir ce nouveau port dans le firewall**

```shell
[nico@router ~]$ sudo firewall-cmd --add-port=22000/tcp --permanent
success
[nico@router ~]$ sudo firewall-cmd --reload
success
[nico@router ~]$ sudo firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp0s3 enp0s8
  sources:
  services: cockpit dhcpv6-client ssh
  ports: 22000/tcp
  protocols:
  forward: yes
  masquerade: yes
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
```

🌞 **Effectuer une connexion SSH sur le nouveau port**

```shell
ssh nico@10.7.1.254 -p 22000
nico@10.7.1.254's password:
Last login: Fri Nov 24 10:38:54 2023 from 10.7.1.1
```

## 3. Connexion par clé


### B. Manips



🌞 **Déposer la clé publique sur une VM**  

```shell
$ ssh-copy-id nico@10.7.1.11
/usr/bin/ssh-copy-id: INFO: Source of key(s) to be installed: "/c/Users/nicop/.ssh/id_rsa.pub"
/usr/bin/ssh-copy-id: INFO: attempting to log in with the new key(s), to filter out any that are already installed
/usr/bin/ssh-copy-id: INFO: 1 key(s) remain to be installed -- if you are prompted now it is to install the new keys
nico@10.7.1.11's password:

Number of key(s) added: 1

Now try logging into the machine, with:   "ssh 'nico@10.7.1.11'"
and check to make sure that only the key(s) you wanted were added.

```


🌞 **Connectez-vous en SSH à la machine**

```shell
PS C:\Users\nicop> ssh nico@10.7.1.11
Last login: Fri Nov 24 10:27:13 2023 from 10.7.1.1
[nico@john ~]$
```


# III. Web sécurisé

## 0. Setup

🌞 **Montrer sur quel port est disponible le serveur web**

```shell
[nico@web ~]$ ss -tln
State   Recv-Q  Send-Q   Local Address:Port     Peer Address:Port  Process
LISTEN  0       128            0.0.0.0:22            0.0.0.0:*
LISTEN  0       511            0.0.0.0:80            0.0.0.0:*
LISTEN  0       128               [::]:22               [::]:*
LISTEN  0       511               [::]:80               [::]:*
```

## 1. Setup HTTPS


🌞 **Générer une clé et un certificat sur `web.tp7.b1`**

```bash
[nico@web ~]$ openssl req -new -newkey rsa:2048 -days 365 -nodes -x509 -keyout server.key -out server.crt
...+..+...+...+.......+...+...+..............+.+..+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*...+......+.........+......+.+..+...+..........+...+.....+......+...+...+.........+...+.......+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*.......+...+.......+...+.........+........+....+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
....+...+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*...+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++*.+......+............+.+.........+..+....+.....+.+...+.....+...+...+.+...+...........+.........+.......+..................+..+.+...+............+...+..+.......+......+.........+...+...+.........+..+.........+.......+..+.+......+.....+......+...+....+..+.........+....+.....+.+......+.....+...+................+..+...+.+.............................+.+...+........+.......+..+.........+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
-----
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [XX]:
State or Province Name (full name) []:
Locality Name (eg, city) [Default City]:
Organization Name (eg, company) [Default Company Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (eg, your name or your server's hostname) []:
Email Address []:
[nico@web ~]$ sudo mv server.key /etc/pki/tls/private/web.tp7.b1.key
[sudo] password for nico:
[nico@web ~]$ sudo mv server.crt /etc/pki/tls/certs/web.tp7.b1.crt
[nico@web ~]$ sudo chown nginx:nginx /etc/pki/tls/private/web.tp7.b1.key
[nico@web ~]$ sudo chown nginx:nginx /etc/pki/tls/certs/web.tp7.b1.crt
[nico@web ~]$ sudo chmod 0400 /etc/pki/tls/private/web.tp7.b1.key
[nico@web ~]$ sudo chmod 0444 /etc/pki/tls/certs/web.tp7.b1.crt
```

🌞 **Modification de la conf de NGINX**

```bash
sudo nano /etc/nginx/conf.d/site_web_nul.conf 
```

```bash
server {
  # le port sur lequel on veut écouter
  listen 10.7.1.12:443 ssl;


  ssl_certificate /etc/pki/tls/certs/web.tp7.b1.crt;
  ssl_certificate_key /etc/pki/tls/private/web.tp7.b1.key;


  # le nom de la page d'accueil si le client de la précise pas
  index index.html;

  # un nom pour notre serveur (pas vraiment utile ici, mais bonne pratique)
  server_name www.site_web_nul.b1;

  # le dossier qui contient notre site web
  root /var/www/site_web_nul;
}

```

🌞 **Conf firewall**

```bash
[nico@web ~]$ sudo firewall-cmd --add-port=443/tcp --permanent
success
[nico@web ~]$ sudo firewall-cmd --reload
success
[nico@web ~]$ sudo firewall-cmd --list-all
public (active)
  target: default
  icmp-block-inversion: no
  interfaces: enp0s3
  sources:
  services: cockpit dhcpv6-client ssh
  ports: 80/tcp 443/tcp
  protocols:
  forward: yes
  masquerade: no
  forward-ports:
  source-ports:
  icmp-blocks:
  rich rules:
```

🌞 **Redémarrez NGINX**

```bash
sudo systemctl restart nginx
```

🌞 **Prouvez que NGINX écoute sur le port 443/tcp**

```bash
[nico@web ~]$ ss -tln
State   Recv-Q  Send-Q   Local Address:Port     Peer Address:Port  Process
LISTEN  0       511          10.7.1.12:443           0.0.0.0:*
LISTEN  0       128            0.0.0.0:22            0.0.0.0:*
LISTEN  0       511            0.0.0.0:80            0.0.0.0:*
LISTEN  0       128               [::]:22               [::]:*
LISTEN  0       511               [::]:80               [::]:*
```

🌞 **Visitez le site web en https**

```bash
[nico@john ~]$ curl -k https://10.7.1.12
<h1>coucou<h1>
```


# IV. VPN


### A. Setup serveur


🌞 **Installer le serveur Wireguard sur `vpn.tp7.b1`**

```bash
[nico@vpn ~]$ sudo modprobe wireguard
[nico@vpn ~]$ echo wireguard | sudo tee /etc/modules-load.d/wireguard.conf
wireguard
[nico@vpn ~]$ sudo nano /etc/sysctl.conf
[nico@vpn ~]$ sudo nano /etc/sysctl.conf
[nico@vpn ~]$ sudo sysctl -p
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
[nico@vpn ~]$ sudo dnf install wireguard-tools -y
Rocky Linux 9 - BaseOS                      284  B/s | 4.1 kB     00:14
Rocky Linux 9 - BaseOS                      144 kB/s | 2.2 MB     00:15
Rocky Linux 9 - AppStream                   445  B/s | 4.5 kB     00:10
Rocky Linux 9 - AppStream                   479 kB/s | 7.4 MB     00:15
Rocky Linux 9 - Extras                      289  B/s | 2.9 kB     00:10
Rocky Linux 9 - Extras                      879  B/s |  13 kB     00:15
Dependencies resolved.
============================================================================
 Package               Arch      Version                 Repository    Size
============================================================================Installing:
 wireguard-tools       x86_64    1.0.20210914-2.el9      appstream    115 k
Upgrading:
 systemd               x86_64    252-18.el9              baseos       3.9 M
 systemd-libs          x86_64    252-18.el9              baseos       652 k
 systemd-pam           x86_64    252-18.el9              baseos       261 k
 systemd-rpm-macros    noarch    252-18.el9              baseos        50 k
 systemd-udev          x86_64    252-18.el9              baseos       1.8 M
Installing dependencies:
 systemd-resolved      x86_64    252-18.el9              baseos       361 k

Transaction Summary
============================================================================
Install  2 Packages
Upgrade  5 Packages

Total download size: 7.1 M
Downloading Packages:
(1/7): systemd-resolved-252-18.el9.x86_64.r  69 kB/s | 361 kB     00:05
(2/7): wireguard-tools-1.0.20210914-2.el9.x  22 kB/s | 115 kB     00:05
(3/7): systemd-rpm-macros-252-18.el9.noarch 1.4 MB/s |  50 kB     00:00
(4/7): systemd-udev-252-18.el9.x86_64.rpm   345 kB/s | 1.8 MB     00:05
(5/7): systemd-pam-252-18.el9.x86_64.rpm    1.2 MB/s | 261 kB     00:00
(6/7): systemd-252-18.el9.x86_64.rpm         17 MB/s | 3.9 MB     00:00
(7/7): systemd-libs-252-18.el9.x86_64.rpm   1.4 MB/s | 652 kB     00:00
----------------------------------------------------------------------------
Total                                       448 kB/s | 7.1 MB     00:16
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                    1/1
  Upgrading        : systemd-libs-252-18.el9.x86_64                    1/12
  Running scriptlet: systemd-libs-252-18.el9.x86_64                    1/12
  Upgrading        : systemd-rpm-macros-252-18.el9.noarch              2/12
  Upgrading        : systemd-pam-252-18.el9.x86_64                     3/12
  Running scriptlet: systemd-252-18.el9.x86_64                         4/12
  Upgrading        : systemd-252-18.el9.x86_64                         4/12
  Running scriptlet: systemd-252-18.el9.x86_64                         4/12
  Running scriptlet: systemd-resolved-252-18.el9.x86_64                5/12
  Installing       : systemd-resolved-252-18.el9.x86_64                5/12
  Running scriptlet: systemd-resolved-252-18.el9.x86_64                5/12
  Installing       : wireguard-tools-1.0.20210914-2.el9.x86_64         6/12
  Upgrading        : systemd-udev-252-18.el9.x86_64                    7/12
  Running scriptlet: systemd-udev-252-18.el9.x86_64                    7/12
  Running scriptlet: systemd-udev-252-14.el9_2.3.0.1.x86_64            8/12
  Cleanup          : systemd-udev-252-14.el9_2.3.0.1.x86_64            8/12
  Running scriptlet: systemd-udev-252-14.el9_2.3.0.1.x86_64            8/12
  Cleanup          : systemd-pam-252-14.el9_2.3.0.1.x86_64             9/12
  Cleanup          : systemd-252-14.el9_2.3.0.1.x86_64                10/12
  Running scriptlet: systemd-252-14.el9_2.3.0.1.x86_64                10/12
  Cleanup          : systemd-rpm-macros-252-14.el9_2.3.0.1.noarch     11/12
  Cleanup          : systemd-libs-252-14.el9_2.3.0.1.x86_64           12/12
  Running scriptlet: systemd-libs-252-14.el9_2.3.0.1.x86_64           12/12
  Verifying        : systemd-resolved-252-18.el9.x86_64                1/12
  Verifying        : wireguard-tools-1.0.20210914-2.el9.x86_64         2/12
  Verifying        : systemd-udev-252-18.el9.x86_64                    3/12
  Verifying        : systemd-udev-252-14.el9_2.3.0.1.x86_64            4/12
  Verifying        : systemd-rpm-macros-252-18.el9.noarch              5/12
  Verifying        : systemd-rpm-macros-252-14.el9_2.3.0.1.noarch      6/12
  Verifying        : systemd-pam-252-18.el9.x86_64                     7/12
  Verifying        : systemd-pam-252-14.el9_2.3.0.1.x86_64             8/12
  Verifying        : systemd-libs-252-18.el9.x86_64                    9/12
  Verifying        : systemd-libs-252-14.el9_2.3.0.1.x86_64           10/12
  Verifying        : systemd-252-18.el9.x86_64                        11/12
  Verifying        : systemd-252-14.el9_2.3.0.1.x86_64                12/12

Upgraded:
  systemd-252-18.el9.x86_64         systemd-libs-252-18.el9.x86_64
  systemd-pam-252-18.el9.x86_64     systemd-rpm-macros-252-18.el9.noarch
  systemd-udev-252-18.el9.x86_64
Installed:
  systemd-resolved-252-18.el9.x86_64
  wireguard-tools-1.0.20210914-2.el9.x86_64

Complete!
```

🌞 **Générer la paire de clé du serveur sur `vpn.tp7.b1`**

```bash
[nico@vpn ~]$ wg genkey | sudo tee /etc/wireguard/server.key
WPb+q/fTVDlS2CBi7beUbf8SrQf5E32zDf3eu+idlkk=
[nico@vpn ~]$ sudo chmod 0400 /etc/wireguard/server.key
[nico@vpn ~]$ sudo cat /etc/wireguard/server.key | wg pubkey | sudo tee /etc/wireguard/server.pub
9GBcmx9mowKmYZAp+JaPnQgr+RhShh4ARxOaWdbsqVI=
```

🌞 **Générer la paire de clé du client sur `vpn.tp7.b1`**

```bash
[nico@vpn ~]$ sudo mkdir -p /etc/wireguard/clients
[nico@vpn ~]$ wg genkey | sudo tee /etc/wireguard/clients/john.key
gGL2oksCW017/xaeCSHpFwj6zP+Daw4LdhWLNOwWL0Q=
[nico@vpn ~]$ sudo chmod 0400 /etc/wireguard/server.key
[nico@vpn ~]$ sudo cat /etc/wireguard/clients/john.key | wg pubkey | tee /etc/wireguard/clients/john.pub
tee: /etc/wireguard/clients/john.pub: Permission denied
WDwWYTViL6atADI5WH67rO5KnpkUuVma75rw8FfF/l8=
```

🌞 **Création du fichier de config du serveur sur `vpn.tp7.b1`**


```bash
[nico@vpn ~]$ sudo cat /etc/wireguard/wg0.conf
[Interface]
Address = 10.107.1.0/24
SaveConfig = false
PostUp = firewall-cmd --zone=public --add-masquerade
PostUp = firewall-cmd --add-interface=wg0 --zone=public
PostDown = firewall-cmd --zone=public --remove-masquerade
PostDown = firewall-cmd --remove-interface=wg0 --zone=public
ListenPort = 13337
PrivateKey = WPb+q/fTVDlS2CBi7beUbf8SrQf5E32zDf3eu+idlkk=

[Peer]
PublicKey = WDwWYTViL6atADI5WH67rO5KnpkUuVma75rw8FfF/l8=
AllowedIPs = 10.107.1.11/32
```

🌞 **Démarrez le serveur VPN sur `vpn.tp7.b1`**

```bash
[nico@vpn ~]$ sudo systemctl start wg-quick@wg0.service
[nico@vpn ~]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:bc:4c:a7 brd ff:ff:ff:ff:ff:ff
    inet 10.7.1.101/24 brd 10.7.1.255 scope global noprefixroute enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:febc:4ca7/64 scope link
       valid_lft forever preferred_lft forever
3: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1000
    link/none
    inet 10.107.1.0/24 scope global wg0
       valid_lft forever preferred_lft forever
[nico@vpn ~]$ wg show
Unable to access interface wg0: Operation not permitted
[nico@vpn ~]$ sudo !!
sudo wg show
interface: wg0
  public key: 9GBcmx9mowKmYZAp+JaPnQgr+RhShh4ARxOaWdbsqVI=
  private key: (hidden)
  listening port: 13337

peer: WDwWYTViL6atADI5WH67rO5KnpkUuVma75rw8FfF/l8=
  allowed ips: 10.107.1.11/32
```

🌞 **Ouvrir le bon port firewall**

```bash
[nico@vpn ~]$ ss -tln | grep ":13337"
[nico@vpn ~]$ ss -uln | grep ":13337"
UNCONN 0      0            0.0.0.0:13337      0.0.0.0:*
UNCONN 0      0               [::]:13337         [::]:*
[nico@vpn ~]$ sudo firewall-cmd --add-port=13337/udp --permanent
success
[nico@vpn ~]$ sudo firewall-cmd --reload
success
```

### B. Setup client


🌞 **On installe les outils Wireguard sur `john.tp7.b1`**

```bash
[nico@john ~]$ sudo dnf install wireguard-tools
[sudo] password for nico:
Rocky Linux 9 - BaseOS                      775  B/s | 4.1 kB     00:05
Rocky Linux 9 - AppStream                   446  B/s | 4.5 kB     00:10
Rocky Linux 9 - Extras                      289  B/s | 2.9 kB     00:10
Dependencies resolved.
============================================================================
 Package               Arch      Version                 Repository    Size
============================================================================
Installing:
 wireguard-tools       x86_64    1.0.20210914-2.el9      appstream    115 k
Upgrading:
 systemd               x86_64    252-18.el9              baseos       3.9 M
 systemd-libs          x86_64    252-18.el9              baseos       652 k
 systemd-pam           x86_64    252-18.el9              baseos       261 k
 systemd-rpm-macros    noarch    252-18.el9              baseos        50 k
 systemd-udev          x86_64    252-18.el9              baseos       1.8 M
Installing dependencies:
 systemd-resolved      x86_64    252-18.el9              baseos       361 k

Transaction Summary
============================================================================
Install  2 Packages
Upgrade  5 Packages

Total download size: 7.1 M
Is this ok [y/N]: y
Downloading Packages:
(1/7): wireguard-tools-1.0.20210914-2.el9.x  23 kB/s | 115 kB     00:05
(2/7): systemd-resolved-252-18.el9.x86_64.r  68 kB/s | 361 kB     00:05
(3/7): systemd-pam-252-18.el9.x86_64.rpm    1.4 MB/s | 261 kB     00:00
(4/7): systemd-rpm-macros-252-18.el9.noarch  82 kB/s |  50 kB     00:00
(5/7): systemd-udev-252-18.el9.x86_64.rpm   304 kB/s | 1.8 MB     00:06
(6/7): systemd-libs-252-18.el9.x86_64.rpm   729 kB/s | 652 kB     00:00
(7/7): systemd-252-18.el9.x86_64.rpm        1.5 MB/s | 3.9 MB     00:02
----------------------------------------------------------------------------
Total                                       385 kB/s | 7.1 MB     00:18     Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                    1/1
  Upgrading        : systemd-libs-252-18.el9.x86_64                    1/12
  Running scriptlet: systemd-libs-252-18.el9.x86_64                    1/12
  Upgrading        : systemd-rpm-macros-252-18.el9.noarch              2/12
  Upgrading        : systemd-pam-252-18.el9.x86_64                     3/12
  Running scriptlet: systemd-252-18.el9.x86_64                         4/12
  Upgrading        : systemd-252-18.el9.x86_64                         4/12
  Running scriptlet: systemd-252-18.el9.x86_64                         4/12
  Running scriptlet: systemd-resolved-252-18.el9.x86_64                5/12
  Installing       : systemd-resolved-252-18.el9.x86_64                5/12
  Running scriptlet: systemd-resolved-252-18.el9.x86_64                5/12
  Installing       : wireguard-tools-1.0.20210914-2.el9.x86_64         6/12
  Upgrading        : systemd-udev-252-18.el9.x86_64                    7/12
  Running scriptlet: systemd-udev-252-18.el9.x86_64                    7/12
  Running scriptlet: systemd-udev-252-14.el9_2.3.0.1.x86_64            8/12
  Cleanup          : systemd-udev-252-14.el9_2.3.0.1.x86_64            8/12
  Running scriptlet: systemd-udev-252-14.el9_2.3.0.1.x86_64            8/12
  Cleanup          : systemd-pam-252-14.el9_2.3.0.1.x86_64             9/12
  Cleanup          : systemd-252-14.el9_2.3.0.1.x86_64                10/12
  Running scriptlet: systemd-252-14.el9_2.3.0.1.x86_64                10/12
  Cleanup          : systemd-rpm-macros-252-14.el9_2.3.0.1.noarch     11/12
  Cleanup          : systemd-libs-252-14.el9_2.3.0.1.x86_64           12/12
  Running scriptlet: systemd-libs-252-14.el9_2.3.0.1.x86_64           12/12
  Verifying        : systemd-resolved-252-18.el9.x86_64                1/12
  Verifying        : wireguard-tools-1.0.20210914-2.el9.x86_64         2/12
  Verifying        : systemd-udev-252-18.el9.x86_64                    3/12
  Verifying        : systemd-udev-252-14.el9_2.3.0.1.x86_64            4/12
  Verifying        : systemd-rpm-macros-252-18.el9.noarch              5/12
  Verifying        : systemd-rpm-macros-252-14.el9_2.3.0.1.noarch      6/12
  Verifying        : systemd-pam-252-18.el9.x86_64                     7/12
  Verifying        : systemd-pam-252-14.el9_2.3.0.1.x86_64             8/12
  Verifying        : systemd-libs-252-18.el9.x86_64                    9/12
  Verifying        : systemd-libs-252-14.el9_2.3.0.1.x86_64           10/12
  Verifying        : systemd-252-18.el9.x86_64                        11/12
  Verifying        : systemd-252-14.el9_2.3.0.1.x86_64                12/12

Upgraded:
  systemd-252-18.el9.x86_64         systemd-libs-252-18.el9.x86_64
  systemd-pam-252-18.el9.x86_64     systemd-rpm-macros-252-18.el9.noarch
  systemd-udev-252-18.el9.x86_64
Installed:
  systemd-resolved-252-18.el9.x86_64
  wireguard-tools-1.0.20210914-2.el9.x86_64

Complete!
```

🌞 **Supprimez votre route par défaut**

```bash
[nico@john ~]$ sudo ip route del default
[nico@john ~]$ ping 8.8.8.8
ping: connect: Network is unreachable
```

🌞 **Configurer un fichier de conf sur `john.tp7.b1`**

- utilisez `nano` pour éditer le fichier, je vous montre son contenu avec `cat`

```bash
[nico@john ~]$ sudo cat wireguard/john.conf
[Interface]
Address = 10.107.1.11/24
PrivateKey = gGL2oksCW017/xaeCSHpFwj6zP+Daw4LdhWLNOwWL0Q=

[Peer]
PublicKey = 9GBcmx9mowKmYZAp+JaPnQgr+RhShh4ARxOaWdbsqVI=
AllowedIPs = 0.0.0.0/0
Endpoint = 10.7.1.101:13337
```

🌞 **Lancer la connexion VPN**

```bash
[nico@john ~]$ cd wireguard
[nico@john wireguard]$ wg-quick up ./john.conf
Warning: `/home/nico/wireguard/john.conf' is world accessible
[#] ip link add john type wireguard
[#] wg setconf john /dev/fd/63
[#] ip -4 address add 10.107.1.11/24 dev john
[#] ip link set mtu 1420 up dev john
[#] wg set john fwmark 51820
[#] ip -4 route add 0.0.0.0/0 dev john table 51820
[#] ip -4 rule add not fwmark 51820 table 51820
[#] ip -4 rule add table main suppress_prefixlength 0
[#] sysctl -q net.ipv4.conf.all.src_valid_mark=1
[#] nft -f /dev/fd/63
```

🌞 **Vérifier la connexion**

```bash
[nico@john wireguard]$ ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:cc:b7:c4 brd ff:ff:ff:ff:ff:ff
    inet 10.7.1.11/24 brd 10.7.1.255 scope global noprefixroute enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fecc:b7c4/64 scope link
       valid_lft forever preferred_lft forever
3: john: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 1420 qdisc noqueue state UNKNOWN group default qlen 1000
    link/none
    inet 10.107.1.11/24 scope global john
       valid_lft forever preferred_lft forever
[nico@john wireguard]$ wg show
Unable to access interface john: Operation not permitted
[nico@john wireguard]$ sudo !!
sudo wg show
[sudo] password for nico:
interface: john
  public key: WDwWYTViL6atADI5WH67rO5KnpkUuVma75rw8FfF/l8=
  private key: (hidden)
  listening port: 34452
  fwmark: 0xca6c

peer: 9GBcmx9mowKmYZAp+JaPnQgr+RhShh4ARxOaWdbsqVI=
  endpoint: 10.7.1.101:13337
  allowed ips: 0.0.0.0/0
  latest handshake: 1 minute, 56 seconds ago
  transfer: 468 B received, 2.97 KiB sent
```
et pour le pvn: 

```bash
[nico@vpn ~]$ sudo wg show
interface: wg0
  public key: 9GBcmx9mowKmYZAp+JaPnQgr+RhShh4ARxOaWdbsqVI=
  private key: (hidden)
  listening port: 13337

peer: WDwWYTViL6atADI5WH67rO5KnpkUuVma75rw8FfF/l8=
  endpoint: 10.7.1.11:34452
  allowed ips: 10.107.1.11/32
  latest handshake: 1 minute, 54 seconds ago
  transfer: 3.46 KiB received, 716 B sent
```
