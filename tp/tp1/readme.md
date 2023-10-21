# TP1

Je n'ai pas de port Ethernet je n'ai donc pas d'IP d'interface Ethernet 
Si je veux mon IP et d'autre info je peux taper la commande suivante: 

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
L'adresse MAC de mon interface Wifi est donc `C8-5E-A9-3E-3E-FB`  
L'adresse IP de la passerelle `10.33.51.254` 


pour avoir l'adresse MAC de la passerelle j'utilise cette comande:

```shell
arp /a
```
j'obtient alors :

```shell
Interface : 10.33.48.15 --- 0x8
  Adresse Internet      Adresse physique      Type
  10.33.48.20           c4-03-a8-2a-95-4a     dynamique
  10.33.48.21           34-c9-3d-22-bb-b8     dynamique
  10.33.48.22           48-e7-da-a7-c7-5f     dynamique
  10.33.48.113          50-5a-65-4f-b8-61     dynamique
  10.33.48.121          48-e7-da-58-7c-03     dynamique
  10.33.51.254          7c-5a-1c-cb-fd-a4     dynamique
  10.33.51.255          ff-ff-ff-ff-ff-ff     statique
  224.0.0.22            01-00-5e-00-00-16     statique
  224.0.0.251           01-00-5e-00-00-fb     statique
  224.0.0.252           01-00-5e-00-00-fc     statique
  239.255.255.250       01-00-5e-7f-ff-fa     statique
  255.255.255.255       ff-ff-ff-ff-ff-ff     statique
``` 
L'adresse MAC de ma passerelle est donc : `7c-5a-1c-cb-fd-a4`

III

en faisant `ipconfig /all` je peux voir l'adresse ip du serveur dhcp 
l'adresse ip du serveur dhcp est donc `10.33.51.254`
toujours grace a la méme commande je peux voir la date d'expiration du bail dhcp

```shell
 Bail expirant. . . . . . . . . . . . . : mardi 17 octobre 2023 11:35:45
```

la commande `ipconfig /all` me permet de voir les adresse ip des serveurs dns connu 
il y a donc :
```shell
Serveurs DNS. . .  . . . . . . . . . . : 10.33.10.2
                                       8.8.8.8
```