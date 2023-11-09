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
  TCP    10.33.51.118:50839     52.114.76.237:443      ESTABLISHED
 [Teams.exe]
  TCP    10.33.51.118:51790     162.159.136.234:443    ESTABLISHED
 [Discord.exe]
  TCP    10.33.51.118:52570     20.199.120.182:443     ESTABLISHED
 [msedge.exe]
  TCP    10.33.51.118:52618     52.98.206.242:443      ESTABLISHED
 [Explorer.EXE]
  TCP    10.33.51.118:52619     52.98.206.242:443      ESTABLISHED
 [Explorer.EXE]
  TCP    10.33.51.118:52704     52.45.70.115:443       ESTABLISHED
 [EpicGamesLauncher.exe]
  TCP    10.33.51.118:52706     35.169.57.96:443       ESTABLISHED
 [EpicGamesLauncher.exe]
  TCP    10.33.51.118:52799     162.159.135.233:443    CLOSE_WAIT
 [Discord.exe]
  TCP    10.33.51.118:52850     3.93.96.89:443         ESTABLISHED
 [EpicGamesLauncher.exe]
  TCP    10.33.51.118:52852     20.42.73.24:443        ESTABLISHED
 [Code.exe]
  TCP    10.33.51.118:52868     2.21.35.208:443        ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52870     18.134.2.168:443       ESTABLISHED
 [MMSSHOST.EXE]
  TCP    10.33.51.118:52873     104.208.16.89:443      ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52874     40.99.217.50:443       ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52875     13.107.6.158:443       ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52876     13.107.6.158:443       ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52877     13.107.6.158:443       ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52878     13.107.6.158:443       ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52879     13.107.6.158:443       ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52880     13.107.6.158:443       ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52882     13.107.246.42:443      ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52883     13.107.4.254:443       ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52884     204.79.197.222:443     ESTABLISHED
 [SearchHost.exe]
  TCP    10.33.51.118:52885     34.199.33.7:443        ESTABLISHED
 [GameManagerService3.exe]
  TCP    10.33.51.118:52886     17.253.113.202:80      ESTABLISHED
  CryptSvc
 [svchost.exe]
  TCP    10.33.51.118:52887     23.77.197.180:80       ESTABLISHED
  CryptSvc
 [svchost.exe]
  TCP    10.33.51.118:52888     23.77.197.180:80       ESTABLISHED
  CryptSvc
 [svchost.exe]
  TCP    10.33.51.118:59872     20.199.120.182:443     ESTABLISHED
  WpnService
 [svchost.exe]
  TCP    127.0.0.1:49702        127.0.0.1:49703        ESTABLISHED
 [WUDFHost.exe]
  TCP    127.0.0.1:49703        127.0.0.1:49702        ESTABLISHED
 [WUDFHost.exe]
  TCP    127.0.0.1:49704        127.0.0.1:49705        ESTABLISHED
 [WUDFHost.exe]
  TCP    127.0.0.1:49705        127.0.0.1:49704        ESTABLISHED
 [WUDFHost.exe]
  TCP    127.0.0.1:49706        127.0.0.1:49707        ESTABLISHED
 [ipfsvc.exe]
  TCP    127.0.0.1:49707        127.0.0.1:49706        ESTABLISHED
 [ipfsvc.exe]
  TCP    127.0.0.1:52235        127.0.0.1:52236        ESTABLISHED
 [RiotClientServices.exe]
  TCP    127.0.0.1:52236        127.0.0.1:52235        ESTABLISHED
 [RiotClientServices.exe]
  TCP    127.0.0.1:52251        127.0.0.1:52252        ESTABLISHED
 [RiotClientServices.exe]
  TCP    127.0.0.1:52252        127.0.0.1:52251        ESTABLISHED
 [RiotClientServices.exe]
  TCP    127.0.0.1:52376        127.0.0.1:52377        ESTABLISHED
 [RiotClientServices.exe]
  TCP    127.0.0.1:52377        127.0.0.1:52376        ESTABLISHED
 [RiotClientServices.exe]
  TCP    127.0.0.1:65028        127.0.0.1:65029        ESTABLISHED
 [adb.exe]
  TCP    127.0.0.1:65029        127.0.0.1:65028        ESTABLISHED
 [adb.exe]
  TCP    127.0.0.1:65030        127.0.0.1:65031        ESTABLISHED
 [adb.exe]
  TCP    127.0.0.1:65031        127.0.0.1:65030        ESTABLISHED
 [adb.exe]
  TCP    [::1]:5426             [::1]:50829            ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    [::1]:5426             [::1]:50830            ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    [::1]:5426             [::1]:50831            ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    [::1]:5426             [::1]:50832            ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    [::1]:5426             [::1]:50833            ESTABLISHED
 Impossible d’obtenir les informations de propriétaire
  TCP    [::1]:50829            [::1]:5426             ESTABLISHED
 [Razer Synapse Service Process.exe]
  TCP    [::1]:50830            [::1]:5426             ESTABLISHED
 [Razer Synapse Service Process.exe]
  TCP    [::1]:50831            [::1]:5426             ESTABLISHED
 [Razer Synapse Service Process.exe]
  TCP    [::1]:50832            [::1]:5426             ESTABLISHED
 [Razer Synapse Service Process.exe]
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

