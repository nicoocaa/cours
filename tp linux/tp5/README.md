# script IDcard

```bash
[nico@vm1 ~]$ ./teste.sh
Machine name : vm1.tp5
OS 5.14.0-70.13.1.el9_0.x86_64 and kernel version is Rocky Linux
IP : 10.10.1.7/24
RAM : 413Mi memory available on 960Mi total memory
Disk : 16G space left
COMMAND
firewalld
NetworkManager
systemd
systemd

Listening ports :
- 323 udp :
- 323 udp :
- 22 tcp :
- 22 tcp :
Here is your random cat (jpg file) : https://cdn2.thecatapi.com/images/cnp.jpg
```

[teste.sh](teste.sh)

# II. Script youtube-dl


```bash
[nico@vm1 yt]$ ./yt.sh https://www.youtube.com/watch?v=1avzYu_paZA
./yt.sh: line 47: /var/log/yt/download.log: Permission denied
Téléchargement réussi: Vincent Milou's 'You Changed' Video Part _ SOLO
Lien de la vidéo: https://www.youtube.com/watch?v=1avzYu_paZA
Le fichier est stocké dans: /srv/yt/downloads/Vincent Milou's 'You Changed' Video Part _ SOLO/Vincent Milou's 'You Changed' Video Part _ SOLO.mp4
[nico@vm1 yt]$

``` 

```bash
[nico@vm1 downloads]$ ls
'LOST TRIOLOGY'  'NOAH _ The Art of Surfing (Directors Cut)'  'spin the block (2023)'  "Vincent Milou's 'You Changed' Video Part _ SOLO"
``` 

[yt.sh](yt.sh)  