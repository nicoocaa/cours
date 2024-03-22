**TP3**
-

```
ip neigh show
10.3.1.1 dev enp0s3 lladdr 0a:00:27:00:00:04 DELAY
10.3.1.11 dev enp0s3 lladdr 08:00:27:32:04:bd STALE
ip a
1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
    link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
    inet 127.0.0.1/8 scope host lo
       valid_lft forever preferred_lft forever
    inet6 ::1/128 scope host
       valid_lft forever preferred_lft forever
2: enp0s3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
    link/ether 08:00:27:c7:80:9e brd ff:ff:ff:ff:ff:ff
    inet 10.3.1.12/24 
     brd 10.3.1.255 scope global noprefixroute enp0s3
       valid_lft forever preferred_lft forever
    inet6 fe80::a00:27ff:fec7:809e/64 scope link
       valid_lft forever preferred_lft forever
```


🌞Ajouter les routes statiques nécessaires pour que john et marcel puissent se ping
```
sudo ip route add 10.3.1.0/24 via 10.3.2.254 dev enp0s3
ip r s
10.3.1.0/24 via 10.3.2.254 dev enp0s3
10.3.2.0/24 dev enp0s3 proto kernel scope link src 10.3.2.12 metric 100
```

```
ping 10.3.1.11
PING 10.3.1.11 (10.3.1.11) 56(84) bytes of data.
64 bytes from 10.3.1.11: icmp_seq=1 ttl=63 time=1.33 ms
64 bytes from 10.3.1.11: icmp_seq=2 ttl=63 time=1.06 ms
64 bytes from 10.3.1.11: icmp_seq=3 ttl=63 time=1.14 ms
64 bytes from 10.3.1.11: icmp_seq=4 ttl=63 time=1.09 ms
^C
--- 10.3.1.11 ping statistics ---
4 packets transmitted, 4 received, 0% packet loss, time 3006ms
rtt min/avg/max/mdev = 1.064/1.155/1.327/0.102 ms


ping 10.3.2.12
PING 10.3.2.12 (10.3.2.12) 56(84) bytes of data.
64 bytes from 10.3.2.12: icmp_seq=1 ttl=63 time=0.941 ms
64 bytes from 10.3.2.12: icmp_seq=2 ttl=63 time=1.17 ms
64 bytes from 10.3.2.12: icmp_seq=3 ttl=63 time=1.21 ms
^C
--- 10.3.2.12 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2003ms
rtt min/avg/max/mdev = 0.941/1.105/1.207/0.117 ms
```

🌞Analyse des échanges ARP

```
| ordre | type trame  | IP source | MAC source                | IP destination | MAC destination            |
| ----- | ----------- | --------- | ------------------------- | -------------- | -------------------------- |
| 1     | Requête ARP | x         | `marcel` 0a:00:27:00:00:04| x              | Broadcast `FF:FF:FF:FF:FF` |
| 2     | Réponse ARP | x         | 'jonh'   08:00:27:32:04:bd| x              | `marcel` `0a:00:27:00:00:04|
| ...   | ...         | ...       | ...                       |                |                            |
| 3     | Ping        | 10.3.1.11 | 'jonh'   08:00:27:32:04:bd| 10.3.2.12      | `marcel` 0a:00:27:00:00:04 |
| 4     | Pong        | 10.3.2.12 | `marcel` 0a:00:27:00:00:04| 10.3.1.11      | 'jonh'   08:00:27:32:04:bd |

```

🌞Donnez un accès internet à vos machines

- routeur
```
[nico@localhost ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=114 time=30.2 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=114 time=31.6 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=114 time=17.7 ms
64 bytes from 8.8.8.8: icmp_seq=4 ttl=114 time=24.6 ms
64 bytes from 8.8.8.8: icmp_seq=5 ttl=114 time=26.5 ms
64 bytes from 8.8.8.8: icmp_seq=6 ttl=114 time=26.4 ms
64 bytes from 8.8.8.8: icmp_seq=7 ttl=114 time=18.2 ms
^C
--- 8.8.8.8 ping statistics ---
7 packets transmitted, 7 received, 0% packet loss, time 6011ms
rtt min/avg/max/mdev = 17.746/25.048/31.627/4.986 ms

```

- client

```
[nico@localhost ~]$ sudo ip route add default via 10.3.1.254 dev enp0s3
[sudo] password for nico:
[nico@localhost ~]$ ping 8.8.8.8
PING 8.8.8.8 (8.8.8.8) 56(84) bytes of data.
64 bytes from 8.8.8.8: icmp_seq=1 ttl=55 time=23.0 ms
64 bytes from 8.8.8.8: icmp_seq=2 ttl=55 time=21.5 ms
64 bytes from 8.8.8.8: icmp_seq=3 ttl=55 time=26.8 ms
^C
--- 8.8.8.8 ping statistics ---
3 packets transmitted, 3 received, 0% packet loss, time 2004ms
rtt min/avg/max/mdev = 21.505/23.783/26.813/2.231 ms

```