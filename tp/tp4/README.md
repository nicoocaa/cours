# TP4 : DHCP

# I. DHCP Client

🌞 **Déterminer**

- l'adresse du serveur DHCP 
- l'heure exacte à laquelle vous avez obtenu votre bail DHCP
- l'heure exacte à laquelle il va expirer


commande: 
```shell
ipconfig /all
```

resultat: 

```shell
   Suffixe DNS propre à la connexion. . . :
   Description. . . . . . . . . . . . . . : VMware Virtual Ethernet Adapter for VMnet8
   Adresse physique . . . . . . . . . . . : 00-50-56-C0-00-08
   DHCP activé. . . . . . . . . . . . . . : Oui
   Configuration automatique activée. . . : Oui
   Adresse IPv6 de liaison locale. . . . .: fe80::8cd4:183f:8480:4937%19(préféré)
   Adresse IPv4. . . . . . . . . . . . . .: 192.168.179.1(préféré)
   Masque de sous-réseau. . . . . . . . . : 255.255.255.0
   🌞Bail obtenu. . . . . . . . . . . . . . : vendredi 27 octobre 2023 09:03:24🌞
   🌞Bail expirant. . . . . . . . . . . . . : vendredi 27 octobre 2023 11:19:16🌞
   Passerelle par défaut. . . . . . . . . :
   🌞Serveur DHCP . . . . . . . . . . . . . : 192.168.179.254🌞
   IAID DHCPv6 . . . . . . . . . . . : 687886422
   DUID de client DHCPv6. . . . . . . . : 00-01-00-01-2B-C6-EC-29-8C-B0-E9-E7-DF-BF
   Serveur WINS principal . . . . . . . . : 192.168.179.2
   NetBIOS sur Tcpip. . . . . . . . . . . : Activé
```

🌞 **Capturer un échange DHCP**

- forcer votre OS à refaire un échange DHCP complet
premiére commande : 
```shell
ipconfig /release
```
deuxiéme commande: 

```shell
ipconfig /renew
```
- utiliser Wireshark pour capturer les 4 trames DHCP 

[resultat wireshark](./tp4_dhcp_client.pcapng) 

🌞 **Analyser la capture Wireshark**

- parmi ces 4 trames, laquelle contient les informations proposées au client ? 

la deuxiéme : dhcp ofter