| Machine        | Réseau `10.4.1.0/24` |
| -------------- | -------------------- |
| `node1.tp4.b1` | `10.4.1.11`          |

🖥️ **Machine `node1.tp4.b1`**

- n'oubliez pas de dérouler la checklist (voir [les prérequis du TP](#0-prérequis))
- donnez lui l'adresse IP `10.4.1.11/24`

Connectez-vous en SSH à votre VM.

🌞 **Examinez le trafic dans Wireshark**

- **déterminez si SSH utilise TCP ou UDP**
  - pareil réfléchissez-y deux minutes, logique qu'on utilise pas UDP non ?
- **repérez le *3-Way Handshake* à l'établissement de la connexion**
  - c'est le `SYN` `SYNACK` `ACK`
- **repérez du trafic SSH**
- **repérez le FIN ACK à la fin d'une connexion**
- entre le *3-way handshake* et l'échange `FIN`, c'est juste une bouillie de caca chiffré, dans un tunnel TCP

> **SUR WINDOWS, pour cette étape uniquement**, utilisez Git Bash et PAS Powershell. Avec Powershell il sera très difficile d'observer le FIN ACK.

🌞 **Demandez aux OS**

- repérez, avec une commande adaptée (`netstat` ou `ss`), la connexion SSH **depuis votre machine**
- ET repérez la connexion SSH **depuis la VM**
  - avec une commande `ss` dans le terminal depuis `web.tp4.b1`
  - il faudra rajouter des options pertinentes à la commandes `ss`
  - vous devez repérer clairement une ligne qui indique que c'est le programme `sshd` (le serveur SSH) qui est responsable de la connexion

🦈 **`tp5_3_way.pcapng` : une capture clean avec le 3-way handshake, un peu de trafic au milieu et une fin de connexion**

> Là encore, dans la capture, il ne doit y avoir QUE votre connexion SSH, du commencement de la session SSH, jusqu'à ce qu'elle se termine.

## 2. Routage

Ouais, un peu de répétition, ça fait jamais de mal. On va créer une machine qui sera notre routeur, et **permettra à toutes les autres machines du réseau d'avoir Internet.**

> On fera souvent ça désormais dans les TPs : toutes nos VMs et notre PC sont connectés à un switch host-only. Tout le monde a une IP dans le même réseau. Dans ce réseau, une des machines est un routeur, elle donne internet aux autres.

| Machine         | Réseau `10.4.1.0/24` |
| --------------- | -------------------- |
| `node1.tp4.b1`  | `10.4.1.11`          |
| `router.tp4.b1` | `10.4.1.254`         |

🖥️ **Machine `router.tp4.b1`**

- n'oubliez pas de dérouler la checklist (voir [les prérequis du TP](#0-prérequis))
- donnez lui l'adresse IP `10.4.1.254/24` sur sa carte host-only
- ajoutez-lui une carte NAT, qui permettra de donner Internet aux autres machines du réseau
- ajoutez une route par défaut à `node1.tp4.b1` pour qu'il ait un accès internet

🌞 **Prouvez que**

- `node1.tp4.b1` a un accès internet
- `node1.tp4.b1` peut résoudre des noms de domaine publics (comme `www.ynov.com`)

## 3. Serveur Web

Dans cette section on va monter un p'tit serveur Web sur une VM. Le serveur web hébergera un unique site web, qui sera super nul super moche parce qu'on est pas en cours de dév web :D

Le nom du serveur web qu'on va utiliser c'est NGINX. On l'installe, on le configure, on le lance, et PAF un site web hébergé en local disponible.

| Machine         | Réseau `10.4.1.0/24` |
| --------------- | -------------------- |
| `node1.tp4.b1`  | `10.4.1.11`          |
| `router.tp4.b1` | `10.4.1.254`         |
| `web.tp4.b1`    | `10.4.1.12`          |

🖥️ **Machine `web.tp4.b1`**

🌞 **Installez le paquet `nginx`**

- avec une commande `dnf install`

🌞 **Créer le site web**

