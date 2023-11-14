# I. ARP

🌞**Générer des requêtes ARP**

- effectuer un `ping` d'une machine à l'autre
- observer les tables ARP des deux machines
- repérer l'adresse MAC de `john` dans la table ARP de `marcel` et vice-versa
- prouvez que l'info est correcte (que l'adresse MAC que vous voyez dans la table est bien celle de la machine correspondante)
  - une commande pour voir la MAC de `marcel` dans la table ARP de `john`
  - et une commande pour afficher la MAC de `marcel`, depuis `marcel`

## 2. Analyse de trames

🌞**Analyse de trames**

- utilisez la commande `tcpdump` pour réaliser une capture de trame
- videz vos tables ARP, sur les deux machines, puis effectuez un `ping`

🦈 **Capture réseau `tp3_arp.pcapng`** qui contient un ARP request et un ARP reply

> **Si vous ne savez pas comment récupérer votre fichier `.pcapng`** sur votre hôte afin de l'ouvrir dans Wireshark, et me le livrer en rendu, demandez-moi.

![Wireshark first time](./img/wireshark.png)