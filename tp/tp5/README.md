 # TP5 : TCP, UDP et services réseau

# I. First steps

🌞 **Déterminez, pour ces 5 applications, si c'est du TCP ou de l'UDP**

spotify: je me conecte a l'ip ```35.186.224.18``` et au port ```71 433```, c'est du type udp et j'ouvre le port ```56 192``` 

valorant: je me conecte a l'ip ```8.247.201.252``` et au port ```443```, c'est du type tcp et j'ouvre le port ```52336```

disney+: je me conecte a l'ip ```3.162.38.51``` et au port ```443```, c'est du type tcp et j'ouvre le port ```52561```  

chat gpt: je me conecte a l'ip ```34.120.214.181``` et au port ```443```, c'est du type tcp et j'ouvre le port ```52665```  

discord: je me conecte a l'ip ```20.199.120.1982```
et au port ```443```, c'est du type de tcp et j'ouvre le port ```59872```

🌞 **Demandez l'avis à votre OS**

Je tape la commande:  

```netstat -n -b```

j'obtient comme résultat 
```
Connexions actives

  Proto  Adresse locale         Adresse distante       État
  TCP    10.33.51.118:50817     34.111.115.192:443     ESTABLISHED
 [Discord.exe]
  TCP    10.33.51.118:50818     52.112.120.11:443      ESTABLISHED
 [Teams.exe]
  TCP    10.33.51.118:51790     162.159.136.234:443    ESTABLISHED
 [Discord.exe]
  TCP    10.33.51.118:52619     52.98.206.242:443      ESTABLISHED
 [Explorer.EXE]
  TCP    10.33.51.118:52704     52.45.70.115:443       ESTABLISHED
 [EpicGamesLauncher.exe]
  TCP    10.33.51.118:52868     2.21.35.208:443        ESTABLISHED
 [SearchHost.exe]
  TCP    127.0.0.1:52235        127.0.0.1:52236        ESTABLISHED
 [RiotClientServices.exe]
  TCP    [::1]:50833            [::1]:5426             ESTABLISHED
 [Razer Synapse Service Process.exe]
```

🦈🦈🦈🦈🦈 **Bah ouais, 5 captures Wireshark à l'appui évidemment.**  

[spotify](./tp5_service_1.pcapng)  
[valorant](./tp5_service_2.pcapng)  
[disney +](./tp5_service_3.pcapng)  
[chat_gpt](./tp5_service_4.pcapng)  
[discord](./tp5_service_5.pcapng) 

# II. Setup Virtuel

## 1. SSH  


🌞 **Demandez aux OS**

la commande windows ```netstat -n -b | Select-String "ssh.exe" -Context 1,0```

le résultat  
```shell
 TCP  10.5.1.1:56032  10.5.1.11:22  STABLISHED
>  [ssh.exe]
```

la commande linux ```ss -tpn```

le résultat  
```shell
State   Recv-Q   Send-Q     Local Address:Port Peer Address:Port   Process
ESTAB   0        52             10.5.1.11:22           10.5.1.1:56069
```

🦈 **`tp5_3_way.pcapng` : une capture clean avec le 3-way handshake, un peu de trafic au milieu et une fin de connexion**

[tp5_3_way](./tp5_3_way.pcapng)


🌞 **Prouvez que**

- `node1.tp4.b1` a un accès internet

```shell
[nico@localhost ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=112 time=46.5 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=112 time=20.8 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=112 time=18.0 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=112 time=19.2 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=112 time=24.8 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=112 time=22.0 ms
^C
--- 8.8.8.8 ping statistics ---
6 packets transmitted, 6 received, 0% packet loss, time 5011ms
```

- `node1.tp4.b1` peut résoudre des noms de domaine publics (comme `www.ynov.com`)