- quand on héberge des sites web sur un serveur Linux, il existe un dossier qu'on utilise pour stocker les sites web, par convention
  - ce dossier c'est `/var/www/`
- créer donc un dossier `/var/www/site_web_nul/`
- créer un fichier `/var/www/site_web_nul/index.html` qui contient un code HTML simpliste de votre choix
  - un p'tit `<h1>MEOW</h1>` ça suffit hein

🌞 **Donner les bonnes permissions**

- l'utilisateur qui va lancer le serveur web, ce sera ni le vôtre, ni `root` mais un utilisateur dédié qui s'appelle `nginx`
- il faut donc lui donner les droits afin qu'il puisse lire le contenu du dossier et qu'il puisse servir le site web aux visiteurs
- pour ça, tapez la commande :

```bash
$ sudo chown -R nginx:nginx /var/www/site_web_nul
```

---

➜ On verra tout ça en détail en cours de Linux, mais j'aime pas jeter juste des commandes dans votre visage. Alors quelques points pour comprendre cette commande :

- dans Linux...
  - chaque fichier ou dossier est possédé par un utilisateur (forcément)
  - chaque fichier ou dossier est aussi possédé par un groupe d'utilisateurs (forcément)
  - l'utilisateur, et tous les membres du groupe, ont des droits sur le fichier/dossier en question (création, suppression, modification, exécution)
- `chown` pour "change owner" permet de changer le propriétaire d'un fichier ou d'un dossier
- on peut ajouter l'option `-R` à `chown` pour "recursif"
  - on va pas juste changer le propriétaire d'un dossier, mais aussi tous ses sous-dossiers et sous-fichiers
- `nginx:nginx`
  - le premier c'est l'utilisateur qui possédera le fichier (un user `nginx` a été créé quand vous avez installé le paquet)
  - le deuxième c'est le groupe qui possédera le fichier (ui, y'a un groupe `nginx` aussi qui a été créé)
- et enfin `/var/www/site_web_nul` : le dossier dont on veut changer le propriétaire
- et on fait ça avec `sudo` car seul un admin peut changer le propriétaire d'un fichier qui ne lui appartient pas (sinon y'aurait 0 sécu)

---

🌞 **Créer un fichier de configuration NGINX pour notre site web**

- à l'installation du paquet `nginx`, un dossier dédié à stocker la configuration de nos sites web a été créé
  - ce dossier c'est `/etc/nginx/`
- plus spécifiquement, on va ajouter une configuration dans le dossiere `/etc/nginx/conf.d/`
- créez le fichier `/etc/nginx/conf.d/site_web_nul.conf` avec le contenu suivant :

```nginx
server {
  # le port sur lequel on veut écouter
  listen 80;

  # le nom de la page d'accueil si le client de la précise pas
  index index.html;

  # un nom pour notre serveur (pas vraiment utile ici, mais bonne pratique)
  server_name www.site_web_nul.b1;

  # le dossier qui contient notre site web
  root /var/www/site_web_nul;
}
```

🌞 **Démarrer le serveur web !**

- avec une commande `sudo systemctl start nginx`
- si rien ne s'affiche, c'est que tout va bien
  - `systemctl status nginx` pour vérifier
- si quelque chose s'affiche c'est qu'il y a un soucis
  - lisez et interprétez le message d'erreur
  - si ça suffit pas/si vous galérez à comprendre, vous m'appelez

🌞 **Ouvrir le port firewall**

🌞 **Visitez le serveur web !**

- ouvrez un navigateur et taper `http://<IP_DE_LA_VM_WEB>`
  - vous remplacez évidemment `<IP_DE_LA_VM_WEB>` par... l'IP de la VM web :)
  - je veux pas ça dans le compte-rendu, ça se fait juste après en ligne de commande pour le compte-rendu
- il est possible de faire des requêtes HTTP depuis la ligne de commande avec la comande `curl`
  - utilisez la commande `curl` depuis `node1.tp4.b1` pour visiter le site web

🌞 **Visualiser le port en écoute**

- avec une commande `ss` dans le terminal depuis `web.tp4.b1`
  - il faudra ajouter des options à la commande `ss` sinon c'est imbuvable :)
  - vous devez repérer une ligne qui indique clairement que NGINX écoute derrière le port 80

🌞 **Analyse trafic**

- pendant que vous effectuez une connexion d'un client vers le serveur web qui tourne sur `web.tp4.b1`, lancez une capture réseau
- repérez :
  - le 3 way handshake TCP
  - du trafic HTTP
  - le contenu de la page HTML retourné (oui c'est visible direct dans Wireshark)

🦈 **`tp5_web.pcapng`** avec le 3-way handshake, la page HTML retournée, et une fin de connexion propre si vous en avez une :)