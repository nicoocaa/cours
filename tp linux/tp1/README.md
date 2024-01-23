# TP1 : Casser avant de construire

**Dans ce TP on va casser des VMs.**

# II. Casser

## 2. Fichier

🌞 **Supprimer des fichiers**

j'ai suprimer le fichier bash 

la commande:

 ```shell
 cd bin
 sudo rm bash

 ```

 resultat: bah je ne peux plus me co

## 3. Utilisateurs

🌞 **Mots de passe**

    - changez le mot de passe de tous les utilisateurs qui en ont déjà un
- trouvez donc un moyen de lister les utilisateurs, et trouver ceux qui ont déjà un mot de passe

> *On peut parfaitement avoir un utilisateur sans mot de passe dans un système Linux : il ne peut pas se connecter du tout. On verra en quoi c'est utile plus tard dans les cours.*

🌞 **Another way ?**

- sans toucher aux mots de passe, faites en sorte qu'aucun utilisateur ne soit utilisable
- trouver un autre moyen donc, en restant sur les utilisateurs !

## 4. Disques

🌞 **Effacer le contenu du disque dur**

- ici on parle pas de toucher aux fichiers et dossiers qui existent au sein du disque dur de la VM
- mais de toucher directement au disque dur
- essayez de remplir le disque de zéros

## 5. Malware

🌞 **Reboot automatique**

- faites en sorte que si un utilisateur se connecte, ça déclenche un reboot automatique de la machine

## 6. You own way

🌞 **Trouvez 4 autres façons de détuire la machine**

- tout doit être fait depuis le terminal de la machine
- pensez à ce qui constitue un ordi/un OS
- l'idée c'est de supprimer des trucs importants, modifier le comportement de trucs existants, surcharger tel ou tel truc...

## 7. Bonus : remédiations

✨ **Trouver des remédiations**

- pour chacune des méthodes trouvées pour casser la VM
- trouver une méthode pour réparer

![Boom](./img/cat_boom.gif)