```shell
[nico@localhost ~]$ ping www.ynov.com
PING www.ynov.com (172.67.74.226) 56(84) bytes of data.
64 bytes from 172.67.74.226 (172.67.74.226): icmp_seq=1 ttl=55 time=49.0 ms
64 bytes from 172.67.74.226 (172.67.74.226): icmp_seq=2 ttl=55 time=22.9 ms
64 bytes from 172.67.74.226 (172.67.74.226): icmp_seq=3 ttl=55 time=23.2 ms
64 bytes from 172.67.74.226 (172.67.74.226): icmp_seq=4 ttl=55 time=24.8 ms
64 bytes from 172.67.74.226 (172.67.74.226): icmp_seq=5 ttl=55 time=24.0 ms
^C
--- www.ynov.com ping statistics ---
5 packets transmitted, 5 received, 0% packet loss, time 4012ms
```

## 3. Serveur Web
🌞 **Installez le paquet `nginx`**

```shell
[nico@localhost ~]$ sudo dnf install nginx
Last metadata expiration check: 0:00:34 ago on Fri 10 Nov 2023 12:17:47 PM CET.
Package nginx-1:1.20.1-14.el9_2.1.x86_64 is already installed.
Dependencies resolved.
Nothing to do.
Complete!
```

🌞 **Créer le site web**

```shell
[nico@localhost ~]$ sudo mkdir -p /var/www/site_web_nul
[nico@localhost ~]$ cd /var/www/site_web_nul/
[nico@localhost site_web_nul]$ sudo nano index.html
[nico@localhost site_web_nul]$ cat index.html
<h1>MEOW</h1>
```

🌞 **Donner les bonnes permissions**


```bash
[nico@localhost site_web_nul]$ sudo chown -R nginx:nginx /var/www/site_web_nul
```

🌞 **Créer un fichier de configuration NGINX pour notre site web**

- à l'installation du paquet `nginx`, un dossier dédié à stocker la configuration de nos sites web a été créé
  - ce dossier c'est `/etc/nginx/`
- plus spécifiquement, on va ajouter une configuration dans le dossiere `/etc/nginx/conf.d/`
- créez le fichier `/etc/nginx/conf.d/site_web_nul.conf` avec le contenu suivant :

```bash
[nico@localhost conf.d]$ sudo nano site_web_nul.conf
[sudo] password for nico:
[nico@localhost conf.d]$ cat site_web_nul.conf
server {
  listen 80;


  index index.html;


  server_name www.site_web_nul.b1


  root /var/www/site_web_nul;
}

```

🌞 **Démarrer le serveur web !**

```bash
[nico@localhost conf.d]$ sudo systemctl start nginx
[sudo] password for nico:
[nico@localhost conf.d]$
```

🌞 **Ouvrir le port firewall**

```bash
[nico@localhost conf.d]$ sudo firewall-cmd --zone=public --add-port=80/tcp --permanent
[sudo] password for nico:
success
[nico@localhost conf.d]$ sudo firewall-cmd --reload
success
```

🌞 **Visitez le serveur web !**

```bash
[nico@localhost ~]$ curl http://10.5.1.12
```

🌞 **Visualiser le port en écoute**

```bash
[nico@localhost conf.d]$ sudo ss -tlnp | grep :80
[sudo] password for nico:
LISTEN 0      511          0.0.0.0:80        0.0.0.0:*    users:(("nginx",pid=14216,fd=6),("nginx",pid=14215,fd=6))
LISTEN 0      511             [::]:80           [::]:*    users:(("nginx",pid=14216,fd=7),("nginx",pid=14215,fd=7))
```
🌞 **Analyse trafic**

- pendant que vous effectuez une connexion d'un client vers le serveur web qui tourne sur `web.tp4.b1`, lancez une capture réseau
- repérez :
  - le 3 way handshake TCP
  - du trafic HTTP
  - le contenu de la page HTML retourné (oui c'est visible direct dans Wireshark)

🦈 **`tp5_web.pcapng`** avec le 3-way handshake, la page HTML retournée, et une fin de connexion propre si vous en avez une :)