# TP1

Je n'ai pas de port Ethernet je n'ai donc pas d'IP d'interface Ethernet 
Cependant je peux avoir l'adresse IP et l'adresse MAC de mon interface WiFi 
Pour cela il faut que je rentre la comande suivante dans mon terminal: 

```shell
ipconfig /all
```
les lignes qui corespondent a mon interface Wifi sont:

```shell
Carte réseau sans fil Wi-Fi :

   Suffixe DNS propre à la connexion. . . :
   Description. . . . . . . . . . . . . . : Intel(R) Wi-Fi 6E AX211 160MHz
   Adresse physique . . . . . . . . . . . : C8-5E-A9-3E-3E-FB
   DHCP activé. . . . . . . . . . . . . . : Oui
   Configuration automatique activée. . . : Oui
   Adresse IPv6 de liaison locale. . . . .: fe80::f37b:1af1:5fff:8ce2%8(préféré)
   Adresse IPv4. . . . . . . . . . . . . .: 10.33.48.15(préféré)
   Masque de sous-réseau. . . . . . . . . : 255.255.252.0
   Bail obtenu. . . . . . . . . . . . . . : mercredi 11 octobre 2023 10:04:09
   Bail expirant. . . . . . . . . . . . . : jeudi 12 octobre 2023 09:01:14
   Passerelle par défaut. . . . . . . . . : 10.33.51.254
   Serveur DHCP . . . . . . . . . . . . . : 10.33.51.254
   IAID DHCPv6 . . . . . . . . . . . : 97017513
   DUID de client DHCPv6. . . . . . . . : 00-01-00-01-2B-C6-EC-29-8C-B0-E9-E7-DF-BF
   Serveurs DNS. . .  . . . . . . . . . . : 10.33.10.2
                                       8.8.8.8
   NetBIOS sur Tcpip. . . . . . . . . . . : Activé
   ``` 

L'adresse IP de mon interface WiFi est donc `10.33.48.15`   
L'adresse MAC de mon interface Wifi: `C8-5E-A9-3E-3E-FB`  