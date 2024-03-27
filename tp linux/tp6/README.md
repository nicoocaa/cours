# Partie 1 : Mise en place et maîtrise du serveur Web

🌞 **Installer le serveur Apache**

```bash
[nico@web ~]$ sudo yum install httpd
Rocky Linux 9 - BaseOS                           9.8 kB/s | 4.1 kB     00:00
Rocky Linux 9 - BaseOS                           1.7 MB/s | 2.2 MB     00:01
Rocky Linux 9 - AppStream                         15 kB/s | 4.5 kB     00:00
Rocky Linux 9 - AppStream                        2.0 MB/s | 7.4 MB     00:03
Rocky Linux 9 - Extras                           9.0 kB/s | 2.9 kB     00:00
Rocky Linux 9 - Extras                            45 kB/s |  14 kB     00:00
Dependencies resolved.
=================================================================================
 Package                 Architecture Version              Repository       Size
=================================================================================
Installing:
 httpd                   x86_64       2.4.57-5.el9         appstream        46 k
Installing dependencies:
 apr                     x86_64       1.7.0-12.el9_3       appstream       122 k
 apr-util                x86_64       1.6.1-23.el9         appstream        94 k
 apr-util-bdb            x86_64       1.6.1-23.el9         appstream        12 k
 httpd-core              x86_64       2.4.57-5.el9         appstream       1.4 M
 httpd-filesystem        noarch       2.4.57-5.el9         appstream        13 k
 httpd-tools             x86_64       2.4.57-5.el9         appstream        80 k
 mailcap                 noarch       2.1.49-5.el9         baseos           32 k
 rocky-logos-httpd       noarch       90.15-2.el9          appstream        24 k
Installing weak dependencies:
 apr-util-openssl        x86_64       1.6.1-23.el9         appstream        14 k
 mod_http2               x86_64       1.15.19-5.el9        appstream       148 k
 mod_lua                 x86_64       2.4.57-5.el9         appstream        60 k

Transaction Summary
=================================================================================
Install  12 Packages

Total download size: 2.0 M
Installed size: 6.0 M
Is this ok [y/N]: y
Downloading Packages:
(1/12): mailcap-2.1.49-5.el9.noarch.rpm          172 kB/s |  32 kB     00:00
(2/12): rocky-logos-httpd-90.15-2.el9.noarch.rpm 108 kB/s |  24 kB     00:00
(3/12): httpd-tools-2.4.57-5.el9.x86_64.rpm      1.0 MB/s |  80 kB     00:00
(4/12): mod_lua-2.4.57-5.el9.x86_64.rpm          214 kB/s |  60 kB     00:00
(5/12): httpd-2.4.57-5.el9.x86_64.rpm            776 kB/s |  46 kB     00:00
(6/12): apr-util-openssl-1.6.1-23.el9.x86_64.rpm 505 kB/s |  14 kB     00:00
(7/12): httpd-filesystem-2.4.57-5.el9.noarch.rpm 270 kB/s |  13 kB     00:00
(8/12): apr-util-bdb-1.6.1-23.el9.x86_64.rpm     301 kB/s |  12 kB     00:00
(9/12): apr-util-1.6.1-23.el9.x86_64.rpm         1.6 MB/s |  94 kB     00:00
(10/12): mod_http2-1.15.19-5.el9.x86_64.rpm      1.1 MB/s | 148 kB     00:00
(11/12): apr-1.7.0-12.el9_3.x86_64.rpm           869 kB/s | 122 kB     00:00
(12/12): httpd-core-2.4.57-5.el9.x86_64.rpm      2.4 MB/s | 1.4 MB     00:00
---------------------------------------------------------------------------------
Total                                            1.2 MB/s | 2.0 MB     00:01
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                         1/1
  Installing       : apr-1.7.0-12.el9_3.x86_64                              1/12
  Installing       : apr-util-bdb-1.6.1-23.el9.x86_64                       2/12
  Installing       : apr-util-1.6.1-23.el9.x86_64                           3/12
  Installing       : apr-util-openssl-1.6.1-23.el9.x86_64                   4/12
  Installing       : httpd-tools-2.4.57-5.el9.x86_64                        5/12
  Running scriptlet: httpd-filesystem-2.4.57-5.el9.noarch                   6/12
useradd warning: apache's uid 48 outside of the SYS_UID_MIN 201 and SYS_UID_MAX 999 range.

  Installing       : httpd-filesystem-2.4.57-5.el9.noarch                   6/12
  Installing       : rocky-logos-httpd-90.15-2.el9.noarch                   7/12
  Installing       : mailcap-2.1.49-5.el9.noarch                            8/12
  Installing       : httpd-core-2.4.57-5.el9.x86_64                         9/12
  Installing       : mod_lua-2.4.57-5.el9.x86_64                           10/12
  Installing       : httpd-2.4.57-5.el9.x86_64                             11/12
  Running scriptlet: httpd-2.4.57-5.el9.x86_64                             11/12
  Installing       : mod_http2-1.15.19-5.el9.x86_64                        12/12
  Running scriptlet: httpd-2.4.57-5.el9.x86_64                             12/12
  Running scriptlet: mod_http2-1.15.19-5.el9.x86_64                        12/12
  Verifying        : mailcap-2.1.49-5.el9.noarch                            1/12
  Verifying        : rocky-logos-httpd-90.15-2.el9.noarch                   2/12
  Verifying        : mod_lua-2.4.57-5.el9.x86_64                            3/12
  Verifying        : httpd-tools-2.4.57-5.el9.x86_64                        4/12
  Verifying        : httpd-2.4.57-5.el9.x86_64                              5/12
  Verifying        : httpd-filesystem-2.4.57-5.el9.noarch                   6/12
  Verifying        : apr-util-openssl-1.6.1-23.el9.x86_64                   7/12
  Verifying        : apr-util-bdb-1.6.1-23.el9.x86_64                       8/12
  Verifying        : apr-util-1.6.1-23.el9.x86_64                           9/12
  Verifying        : mod_http2-1.15.19-5.el9.x86_64                        10/12
  Verifying        : apr-1.7.0-12.el9_3.x86_64                             11/12
  Verifying        : httpd-core-2.4.57-5.el9.x86_64                        12/12

Installed:
  apr-1.7.0-12.el9_3.x86_64               apr-util-1.6.1-23.el9.x86_64
  apr-util-bdb-1.6.1-23.el9.x86_64        apr-util-openssl-1.6.1-23.el9.x86_64
  httpd-2.4.57-5.el9.x86_64               httpd-core-2.4.57-5.el9.x86_64
  httpd-filesystem-2.4.57-5.el9.noarch    httpd-tools-2.4.57-5.el9.x86_64
  mailcap-2.1.49-5.el9.noarch             mod_http2-1.15.19-5.el9.x86_64
  mod_lua-2.4.57-5.el9.x86_64             rocky-logos-httpd-90.15-2.el9.noarch

Complete!
[nico@web ~]$ ^C
[nico@web ~]$ ^C
[nico@web ~]$ sudo vim /etc/httpd/conf/httpd.conf
```

🌞 **Démarrer le service Apache**

```bash
[nico@web ~]$ sudo systemctl start httpd.service
[nico@web ~]$ sudo systemctl enable httpd.service
Created symlink /etc/systemd/system/multi-user.target.wants/httpd.service → /usr/lib/systemd/system/httpd.service.
[nico@web ~]$ sudo ss -tuln
Netid  State   Recv-Q  Send-Q   Local Address:Port   Peer Address:Port  Process
udp    UNCONN  0       0            127.0.0.1:323         0.0.0.0:*
udp    UNCONN  0       0                [::1]:323            [::]:*
tcp    LISTEN  0       128            0.0.0.0:22          0.0.0.0:*
tcp    LISTEN  0       511                  *:80                *:*
tcp    LISTEN  0       128               [::]:22             [::]:*

```
🌞 **TEST**
```bash
[nico@web ~]$ sudo systemctl status httpd.service
● httpd.service - The Apache HTTP Server
     Loaded: loaded (/usr/lib/systemd/system/httpd.service; enabled; vendor pres>
     Active: active (running) since Sun 2024-03-24 11:26:41 CET; 3min 36s ago
       Docs: man:httpd.service(8)
   Main PID: 1883 (httpd)
     Status: "Total requests: 0; Idle/Busy workers 100/0;Requests/sec: 0; Bytes >
      Tasks: 213 (limit: 5896)
     Memory: 22.6M
        CPU: 271ms
     CGroup: /system.slice/httpd.service
             ├─1883 /usr/sbin/httpd -DFOREGROUND
             ├─1884 /usr/sbin/httpd -DFOREGROUND
             ├─1885 /usr/sbin/httpd -DFOREGROUND
             ├─1886 /usr/sbin/httpd -DFOREGROUND
             └─1887 /usr/sbin/httpd -DFOREGROUND

Mar 24 11:26:40 web.tp6.linux systemd[1]: Starting The Apache HTTP Server...
Mar 24 11:26:41 web.tp6.linux systemd[1]: Started The Apache HTTP Server.
Mar 24 11:26:41 web.tp6.linux httpd[1883]: Server configured, listening on: port>
lines 1-19/19 (END)
^C
[nico@web ~]$ sudo systemctl is-enabled httpd.service
enabled
[nico@web ~]$ curl http://localhost
<!doctype html>
<html>
  <head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>HTTP Server Test Page powered by: Rocky Linux</title>
    <style type="text/css">
      /*<![CDATA[*/

      html {
        height: 100%;
        width: 100%;
      }
        body {
  background: rgb(20,72,50);
  background: -moz-linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%)  ;
  background: -webkit-linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%) ;
  background: linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%);
  background-repeat: no-repeat;
  background-attachment: fixed;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#3c6eb4",endColorstr="#3c95b4",GradientType=1);
        color: white;
        font-size: 0.9em;
        font-weight: 400;
        font-family: 'Montserrat', sans-serif;
        margin: 0;
        padding: 10em 6em 10em 6em;
        box-sizing: border-box;

      }


  h1 {
    text-align: center;
    margin: 0;
    padding: 0.6em 2em 0.4em;
    color: #fff;
    font-weight: bold;
    font-family: 'Montserrat', sans-serif;
    font-size: 2em;
  }
  h1 strong {
    font-weight: bolder;
    font-family: 'Montserrat', sans-serif;
  }
  h2 {
    font-size: 1.5em;
    font-weight:bold;
  }

  .title {
    border: 1px solid black;
    font-weight: bold;
    position: relative;
    float: right;
    width: 150px;
    text-align: center;
    padding: 10px 0 10px 0;
    margin-top: 0;
  }

  .description {
    padding: 45px 10px 5px 10px;
    clear: right;
    padding: 15px;
  }

  .section {
    padding-left: 3%;
   margin-bottom: 10px;
  }

  img {

    padding: 2px;
    margin: 2px;
  }
  a:hover img {
    padding: 2px;
    margin: 2px;
  }

  :link {
    color: rgb(199, 252, 77);
    text-shadow:
  }
  :visited {
    color: rgb(122, 206, 255);
  }
  a:hover {
    color: rgb(16, 44, 122);
  }
  .row {
    width: 100%;
    padding: 0 10px 0 10px;
  }

  footer {
    padding-top: 6em;
    margin-bottom: 6em;
    text-align: center;
    font-size: xx-small;
    overflow:hidden;
    clear: both;
  }

  .summary {
    font-size: 140%;
    text-align: center;
  }

  #rocky-poweredby img {
    margin-left: -10px;
  }

  #logos img {
    vertical-align: top;
  }

  /* Desktop  View Options */

  @media (min-width: 768px)  {

    body {
      padding: 10em 20% !important;
    }

    .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6,
    .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
      float: left;
    }

    .col-md-1 {
      width: 8.33%;
    }
    .col-md-2 {
      width: 16.66%;
    }
    .col-md-3 {
      width: 25%;
    }
    .col-md-4 {
      width: 33%;
    }
    .col-md-5 {
      width: 41.66%;
    }
    .col-md-6 {
      border-left:3px ;
      width: 50%;


    }
    .col-md-7 {
      width: 58.33%;
    }
    .col-md-8 {
      width: 66.66%;
    }
    .col-md-9 {
      width: 74.99%;
    }
    .col-md-10 {
      width: 83.33%;
    }
    .col-md-11 {
      width: 91.66%;
    }
    .col-md-12 {
      width: 100%;
    }
  }

  /* Mobile View Options */
  @media (max-width: 767px) {
    .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6,
    .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
      float: left;
    }

    .col-sm-1 {
      width: 8.33%;
    }
    .col-sm-2 {
      width: 16.66%;
    }
    .col-sm-3 {
      width: 25%;
    }
    .col-sm-4 {
      width: 33%;
    }
    .col-sm-5 {
      width: 41.66%;
    }
    .col-sm-6 {
      width: 50%;
    }
    .col-sm-7 {
      width: 58.33%;
    }
    .col-sm-8 {
      width: 66.66%;
    }
    .col-sm-9 {
      width: 74.99%;
    }
    .col-sm-10 {
      width: 83.33%;
    }
    .col-sm-11 {
      width: 91.66%;
    }
    .col-sm-12 {
      width: 100%;
    }
    h1 {
      padding: 0 !important;
    }
  }


  </style>
  </head>
  <body>
    <h1>HTTP Server <strong>Test Page</strong></h1>

    <div class='row'>

      <div class='col-sm-12 col-md-6 col-md-6 '></div>
          <p class="summary">This page is used to test the proper operation of
            an HTTP server after it has been installed on a Rocky Linux system.
            If you can read this page, it means that the software is working
            correctly.</p>
      </div>

      <div class='col-sm-12 col-md-6 col-md-6 col-md-offset-12'>


        <div class='section'>
          <h2>Just visiting?</h2>

          <p>This website you are visiting is either experiencing problems or
          could be going through maintenance.</p>

          <p>If you would like the let the administrators of this website know
          that you've seen this page instead of the page you've expected, you
          should send them an email. In general, mail sent to the name
          "webmaster" and directed to the website's domain should reach the
          appropriate person.</p>

          <p>The most common email address to send to is:
          <strong>"webmaster@example.com"</strong></p>

          <h2>Note:</h2>
          <p>The Rocky Linux distribution is a stable and reproduceable platform
          based on the sources of Red Hat Enterprise Linux (RHEL). With this in
          mind, please understand that:

        <ul>
          <li>Neither the <strong>Rocky Linux Project</strong> nor the
          <strong>Rocky Enterprise Software Foundation</strong> have anything to
          do with this website or its content.</li>
          <li>The Rocky Linux Project nor the <strong>RESF</strong> have
          "hacked" this webserver: This test page is included with the
          distribution.</li>
        </ul>
        <p>For more information about Rocky Linux, please visit the
          <a href="https://rockylinux.org/"><strong>Rocky Linux
          website</strong></a>.
        </p>
        </div>
      </div>
      <div class='col-sm-12 col-md-6 col-md-6 col-md-offset-12'>
        <div class='section'>

          <h2>I am the admin, what do I do?</h2>

        <p>You may now add content to the webroot directory for your
        software.</p>

        <p><strong>For systems using the
        <a href="https://httpd.apache.org/">Apache Webserver</strong></a>:
        You can add content to the directory <code>/var/www/html/</code>.
        Until you do so, people visiting your website will see this page. If
        you would like this page to not be shown, follow the instructions in:
        <code>/etc/httpd/conf.d/welcome.conf</code>.</p>

        <p><strong>For systems using
        <a href="https://nginx.org">Nginx</strong></a>:
        You can add your content in a location of your
        choice and edit the <code>root</code> configuration directive
        in <code>/etc/nginx/nginx.conf</code>.</p>

        <div id="logos">
          <a href="https://rockylinux.org/" id="rocky-poweredby"><img src="icons/poweredby.png" alt="[ Powered by Rocky Linux ]" /></a> <!-- Rocky -->
          <img src="poweredby.png" /> <!-- webserver -->
        </div>
      </div>
      </div>

      <footer class="col-sm-12">
      <a href="https://apache.org">Apache&trade;</a> is a registered trademark of <a href="https://apache.org">the Apache Software Foundation</a> in the United States and/or other countries.<br />
      <a href="https://nginx.org">NGINX&trade;</a> is a registered trademark of <a href="https://">F5 Networks, Inc.</a>.
      </footer>

  </body>
</html>
[nico@web ~]$ curl http://10.6.1.11
<!doctype html>
<html>
  <head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>HTTP Server Test Page powered by: Rocky Linux</title>
    <style type="text/css">
      /*<![CDATA[*/

      html {
        height: 100%;
        width: 100%;
      }
        body {
  background: rgb(20,72,50);
  background: -moz-linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%)  ;
  background: -webkit-linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%) ;
  background: linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%);
  background-repeat: no-repeat;
  background-attachment: fixed;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#3c6eb4",endColorstr="#3c95b4",GradientType=1);
        color: white;
        font-size: 0.9em;
        font-weight: 400;
        font-family: 'Montserrat', sans-serif;
        margin: 0;
        padding: 10em 6em 10em 6em;
        box-sizing: border-box;

      }


  h1 {
    text-align: center;
    margin: 0;
    padding: 0.6em 2em 0.4em;
    color: #fff;
    font-weight: bold;
    font-family: 'Montserrat', sans-serif;
    font-size: 2em;
  }
  h1 strong {
    font-weight: bolder;
    font-family: 'Montserrat', sans-serif;
  }
  h2 {
    font-size: 1.5em;
    font-weight:bold;
  }

  .title {
    border: 1px solid black;
    font-weight: bold;
    position: relative;
    float: right;
    width: 150px;
    text-align: center;
    padding: 10px 0 10px 0;
    margin-top: 0;
  }

  .description {
    padding: 45px 10px 5px 10px;
    clear: right;
    padding: 15px;
  }

  .section {
    padding-left: 3%;
   margin-bottom: 10px;
  }

  img {

    padding: 2px;
    margin: 2px;
  }
  a:hover img {
    padding: 2px;
    margin: 2px;
  }

  :link {
    color: rgb(199, 252, 77);
    text-shadow:
  }
  :visited {
    color: rgb(122, 206, 255);
  }
  a:hover {
    color: rgb(16, 44, 122);
  }
  .row {
    width: 100%;
    padding: 0 10px 0 10px;
  }

  footer {
    padding-top: 6em;
    margin-bottom: 6em;
    text-align: center;
    font-size: xx-small;
    overflow:hidden;
    clear: both;
  }

  .summary {
    font-size: 140%;
    text-align: center;
  }

  #rocky-poweredby img {
    margin-left: -10px;
  }

  #logos img {
    vertical-align: top;
  }

  /* Desktop  View Options */

  @media (min-width: 768px)  {

    body {
      padding: 10em 20% !important;
    }

    .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6,
    .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12 {
      float: left;
    }

    .col-md-1 {
      width: 8.33%;
    }
    .col-md-2 {
      width: 16.66%;
    }
    .col-md-3 {
      width: 25%;
    }
    .col-md-4 {
      width: 33%;
    }
    .col-md-5 {
      width: 41.66%;
    }
    .col-md-6 {
      border-left:3px ;
      width: 50%;


    }
    .col-md-7 {
      width: 58.33%;
    }
    .col-md-8 {
      width: 66.66%;
    }
    .col-md-9 {
      width: 74.99%;
    }
    .col-md-10 {
      width: 83.33%;
    }
    .col-md-11 {
      width: 91.66%;
    }
    .col-md-12 {
      width: 100%;
    }
  }

  /* Mobile View Options */
  @media (max-width: 767px) {
    .col-sm-1, .col-sm-2, .col-sm-3, .col-sm-4, .col-sm-5, .col-sm-6,
    .col-sm-7, .col-sm-8, .col-sm-9, .col-sm-10, .col-sm-11, .col-sm-12 {
      float: left;
    }

    .col-sm-1 {
      width: 8.33%;
    }
    .col-sm-2 {
      width: 16.66%;
    }
    .col-sm-3 {
      width: 25%;
    }
    .col-sm-4 {
      width: 33%;
    }
    .col-sm-5 {
      width: 41.66%;
    }
    .col-sm-6 {
      width: 50%;
    }
    .col-sm-7 {
      width: 58.33%;
    }
    .col-sm-8 {
      width: 66.66%;
    }
    .col-sm-9 {
      width: 74.99%;
    }
    .col-sm-10 {
      width: 83.33%;
    }
    .col-sm-11 {
      width: 91.66%;
    }
    .col-sm-12 {
      width: 100%;
    }
    h1 {
      padding: 0 !important;
    }
  }


  </style>
  </head>
  <body>
    <h1>HTTP Server <strong>Test Page</strong></h1>

    <div class='row'>

      <div class='col-sm-12 col-md-6 col-md-6 '></div>
          <p class="summary">This page is used to test the proper operation of
            an HTTP server after it has been installed on a Rocky Linux system.
            If you can read this page, it means that the software is working
            correctly.</p>
      </div>

      <div class='col-sm-12 col-md-6 col-md-6 col-md-offset-12'>


        <div class='section'>
          <h2>Just visiting?</h2>

          <p>This website you are visiting is either experiencing problems or
          could be going through maintenance.</p>

          <p>If you would like the let the administrators of this website know
          that you've seen this page instead of the page you've expected, you
          should send them an email. In general, mail sent to the name
          "webmaster" and directed to the website's domain should reach the
          appropriate person.</p>

          <p>The most common email address to send to is:
          <strong>"webmaster@example.com"</strong></p>

          <h2>Note:</h2>
          <p>The Rocky Linux distribution is a stable and reproduceable platform
          based on the sources of Red Hat Enterprise Linux (RHEL). With this in
          mind, please understand that:

        <ul>
          <li>Neither the <strong>Rocky Linux Project</strong> nor the
          <strong>Rocky Enterprise Software Foundation</strong> have anything to
          do with this website or its content.</li>
          <li>The Rocky Linux Project nor the <strong>RESF</strong> have
          "hacked" this webserver: This test page is included with the
          distribution.</li>
        </ul>
        <p>For more information about Rocky Linux, please visit the
          <a href="https://rockylinux.org/"><strong>Rocky Linux
          website</strong></a>.
        </p>
        </div>
      </div>
      <div class='col-sm-12 col-md-6 col-md-6 col-md-offset-12'>
        <div class='section'>

          <h2>I am the admin, what do I do?</h2>

        <p>You may now add content to the webroot directory for your
        software.</p>

        <p><strong>For systems using the
        <a href="https://httpd.apache.org/">Apache Webserver</strong></a>:
        You can add content to the directory <code>/var/www/html/</code>.
        Until you do so, people visiting your website will see this page. If
        you would like this page to not be shown, follow the instructions in:
        <code>/etc/httpd/conf.d/welcome.conf</code>.</p>

        <p><strong>For systems using
        <a href="https://nginx.org">Nginx</strong></a>:
        You can add your content in a location of your
        choice and edit the <code>root</code> configuration directive
        in <code>/etc/nginx/nginx.conf</code>.</p>

        <div id="logos">
          <a href="https://rockylinux.org/" id="rocky-poweredby"><img src="icons/poweredby.png" alt="[ Powered by Rocky Linux ]" /></a> <!-- Rocky -->
          <img src="poweredby.png" /> <!-- webserver -->
        </div>
      </div>
      </div>

      <footer class="col-sm-12">
      <a href="https://apache.org">Apache&trade;</a> is a registered trademark of <a href="https://apache.org">the Apache Software Foundation</a> in the United States and/or other countries.<br />
      <a href="https://nginx.org">NGINX&trade;</a> is a registered trademark of <a href="https://">F5 Networks, Inc.</a>.
      </footer>

  </body>
</html>
```
## 2. Avancer vers la maîtrise du service

🌞 **Le service Apache...**
```bash
[nico@web ~]$ cat /usr/lib/systemd/system/httpd.service
# See httpd.service(8) for more information on using the httpd service.

# Modifying this file in-place is not recommended, because changes
# will be overwritten during package upgrades.  To customize the
# behaviour, run "systemctl edit httpd" to create an override unit.

# For example, to pass additional options (such as -D definitions) to
# the httpd binary at startup, create an override unit (as is done by
# systemctl edit) and enter the following:

#       [Service]
#       Environment=OPTIONS=-DMY_DEFINE

[Unit]
Description=The Apache HTTP Server
Wants=httpd-init.service
After=network.target remote-fs.target nss-lookup.target httpd-init.service
Documentation=man:httpd.service(8)

[Service]
Type=notify
Environment=LANG=C

ExecStart=/usr/sbin/httpd $OPTIONS -DFOREGROUND
ExecReload=/usr/sbin/httpd $OPTIONS -k graceful
# Send SIGWINCH for graceful stop
KillSignal=SIGWINCH
KillMode=mixed
PrivateTmp=true
OOMPolicy=continue

[Install]
WantedBy=multi-user.target
```

🌞 **Déterminer sous quel utilisateur tourne le processus Apache**

```bash 
[nico@web ~]$ cat /etc/httpd/conf/httpd.conf | grep User
User apache
    LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\"" combined
      LogFormat "%h %l %u %t \"%r\" %>s %b \"%{Referer}i\" \"%{User-Agent}i\" %I %O" combinedio
[nico@web ~]$ ps -ef | grep httpd
root        1883       1  0 11:26 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache      1884    1883  0 11:26 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache      1885    1883  0 11:26 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache      1886    1883  0 11:26 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
apache      1887    1883  0 11:26 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
nico        2166    1232  0 11:41 pts/0    00:00:00 grep --color=auto httpd
[nico@web ~]$ ls -al /usr/share/testpage/
total 12
drwxr-xr-x.  2 root root   24 Mar 24 11:11 .
drwxr-xr-x. 83 root root 4096 Mar 24 11:11 ..
-rw-r--r--.  1 root root 7620 Feb 21 14:12 index.html

```

🌞 **Changer l'utilisateur utilisé par Apache**

```bash
[nico@web ~]$ grep apache /etc/passwd
apache:x:48:48:Apache:/usr/share/httpd:/sbin/nologin
[nico@web ~]$ sudo useradd -r -d /usr/share/httpd/ -s /sbin/nologin nicoUser
[sudo] password for nico:
[nico@web ~]$ sudo nano /etc/httpd/conf/httpd.conf
[nico@web ~]$ cat /etc/httpd/conf/httpd.conf | grep User
User nicoUser
[nico@web ~]$ sudo systemctl restart httpd.service
[nico@web ~]$ ps -ef | grep httpd
root        2194       1  0 11:49 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
nicoUser    2195    2194  0 11:49 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
nicoUser    2196    2194  0 11:49 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
nicoUser    2197    2194  0 11:49 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
nicoUser    2198    2194  0 11:49 ?        00:00:00 /usr/sbin/httpd -DFOREGROUND
nico        2412    1232  0 11:49 pts/0    00:00:00 grep --color=auto httpd
[nico@web ~]$
```

🌞 **Faites en sorte que Apache tourne sur un autre port**

```bash 
[nico@web ~]$ sudo nano /etc/httpd/conf/httpd.conf
[nico@web ~]$ cat /etc/httpd/conf/httpd.conf | grep Listen
Listen 8080
[nico@web ~]$ sudo firewall-cmd --zone=public --add-port=8080/tcp --permanent
success
[nico@web ~]$ sudo firewall-cmd --remove-port=80/tcp --permanent
Warning: NOT_ENABLED: 80:tcp
success
[nico@web ~]$ sudo firewall-cmd --reload
success
[nico@web ~]$ sudo systemctl restart httpd
[nico@web ~]$ ss -tuln | grep 8080
tcp   LISTEN 0      511                *:8080            *:*
[nico@web ~]$ curl http://localhost:8080
<!doctype html>
<html>
  <head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>HTTP Server Test Page powered by: Rocky Linux</title>
    <style type="text/css">
      /*<![CDATA[*/

      html {
        height: 100%;
        width: 100%;
      }
        body {
  background: rgb(20,72,50);
  background: -moz-linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%)  ;
  background: -webkit-linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%) ;
  background: linear-gradient(180deg, rgba(23,43,70,1) 30%, rgba(0,0,0,1) 90%);
  background-repeat: no-repeat;
  background-attachment: fixed;
  filter: progid:DXImageTransform.Microsoft.gradient(startColorstr="#3c6eb4",endColorstr="#3c95b4",GradientType=1);
        color: white;
        font-size: 0.9em;
        font-weight: 400;
        font-family: 'Montserrat', sans-serif;
        margin: 0;
        padding: 10em 6em 10em 6em;
        box-sizing: border-box;

      }


  h1 {
    text-align: center;
    margin: 0;
    padding: 0.6em 2em 0.4em;
    color: #fff;
    font-weight: bold;
    font-family: 'Montserrat', sans-serif;
    font-size: 2em;
  }
  h1 strong {
    font-weight: bolder;
    font-family: 'Montserrat', sans-serif;
  }
  h2 {
    font-size: 1.5em;
    font-weight:bold;
  }

  .title {
    border: 1px solid black;
    font-weight: bold;
    position: relative;
    float: right;
    width: 150px;
    text-align: center;
    padding: 10px 0 10px 0;
    margin-top: 0;
  }

  .description {
    padding: 45px 10px 5px 10px;
    clear: right;
    padding: 15px;
  }

  .section {
    padding-left: 3%;
   margin-bottom: 10px;
  }

  img {

    padding: 2px;
    margin: 2px;
  }
  a:hover img {
    padding: 2px;
    margin: 2px;
  }

  :link {
    color: rgb(199, 252, 77);
    text-shadow:
  }
  :visited {
    color: rgb(122, 206, 255);
  }
  a:hover {
    color: rgb(16, 44, 122);
  }
  .row {
    width: 100%;
    padding: 0 10px 0 10px;
  }

  footer {
    padding-top: 6em;
    margin-bottom: 6em;
    text-align: center;
    font-size: xx-small;
    overflow:hidden;
    clear: both;
  }

  .summary {
    font-size: 140%;
    text-align: center;
  }

  #rocky-poweredby img {
    margin-left: -10px;
  }

  #logos img {
    vertical-align: top;
  }
```

# Partie 2 : Mise en place et maîtrise du serveur de base de données


🌞 **Install de MariaDB sur `db.tp6.linux`**

```bash
[nico@db ~]$ sudo dnf update
Rocky Linux 9 - BaseOS                            10 kB/s | 4.1 kB     00:00
Rocky Linux 9 - BaseOS                           998 kB/s | 2.2 MB     00:02
Rocky Linux 9 - AppStream                         15 kB/s | 4.5 kB     00:00
Rocky Linux 9 - AppStream                        1.7 MB/s | 7.4 MB     00:04
Rocky Linux 9 - Extras                            11 kB/s | 2.9 kB     00:00
Rocky Linux 9 - Extras                            39 kB/s |  14 kB     00:00
Dependencies resolved.
=================================================================================
 Package                    Arch   Version                       Repo       Size
=================================================================================
[...]
Installed:
  binutils-2.35.2-42.el9_3.1.x86_64
  binutils-gold-2.35.2-42.el9_3.1.x86_64
  elfutils-debuginfod-client-0.189-3.el9.x86_64
  freetype-2.10.4-9.el9.x86_64
  graphite2-1.3.14-9.el9.x86_64
  grub2-tools-efi-1:2.06-70.el9_3.2.rocky.0.4.x86_64
  grub2-tools-extra-1:2.06-70.el9_3.2.rocky.0.4.x86_64
  harfbuzz-2.7.4-8.el9.x86_64
  kbd-legacy-2.4.0-9.el9.noarch
  kernel-5.14.0-362.24.1.el9_3.x86_64
  kernel-core-5.14.0-362.24.1.el9_3.x86_64
  kernel-modules-5.14.0-362.24.1.el9_3.x86_64
  kernel-modules-core-5.14.0-362.24.1.el9_3.x86_64
  libevent-2.1.12-6.el9.x86_64
  libpng-2:1.6.37-12.el9.x86_64
  python3-gobject-base-noarch-3.40.1-6.el9.noarch
  python3-systemd-234-18.el9.x86_64

Complete!
[nico@db ~]$ sudo dnf install mariadb-server
[sudo] password for nico:
Last metadata expiration check: 0:11:22 ago on Sun 24 Mar 2024 12:11:14 PM CET.
Dependencies resolved.
=================================================================================
 Package                        Arch     Version               Repository   Size
=================================================================================
Installing:
 mariadb-server                 x86_64   3:10.5.22-1.el9_2     appstream   9.6 M
Installing dependencies:
 checkpolicy                    x86_64   3.5-1.el9             appstream   345 k
 mariadb                        x86_64   3:10.5.22-1.el9_2     appstream   1.6 M
 mariadb-common                 x86_64   3:10.5.22-1.el9_2     appstream    27 k
 mariadb-connector-c            x86_64   3.2.6-1.el9_0         appstream   195 k
 mariadb-connector-c-config     noarch   3.2.6-1.el9_0         appstream   9.8 k
 mariadb-errmsg                 x86_64   3:10.5.22-1.el9_2     appstream   211 k
 mysql-selinux                  noarch   1.0.5-1.el9_0         appstream    35 k
 perl-AutoLoader                noarch   5.74-480.el9          appstream    21 k
 perl-B                         x86_64   1.80-480.el9          appstream   179 k
 perl-Carp                      noarch   1.50-460.el9          appstream    29 k
 perl-Class-Struct              noarch   0.66-480.el9          appstream    22 k
 perl-DBD-MariaDB               x86_64   1.21-16.el9_0         appstream   151 k
 perl-DBI                       x86_64   1.643-9.el9           appstream   700 k
 perl-Data-Dumper               x86_64   2.174-462.el9         appstream    55 k
 perl-Digest                    noarch   1.19-4.el9            appstream    25 k
 perl-Digest-MD5                x86_64   2.58-4.el9            appstream    36 k
 perl-DynaLoader                x86_64   1.47-480.el9          appstream    26 k
 perl-Encode                    x86_64   4:3.08-462.el9        appstream   1.7 M
 perl-Errno                     x86_64   1.30-480.el9          appstream    15 k
 perl-Exporter                  noarch   5.74-461.el9          appstream    31 k
 perl-Fcntl                     x86_64   1.13-480.el9          appstream    20 k
 perl-File-Basename             noarch   2.85-480.el9          appstream    17 k
 perl-File-Copy                 noarch   2.34-480.el9          appstream    20 k
 perl-File-Path                 noarch   2.18-4.el9            appstream    35 k
 perl-File-Temp                 noarch   1:0.231.100-4.el9     appstream    59 k
 perl-File-stat                 noarch   1.09-480.el9          appstream    17 k
 perl-FileHandle                noarch   2.03-480.el9          appstream    16 k
 perl-Getopt-Long               noarch   1:2.52-4.el9          appstream    60 k
 perl-Getopt-Std                noarch   1.12-480.el9          appstream    16 k
 perl-HTTP-Tiny                 noarch   0.076-461.el9         appstream    53 k
 perl-IO                        x86_64   1.43-480.el9          appstream    87 k
 perl-IO-Socket-IP              noarch   0.41-5.el9            appstream    42 k
 perl-IO-Socket-SSL             noarch   2.073-1.el9           appstream   217 k
 perl-IPC-Open3                 noarch   1.21-480.el9          appstream    23 k
 perl-MIME-Base64               x86_64   3.16-4.el9            appstream    30 k
 perl-Math-BigInt               noarch   1:1.9998.18-460.el9   appstream   188 k
 perl-Math-Complex              noarch   1.59-480.el9          appstream    47 k
 perl-Mozilla-CA                noarch   20200520-6.el9        appstream    12 k
 perl-Net-SSLeay                x86_64   1.92-2.el9            appstream   365 k
 perl-POSIX                     x86_64   1.94-480.el9          appstream    96 k
 perl-PathTools                 x86_64   3.78-461.el9          appstream    85 k
 perl-Pod-Escapes               noarch   1:1.07-460.el9        appstream    20 k
 perl-Pod-Perldoc               noarch   3.28.01-461.el9       appstream    83 k
 perl-Pod-Simple                noarch   1:3.42-4.el9          appstream   215 k
 perl-Pod-Usage                 noarch   4:2.01-4.el9          appstream    40 k
 perl-Scalar-List-Utils         x86_64   4:1.56-461.el9        appstream    71 k
 perl-SelectSaver               noarch   1.02-480.el9          appstream    12 k
 perl-Socket                    x86_64   4:2.031-4.el9         appstream    54 k
 perl-Storable                  x86_64   1:3.21-460.el9        appstream    95 k
 perl-Symbol                    noarch   1.08-480.el9          appstream    14 k
 perl-Sys-Hostname              x86_64   1.23-480.el9          appstream    17 k
 perl-Term-ANSIColor            noarch   5.01-461.el9          appstream    48 k
 perl-Term-Cap                  noarch   1.17-460.el9          appstream    22 k
 perl-Text-ParseWords           noarch   3.30-460.el9          appstream    16 k
 perl-Text-Tabs+Wrap            noarch   2013.0523-460.el9     appstream    23 k
 perl-Time-Local                noarch   2:1.300-7.el9         appstream    33 k
 perl-URI                       noarch   5.09-3.el9            appstream   108 k
 perl-base                      noarch   2.27-480.el9          appstream    16 k
 perl-constant                  noarch   1.33-461.el9          appstream    23 k
 perl-if                        noarch   0.60.800-480.el9      appstream    14 k
 perl-interpreter               x86_64   4:5.32.1-480.el9      appstream    71 k
 perl-libnet                    noarch   3.13-4.el9            appstream   125 k
 perl-libs                      x86_64   4:5.32.1-480.el9      appstream   2.0 M
 perl-mro                       x86_64   1.23-480.el9          appstream    28 k
 perl-overload                  noarch   1.31-480.el9          appstream    46 k
 perl-overloading               noarch   0.02-480.el9          appstream    13 k
 perl-parent                    noarch   1:0.238-460.el9       appstream    14 k
 perl-podlators                 noarch   1:4.14-460.el9        appstream   112 k
 perl-subs                      noarch   1.03-480.el9          appstream    12 k
 perl-vars                      noarch   1.05-480.el9          appstream    13 k
 policycoreutils-python-utils   noarch   3.5-3.el9_3           appstream    71 k
 python3-audit                  x86_64   3.0.7-104.el9         appstream    82 k
 python3-distro                 noarch   1.5.0-7.el9           appstream    36 k
 python3-libsemanage            x86_64   3.5-2.el9             appstream    79 k
 python3-policycoreutils        noarch   3.5-3.el9_3           appstream   2.0 M
 python3-setools                x86_64   4.4.3-1.el9           baseos      551 k
 python3-setuptools             noarch   53.0.0-12.el9         baseos      839 k
Installing weak dependencies:
 mariadb-backup                 x86_64   3:10.5.22-1.el9_2     appstream   6.4 M
 mariadb-gssapi-server          x86_64   3:10.5.22-1.el9_2     appstream    15 k
 mariadb-server-utils           x86_64   3:10.5.22-1.el9_2     appstream   210 k
 perl-NDBM_File                 x86_64   1.15-480.el9          appstream    22 k

Transaction Summary
=================================================================================
Install  82 Packages

Total download size: 30 M
Installed size: 151 M
Is this ok [y/N]: y
Downloading Packages:
(1/82): perl-Text-ParseWords-3.30-460.el9.noarch 255 kB/s |  16 kB     00:00
(2/82): perl-Exporter-5.74-461.el9.noarch.rpm    739 kB/s |  31 kB     00:00
(3/82): perl-Pod-Simple-3.42-4.el9.noarch.rpm    792 kB/s | 215 kB     00:00
(4/82): python3-setools-4.4.3-1.el9.x86_64.rpm   872 kB/s | 551 kB     00:00
(5/82): perl-Math-BigInt-1.9998.18-460.el9.noarc 636 kB/s | 188 kB     00:00
(6/82): python3-setuptools-53.0.0-12.el9.noarch. 1.0 MB/s | 839 kB     00:00
(7/82): perl-Pod-Perldoc-3.28.01-461.el9.noarch. 655 kB/s |  83 kB     00:00
(8/82): perl-File-Path-2.18-4.el9.noarch.rpm     182 kB/s |  35 kB     00:00
(9/82): perl-Getopt-Long-2.52-4.el9.noarch.rpm   1.0 MB/s |  60 kB     00:00
(10/82): perl-Pod-Usage-2.01-4.el9.noarch.rpm    938 kB/s |  40 kB     00:00
(11/82): python3-distro-1.5.0-7.el9.noarch.rpm   810 kB/s |  36 kB     00:00
(12/82): perl-Time-Local-1.300-7.el9.noarch.rpm  573 kB/s |  33 kB     00:00
(13/82): perl-IO-Socket-IP-0.41-5.el9.noarch.rpm 409 kB/s |  42 kB     00:00
(14/82): perl-libnet-3.13-4.el9.noarch.rpm       1.1 MB/s | 125 kB     00:00
(15/82): mysql-selinux-1.0.5-1.el9_0.noarch.rpm  492 kB/s |  35 kB     00:00
(16/82): python3-audit-3.0.7-104.el9.x86_64.rpm  534 kB/s |  82 kB     00:00
(17/82): checkpolicy-3.5-1.el9.x86_64.rpm        1.4 MB/s | 345 kB     00:00
(18/82): mariadb-connector-c-config-3.2.6-1.el9_ 120 kB/s | 9.8 kB     00:00
(19/82): mariadb-connector-c-3.2.6-1.el9_0.x86_6 1.6 MB/s | 195 kB     00:00
(20/82): perl-Carp-1.50-460.el9.noarch.rpm       886 kB/s |  29 kB     00:00
(21/82): perl-podlators-4.14-460.el9.noarch.rpm  1.2 MB/s | 112 kB     00:00
(22/82): perl-Term-Cap-1.17-460.el9.noarch.rpm   265 kB/s |  22 kB     00:00
(23/82): perl-Term-ANSIColor-5.01-461.el9.noarch 585 kB/s |  48 kB     00:00
(24/82): perl-Digest-1.19-4.el9.noarch.rpm       692 kB/s |  25 kB     00:00
(25/82): perl-HTTP-Tiny-0.076-461.el9.noarch.rpm 1.0 MB/s |  53 kB     00:00
(26/82): perl-URI-5.09-3.el9.noarch.rpm          1.5 MB/s | 108 kB     00:00
(27/82): perl-constant-1.33-461.el9.noarch.rpm   435 kB/s |  23 kB     00:00
(28/82): policycoreutils-python-utils-3.5-3.el9_ 496 kB/s |  71 kB     00:00
(29/82): perl-Data-Dumper-2.174-462.el9.x86_64.r 577 kB/s |  55 kB     00:00
(30/82): perl-Scalar-List-Utils-1.56-461.el9.x86 642 kB/s |  71 kB     00:00
(31/82): perl-IO-Socket-SSL-2.073-1.el9.noarch.r 534 kB/s | 217 kB     00:00
(32/82): perl-Storable-3.21-460.el9.x86_64.rpm   625 kB/s |  95 kB     00:00
(33/82): perl-PathTools-3.78-461.el9.x86_64.rpm  429 kB/s |  85 kB     00:00
(34/82): perl-Mozilla-CA-20200520-6.el9.noarch.r 101 kB/s |  12 kB     00:00
(35/82): perl-Text-Tabs+Wrap-2013.0523-460.el9.n 157 kB/s |  23 kB     00:00
(36/82): perl-Encode-3.08-462.el9.x86_64.rpm     1.0 MB/s | 1.7 MB     00:01
(37/82): python3-policycoreutils-3.5-3.el9_3.noa 1.2 MB/s | 2.0 MB     00:01
(38/82): perl-Digest-MD5-2.58-4.el9.x86_64.rpm   312 kB/s |  36 kB     00:00
(39/82): perl-Pod-Escapes-1.07-460.el9.noarch.rp 224 kB/s |  20 kB     00:00
(40/82): perl-MIME-Base64-3.16-4.el9.x86_64.rpm  201 kB/s |  30 kB     00:00
(41/82): perl-File-Temp-0.231.100-4.el9.noarch.r 527 kB/s |  59 kB     00:00
(42/82): python3-libsemanage-3.5-2.el9.x86_64.rp 611 kB/s |  79 kB     00:00
(43/82): perl-DBI-1.643-9.el9.x86_64.rpm         988 kB/s | 700 kB     00:00
(44/82): perl-Socket-2.031-4.el9.x86_64.rpm      328 kB/s |  54 kB     00:00
(45/82): perl-mro-1.23-480.el9.x86_64.rpm        347 kB/s |  28 kB     00:00
(46/82): perl-interpreter-5.32.1-480.el9.x86_64. 859 kB/s |  71 kB     00:00
(47/82): perl-Sys-Hostname-1.23-480.el9.x86_64.r 185 kB/s |  17 kB     00:00
(48/82): perl-POSIX-1.94-480.el9.x86_64.rpm      489 kB/s |  96 kB     00:00
(49/82): perl-NDBM_File-1.15-480.el9.x86_64.rpm  121 kB/s |  22 kB     00:00
(50/82): perl-Fcntl-1.13-480.el9.x86_64.rpm      259 kB/s |  20 kB     00:00
(51/82): perl-IO-1.43-480.el9.x86_64.rpm         696 kB/s |  87 kB     00:00
(52/82): perl-Errno-1.30-480.el9.x86_64.rpm      171 kB/s |  15 kB     00:00
(53/82): perl-DynaLoader-1.47-480.el9.x86_64.rpm 219 kB/s |  26 kB     00:00
(54/82): perl-B-1.80-480.el9.x86_64.rpm          1.1 MB/s | 179 kB     00:00
(55/82): perl-vars-1.05-480.el9.noarch.rpm        77 kB/s |  13 kB     00:00
(56/82): perl-subs-1.03-480.el9.noarch.rpm       100 kB/s |  12 kB     00:00
(57/82): perl-overloading-0.02-480.el9.noarch.rp  83 kB/s |  13 kB     00:00
(58/82): perl-overload-1.31-480.el9.noarch.rpm   326 kB/s |  46 kB     00:00
(59/82): perl-if-0.60.800-480.el9.noarch.rpm     126 kB/s |  14 kB     00:00
(60/82): perl-base-2.27-480.el9.noarch.rpm       164 kB/s |  16 kB     00:00
(61/82): perl-Symbol-1.08-480.el9.noarch.rpm     114 kB/s |  14 kB     00:00
(62/82): perl-SelectSaver-1.02-480.el9.noarch.rp  85 kB/s |  12 kB     00:00
(63/82): perl-Math-Complex-1.59-480.el9.noarch.r 370 kB/s |  47 kB     00:00
(64/82): perl-libs-5.32.1-480.el9.x86_64.rpm     1.6 MB/s | 2.0 MB     00:01
(65/82): perl-IPC-Open3-1.21-480.el9.noarch.rpm  182 kB/s |  23 kB     00:00
(66/82): perl-Getopt-Std-1.12-480.el9.noarch.rpm 304 kB/s |  16 kB     00:00
(67/82): perl-File-stat-1.09-480.el9.noarch.rpm  547 kB/s |  17 kB     00:00
(68/82): perl-FileHandle-2.03-480.el9.noarch.rpm 355 kB/s |  16 kB     00:00
(69/82): perl-File-Copy-2.34-480.el9.noarch.rpm  456 kB/s |  20 kB     00:00
(70/82): perl-File-Basename-2.85-480.el9.noarch. 499 kB/s |  17 kB     00:00
(71/82): perl-Class-Struct-0.66-480.el9.noarch.r 599 kB/s |  22 kB     00:00
(72/82): perl-AutoLoader-5.74-480.el9.noarch.rpm 564 kB/s |  21 kB     00:00
(73/82): perl-Net-SSLeay-1.92-2.el9.x86_64.rpm   1.2 MB/s | 365 kB     00:00
(74/82): mariadb-server-utils-10.5.22-1.el9_2.x8 632 kB/s | 210 kB     00:00
(75/82): mariadb-gssapi-server-10.5.22-1.el9_2.x 108 kB/s |  15 kB     00:00
(76/82): mariadb-common-10.5.22-1.el9_2.x86_64.r 161 kB/s |  27 kB     00:00
(77/82): mariadb-errmsg-10.5.22-1.el9_2.x86_64.r 636 kB/s | 211 kB     00:00
(78/82): mariadb-10.5.22-1.el9_2.x86_64.rpm      624 kB/s | 1.6 MB     00:02
(79/82): perl-DBD-MariaDB-1.21-16.el9_0.x86_64.r 358 kB/s | 151 kB     00:00
(80/82): perl-parent-0.238-460.el9.noarch.rpm     27 kB/s |  14 kB     00:00
(81/82): mariadb-backup-10.5.22-1.el9_2.x86_64.r 954 kB/s | 6.4 MB     00:06
(82/82): mariadb-server-10.5.22-1.el9_2.x86_64.r 1.2 MB/s | 9.6 MB     00:07
---------------------------------------------------------------------------------
Total                                            2.3 MB/s |  30 MB     00:13
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                         1/1
  Installing       : mariadb-connector-c-config-3.2.6-1.el9_0.noarch        1/82
  Installing       : mariadb-common-3:10.5.22-1.el9_2.x86_64                2/82
  Installing       : mariadb-connector-c-3.2.6-1.el9_0.x86_64               3/82
  Installing       : perl-Digest-1.19-4.el9.noarch                          4/82
  Installing       : perl-Digest-MD5-2.58-4.el9.x86_64                      5/82
  Installing       : perl-B-1.80-480.el9.x86_64                             6/82
  Installing       : perl-FileHandle-2.03-480.el9.noarch                    7/82
  Installing       : perl-Data-Dumper-2.174-462.el9.x86_64                  8/82
  Installing       : perl-libnet-3.13-4.el9.noarch                          9/82
  Installing       : perl-base-2.27-480.el9.noarch                         10/82
  Installing       : perl-AutoLoader-5.74-480.el9.noarch                   11/82
  Installing       : perl-URI-5.09-3.el9.noarch                            12/82
  Installing       : perl-Mozilla-CA-20200520-6.el9.noarch                 13/82
  Installing       : perl-Text-Tabs+Wrap-2013.0523-460.el9.noarch          14/82
  Installing       : perl-Pod-Escapes-1:1.07-460.el9.noarch                15/82
  Installing       : perl-if-0.60.800-480.el9.noarch                       16/82
  Installing       : perl-File-Path-2.18-4.el9.noarch                      17/82
  Installing       : perl-IO-Socket-IP-0.41-5.el9.noarch                   18/82
  Installing       : perl-Net-SSLeay-1.92-2.el9.x86_64                     19/82
  Installing       : perl-Time-Local-2:1.300-7.el9.noarch                  20/82
  Installing       : perl-IO-Socket-SSL-2.073-1.el9.noarch                 21/82
  Installing       : perl-Term-ANSIColor-5.01-461.el9.noarch               22/82
  Installing       : perl-POSIX-1.94-480.el9.x86_64                        23/82
  Installing       : perl-Term-Cap-1.17-460.el9.noarch                     24/82
  Installing       : perl-subs-1.03-480.el9.noarch                         25/82
  Installing       : perl-Pod-Simple-1:3.42-4.el9.noarch                   26/82
  Installing       : perl-IPC-Open3-1.21-480.el9.noarch                    27/82
  Installing       : perl-Class-Struct-0.66-480.el9.noarch                 28/82
  Installing       : perl-HTTP-Tiny-0.076-461.el9.noarch                   29/82
  Installing       : perl-File-Temp-1:0.231.100-4.el9.noarch               30/82
  Installing       : perl-Socket-4:2.031-4.el9.x86_64                      31/82
  Installing       : perl-Symbol-1.08-480.el9.noarch                       32/82
  Installing       : perl-SelectSaver-1.02-480.el9.noarch                  33/82
  Installing       : perl-File-stat-1.09-480.el9.noarch                    34/82
  Installing       : perl-podlators-1:4.14-460.el9.noarch                  35/82
  Installing       : perl-Pod-Perldoc-3.28.01-461.el9.noarch               36/82
  Installing       : perl-mro-1.23-480.el9.x86_64                          37/82
  Installing       : perl-Fcntl-1.13-480.el9.x86_64                        38/82
  Installing       : perl-overloading-0.02-480.el9.noarch                  39/82
  Installing       : perl-IO-1.43-480.el9.x86_64                           40/82
  Installing       : perl-Pod-Usage-4:2.01-4.el9.noarch                    41/82
  Installing       : perl-Text-ParseWords-3.30-460.el9.noarch              42/82
  Installing       : perl-constant-1.33-461.el9.noarch                     43/82
  Installing       : perl-Scalar-List-Utils-4:1.56-461.el9.x86_64          44/82
  Installing       : perl-MIME-Base64-3.16-4.el9.x86_64                    45/82
  Installing       : perl-Errno-1.30-480.el9.x86_64                        46/82
  Installing       : perl-vars-1.05-480.el9.noarch                         47/82
  Installing       : perl-overload-1.31-480.el9.noarch                     48/82
  Installing       : perl-Getopt-Std-1.12-480.el9.noarch                   49/82
  Installing       : perl-File-Basename-2.85-480.el9.noarch                50/82
  Installing       : perl-Storable-1:3.21-460.el9.x86_64                   51/82
  Installing       : perl-parent-1:0.238-460.el9.noarch                    52/82
  Installing       : perl-Getopt-Long-1:2.52-4.el9.noarch                  53/82
  Installing       : perl-Exporter-5.74-461.el9.noarch                     54/82
  Installing       : perl-Carp-1.50-460.el9.noarch                         55/82
  Installing       : perl-NDBM_File-1.15-480.el9.x86_64                    56/82
  Installing       : perl-PathTools-3.78-461.el9.x86_64                    57/82
  Installing       : perl-Encode-4:3.08-462.el9.x86_64                     58/82
  Installing       : perl-libs-4:5.32.1-480.el9.x86_64                     59/82
  Installing       : perl-interpreter-4:5.32.1-480.el9.x86_64              60/82
  Installing       : perl-Sys-Hostname-1.23-480.el9.x86_64                 61/82
  Installing       : perl-DynaLoader-1.47-480.el9.x86_64                   62/82
  Installing       : python3-setuptools-53.0.0-12.el9.noarch               63/82
  Installing       : python3-setools-4.4.3-1.el9.x86_64                    64/82
  Installing       : python3-distro-1.5.0-7.el9.noarch                     65/82
  Installing       : perl-Math-Complex-1.59-480.el9.noarch                 66/82
  Installing       : perl-Math-BigInt-1:1.9998.18-460.el9.noarch           67/82
  Installing       : perl-DBI-1.643-9.el9.x86_64                           68/82
  Installing       : perl-DBD-MariaDB-1.21-16.el9_0.x86_64                 69/82
  Installing       : perl-File-Copy-2.34-480.el9.noarch                    70/82
  Installing       : mariadb-errmsg-3:10.5.22-1.el9_2.x86_64               71/82
  Installing       : python3-libsemanage-3.5-2.el9.x86_64                  72/82
  Installing       : python3-audit-3.0.7-104.el9.x86_64                    73/82
  Installing       : checkpolicy-3.5-1.el9.x86_64                          74/82
  Installing       : python3-policycoreutils-3.5-3.el9_3.noarch            75/82
  Installing       : policycoreutils-python-utils-3.5-3.el9_3.noarch       76/82
  Running scriptlet: mysql-selinux-1.0.5-1.el9_0.noarch                    77/82
  Installing       : mysql-selinux-1.0.5-1.el9_0.noarch                    77/82
  Running scriptlet: mysql-selinux-1.0.5-1.el9_0.noarch                    77/82
libsemanage.semanage_direct_install_info: Overriding mysql module at lower priority 100 with module at priority 200.

  Installing       : mariadb-server-utils-3:10.5.22-1.el9_2.x86_64         78/82
  Installing       : mariadb-gssapi-server-3:10.5.22-1.el9_2.x86_64        79/82
  Installing       : mariadb-backup-3:10.5.22-1.el9_2.x86_64               80/82
  Installing       : mariadb-3:10.5.22-1.el9_2.x86_64                      81/82
  Running scriptlet: mariadb-server-3:10.5.22-1.el9_2.x86_64               82/82
  Installing       : mariadb-server-3:10.5.22-1.el9_2.x86_64               82/82
  Running scriptlet: mariadb-server-3:10.5.22-1.el9_2.x86_64               82/82
  Running scriptlet: mysql-selinux-1.0.5-1.el9_0.noarch                    82/82
  Running scriptlet: mariadb-server-3:10.5.22-1.el9_2.x86_64               82/82
  Verifying        : python3-setuptools-53.0.0-12.el9.noarch                1/82
  Verifying        : python3-setools-4.4.3-1.el9.x86_64                     2/82
  Verifying        : perl-Text-ParseWords-3.30-460.el9.noarch               3/82
  Verifying        : perl-Exporter-5.74-461.el9.noarch                      4/82
  Verifying        : perl-Pod-Simple-1:3.42-4.el9.noarch                    5/82
  Verifying        : perl-Math-BigInt-1:1.9998.18-460.el9.noarch            6/82
  Verifying        : perl-File-Path-2.18-4.el9.noarch                       7/82
  Verifying        : perl-Pod-Perldoc-3.28.01-461.el9.noarch                8/82
  Verifying        : perl-Getopt-Long-1:2.52-4.el9.noarch                   9/82
  Verifying        : perl-Pod-Usage-4:2.01-4.el9.noarch                    10/82
  Verifying        : perl-IO-Socket-IP-0.41-5.el9.noarch                   11/82
  Verifying        : python3-distro-1.5.0-7.el9.noarch                     12/82
  Verifying        : perl-Time-Local-2:1.300-7.el9.noarch                  13/82
  Verifying        : perl-libnet-3.13-4.el9.noarch                         14/82
  Verifying        : checkpolicy-3.5-1.el9.x86_64                          15/82
  Verifying        : python3-audit-3.0.7-104.el9.x86_64                    16/82
  Verifying        : mysql-selinux-1.0.5-1.el9_0.noarch                    17/82
  Verifying        : mariadb-connector-c-3.2.6-1.el9_0.x86_64              18/82
  Verifying        : mariadb-connector-c-config-3.2.6-1.el9_0.noarch       19/82
  Verifying        : perl-Carp-1.50-460.el9.noarch                         20/82
  Verifying        : perl-podlators-1:4.14-460.el9.noarch                  21/82
  Verifying        : perl-Term-Cap-1.17-460.el9.noarch                     22/82
  Verifying        : perl-Term-ANSIColor-5.01-461.el9.noarch               23/82
  Verifying        : perl-HTTP-Tiny-0.076-461.el9.noarch                   24/82
  Verifying        : perl-Digest-1.19-4.el9.noarch                         25/82
  Verifying        : perl-URI-5.09-3.el9.noarch                            26/82
  Verifying        : perl-constant-1.33-461.el9.noarch                     27/82
  Verifying        : perl-Encode-4:3.08-462.el9.x86_64                     28/82
  Verifying        : python3-policycoreutils-3.5-3.el9_3.noarch            29/82
  Verifying        : policycoreutils-python-utils-3.5-3.el9_3.noarch       30/82
  Verifying        : perl-Data-Dumper-2.174-462.el9.x86_64                 31/82
  Verifying        : perl-Scalar-List-Utils-4:1.56-461.el9.x86_64          32/82
  Verifying        : perl-IO-Socket-SSL-2.073-1.el9.noarch                 33/82
  Verifying        : perl-Storable-1:3.21-460.el9.x86_64                   34/82
  Verifying        : perl-PathTools-3.78-461.el9.x86_64                    35/82
  Verifying        : perl-Mozilla-CA-20200520-6.el9.noarch                 36/82
  Verifying        : perl-Text-Tabs+Wrap-2013.0523-460.el9.noarch          37/82
  Verifying        : perl-DBI-1.643-9.el9.x86_64                           38/82
  Verifying        : perl-Digest-MD5-2.58-4.el9.x86_64                     39/82
  Verifying        : perl-Pod-Escapes-1:1.07-460.el9.noarch                40/82
  Verifying        : perl-MIME-Base64-3.16-4.el9.x86_64                    41/82
  Verifying        : perl-File-Temp-1:0.231.100-4.el9.noarch               42/82
  Verifying        : python3-libsemanage-3.5-2.el9.x86_64                  43/82
  Verifying        : perl-Socket-4:2.031-4.el9.x86_64                      44/82
  Verifying        : perl-mro-1.23-480.el9.x86_64                          45/82
  Verifying        : perl-libs-4:5.32.1-480.el9.x86_64                     46/82
  Verifying        : perl-interpreter-4:5.32.1-480.el9.x86_64              47/82
  Verifying        : perl-Sys-Hostname-1.23-480.el9.x86_64                 48/82
  Verifying        : perl-POSIX-1.94-480.el9.x86_64                        49/82
  Verifying        : perl-NDBM_File-1.15-480.el9.x86_64                    50/82
  Verifying        : perl-IO-1.43-480.el9.x86_64                           51/82
  Verifying        : perl-Fcntl-1.13-480.el9.x86_64                        52/82
  Verifying        : perl-Errno-1.30-480.el9.x86_64                        53/82
  Verifying        : perl-DynaLoader-1.47-480.el9.x86_64                   54/82
  Verifying        : perl-B-1.80-480.el9.x86_64                            55/82
  Verifying        : perl-vars-1.05-480.el9.noarch                         56/82
  Verifying        : perl-subs-1.03-480.el9.noarch                         57/82
  Verifying        : perl-overloading-0.02-480.el9.noarch                  58/82
  Verifying        : perl-overload-1.31-480.el9.noarch                     59/82
  Verifying        : perl-if-0.60.800-480.el9.noarch                       60/82
  Verifying        : perl-base-2.27-480.el9.noarch                         61/82
  Verifying        : perl-Symbol-1.08-480.el9.noarch                       62/82
  Verifying        : perl-SelectSaver-1.02-480.el9.noarch                  63/82
  Verifying        : perl-Math-Complex-1.59-480.el9.noarch                 64/82
  Verifying        : perl-IPC-Open3-1.21-480.el9.noarch                    65/82
  Verifying        : perl-Getopt-Std-1.12-480.el9.noarch                   66/82
  Verifying        : perl-FileHandle-2.03-480.el9.noarch                   67/82
  Verifying        : perl-File-stat-1.09-480.el9.noarch                    68/82
  Verifying        : perl-File-Copy-2.34-480.el9.noarch                    69/82
  Verifying        : perl-File-Basename-2.85-480.el9.noarch                70/82
  Verifying        : perl-Class-Struct-0.66-480.el9.noarch                 71/82
  Verifying        : perl-AutoLoader-5.74-480.el9.noarch                   72/82
  Verifying        : perl-Net-SSLeay-1.92-2.el9.x86_64                     73/82
  Verifying        : mariadb-server-utils-3:10.5.22-1.el9_2.x86_64         74/82
  Verifying        : mariadb-server-3:10.5.22-1.el9_2.x86_64               75/82
  Verifying        : mariadb-gssapi-server-3:10.5.22-1.el9_2.x86_64        76/82
  Verifying        : mariadb-errmsg-3:10.5.22-1.el9_2.x86_64               77/82
  Verifying        : mariadb-common-3:10.5.22-1.el9_2.x86_64               78/82
  Verifying        : mariadb-backup-3:10.5.22-1.el9_2.x86_64               79/82
  Verifying        : mariadb-3:10.5.22-1.el9_2.x86_64                      80/82
  Verifying        : perl-DBD-MariaDB-1.21-16.el9_0.x86_64                 81/82
  Verifying        : perl-parent-1:0.238-460.el9.noarch                    82/82

Installed:
  checkpolicy-3.5-1.el9.x86_64
  mariadb-3:10.5.22-1.el9_2.x86_64
  mariadb-backup-3:10.5.22-1.el9_2.x86_64
  mariadb-common-3:10.5.22-1.el9_2.x86_64
  mariadb-connector-c-3.2.6-1.el9_0.x86_64
  mariadb-connector-c-config-3.2.6-1.el9_0.noarch
  mariadb-errmsg-3:10.5.22-1.el9_2.x86_64
  mariadb-gssapi-server-3:10.5.22-1.el9_2.x86_64
  mariadb-server-3:10.5.22-1.el9_2.x86_64
  mariadb-server-utils-3:10.5.22-1.el9_2.x86_64
  mysql-selinux-1.0.5-1.el9_0.noarch
  perl-AutoLoader-5.74-480.el9.noarch
  perl-B-1.80-480.el9.x86_64
  perl-Carp-1.50-460.el9.noarch
  perl-Class-Struct-0.66-480.el9.noarch
  perl-DBD-MariaDB-1.21-16.el9_0.x86_64
  perl-DBI-1.643-9.el9.x86_64
  perl-Data-Dumper-2.174-462.el9.x86_64
  perl-Digest-1.19-4.el9.noarch
  perl-Digest-MD5-2.58-4.el9.x86_64
  perl-DynaLoader-1.47-480.el9.x86_64
  perl-Encode-4:3.08-462.el9.x86_64
  perl-Errno-1.30-480.el9.x86_64
  perl-Exporter-5.74-461.el9.noarch
  perl-Fcntl-1.13-480.el9.x86_64
  perl-File-Basename-2.85-480.el9.noarch
  perl-File-Copy-2.34-480.el9.noarch
  perl-File-Path-2.18-4.el9.noarch
  perl-File-Temp-1:0.231.100-4.el9.noarch
  perl-File-stat-1.09-480.el9.noarch
  perl-FileHandle-2.03-480.el9.noarch
  perl-Getopt-Long-1:2.52-4.el9.noarch
  perl-Getopt-Std-1.12-480.el9.noarch
  perl-HTTP-Tiny-0.076-461.el9.noarch
  perl-IO-1.43-480.el9.x86_64
  perl-IO-Socket-IP-0.41-5.el9.noarch
  perl-IO-Socket-SSL-2.073-1.el9.noarch
  perl-IPC-Open3-1.21-480.el9.noarch
  perl-MIME-Base64-3.16-4.el9.x86_64
  perl-Math-BigInt-1:1.9998.18-460.el9.noarch
  perl-Math-Complex-1.59-480.el9.noarch
  perl-Mozilla-CA-20200520-6.el9.noarch
  perl-NDBM_File-1.15-480.el9.x86_64
  perl-Net-SSLeay-1.92-2.el9.x86_64
  perl-POSIX-1.94-480.el9.x86_64
  perl-PathTools-3.78-461.el9.x86_64
  perl-Pod-Escapes-1:1.07-460.el9.noarch
  perl-Pod-Perldoc-3.28.01-461.el9.noarch
  perl-Pod-Simple-1:3.42-4.el9.noarch
  perl-Pod-Usage-4:2.01-4.el9.noarch
  perl-Scalar-List-Utils-4:1.56-461.el9.x86_64
  perl-SelectSaver-1.02-480.el9.noarch
  perl-Socket-4:2.031-4.el9.x86_64
  perl-Storable-1:3.21-460.el9.x86_64
  perl-Symbol-1.08-480.el9.noarch
  perl-Sys-Hostname-1.23-480.el9.x86_64
  perl-Term-ANSIColor-5.01-461.el9.noarch
  perl-Term-Cap-1.17-460.el9.noarch
  perl-Text-ParseWords-3.30-460.el9.noarch
  perl-Text-Tabs+Wrap-2013.0523-460.el9.noarch
  perl-Time-Local-2:1.300-7.el9.noarch
  perl-URI-5.09-3.el9.noarch
  perl-base-2.27-480.el9.noarch
  perl-constant-1.33-461.el9.noarch
  perl-if-0.60.800-480.el9.noarch
  perl-interpreter-4:5.32.1-480.el9.x86_64
  perl-libnet-3.13-4.el9.noarch
  perl-libs-4:5.32.1-480.el9.x86_64
  perl-mro-1.23-480.el9.x86_64
  perl-overload-1.31-480.el9.noarch
  perl-overloading-0.02-480.el9.noarch
  perl-parent-1:0.238-460.el9.noarch
  perl-podlators-1:4.14-460.el9.noarch
  perl-subs-1.03-480.el9.noarch
  perl-vars-1.05-480.el9.noarch
  policycoreutils-python-utils-3.5-3.el9_3.noarch
  python3-audit-3.0.7-104.el9.x86_64
  python3-distro-1.5.0-7.el9.noarch
  python3-libsemanage-3.5-2.el9.x86_64
  python3-policycoreutils-3.5-3.el9_3.noarch
  python3-setools-4.4.3-1.el9.x86_64
  python3-setuptools-53.0.0-12.el9.noarch

Complete!
[nico@db ~]$ sudo systemctl start mariadb
[nico@db ~]$ systemctl enable mariadb
Failed to enable unit: Access denied
[nico@db ~]$ sudo systemctl enable mariadb
[sudo] password for nico:
Created symlink /etc/systemd/system/mysql.service → /usr/lib/systemd/system/mariadb.service.
Created symlink /etc/systemd/system/mysqld.service → /usr/lib/systemd/system/mariadb.service.
Created symlink /etc/systemd/system/multi-user.target.wants/mariadb.service → /usr/lib/systemd/system/mariadb.service.
[nico@db ~]$ systemctl start mariadb
Failed to start mariadb.service: Access denied
See system logs and 'systemctl status mariadb.service' for details.
[nico@db ~]$ sudo systemctl start mariadb

[nico@db ~]$ sudo mysql_secure_installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
haven't set the root password yet, you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password or using the unix_socket ensures that nobody
can log into the MariaDB root user without the proper authorisation.

You already have your root account protected, so you can safely answer 'n'.

Switch to unix_socket authentication [Y/n] y
Enabled successfully!
Reloading privilege tables..
 ... Success!


You already have your root account protected, so you can safely answer 'n'.

Change the root password? [Y/n] y
New password:
Re-enter new password:
Password updated successfully!
Reloading privilege tables..
 ... Success!


By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
[nico@db ~]$ sudo mariadb-secure-installation

NOTE: RUNNING ALL PARTS OF THIS SCRIPT IS RECOMMENDED FOR ALL MariaDB
      SERVERS IN PRODUCTION USE!  PLEASE READ EACH STEP CAREFULLY!

In order to log into MariaDB to secure it, we'll need the current
password for the root user. If you've just installed MariaDB, and
haven't set the root password yet, you should just press enter here.

Enter current password for root (enter for none):
OK, successfully used password, moving on...

Setting the root password or using the unix_socket ensures that nobody
can log into the MariaDB root user without the proper authorisation.

You already have your root account protected, so you can safely answer 'n'.

Switch to unix_socket authentication [Y/n] y
Enabled successfully!
Reloading privilege tables..
 ... Success!


You already have your root account protected, so you can safely answer 'n'.

Change the root password? [Y/n] n
 ... skipping.

By default, a MariaDB installation has an anonymous user, allowing anyone
to log into MariaDB without having to have a user account created for
them.  This is intended only for testing, and to make the installation
go a bit smoother.  You should remove them before moving into a
production environment.

Remove anonymous users? [Y/n] y
 ... Success!

Normally, root should only be allowed to connect from 'localhost'.  This
ensures that someone cannot guess at the root password from the network.

Disallow root login remotely? [Y/n] y
 ... Success!

By default, MariaDB comes with a database named 'test' that anyone can
access.  This is also intended only for testing, and should be removed
before moving into a production environment.

Remove test database and access to it? [Y/n] y
 - Dropping test database...
 ... Success!
 - Removing privileges on test database...
 ... Success!

Reloading the privilege tables will ensure that all changes made so far
will take effect immediately.

Reload privilege tables now? [Y/n] y
 ... Success!

Cleaning up...

All done!  If you've completed all of the above steps, your MariaDB
installation should now be secure.

Thanks for using MariaDB!
[nico@db ~]$ systemctl enable mariadb
Failed to enable unit: Access denied
[nico@db ~]$ sudo !!
sudo systemctl enable mariadb
[sudo] password for nico:
[nico@db ~]$
```

🌞 **Port utilisé par MariaDB**

```bash
sudo] password for nico:
LISTEN 0      80                 *:3306            *:*    users:(("mariadbd",pid=801,fd=19))
[nico@db ~]$ sudo firewal-cmd --permanent --add-port=3306/tcp
sudo: firewal-cmd: command not found
[nico@db ~]$ sudo firewall-cmd --permanent --add-port=3306/tcp
success
[nico@db ~]$ sudo firewall-cmd --reload
success
[nico@db ~]$
```

🌞 **Processus liés à MariaDB**

 ```bash
[nico@db ~]$ sudo systemctl start mariadb
[nico@db ~]$ ps -ef | grep mariadb
mysql        801       1  0 18:05 ?        00:00:00 /usr/libexec/mariadbd --basedir=/usr
nico        4270    4213  0 18:16 pts/0    00:00:00 grep --color=auto mariadb
[nico@db ~]$
 ```


# Partie 3 : Configuration et mise en place de NextCloud


## 1. Base de données


🌞 **Préparation de la base pour NextCloud**

```bash
[nico@db ~]$ sudo mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 4
Server version: 10.5.22-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> CREATE USER 'nextcloud'@'10.6.1.11' IDENTIFIED BY 'pewpewpew';
Query OK, 0 rows affected (0.010 sec)

MariaDB [(none)]> CREATE DATABASE IF NOT EXISTS nextcloud CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
Query OK, 1 row affected (0.000 sec)

MariaDB [(none)]> GRANT ALL PRIVILEGES ON nextcloud.* TO 'nextcloud'@'10.6.1.11';
Query OK, 0 rows affected (0.004 sec)

MariaDB [(none)]> FLUSH PRIVILEGES;
Query OK, 0 rows affected (0.001 sec)

MariaDB [(none)]>
```
🌞 **Exploration de la base de données**

```bash 
[nico@web ~]$ sudo dnf provides mysql
Last metadata expiration check: 0:10:29 ago on Tue 26 Mar 2024 12:10:50 PM CET.
mysql-8.0.36-1.el9_3.x86_64 : MySQL client programs and shared libraries
Repo        : @System
Matched from:
Provide    : mysql = 8.0.36-1.el9_3

mysql-8.0.36-1.el9_3.x86_64 : MySQL client programs and shared libraries
Repo        : appstream
Matched from:
Provide    : mysql = 8.0.36-1.el9_3

[nico@web ~]$ sudo mysql -u nextcloud -h 10.6.1.12 -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 14
Server version: 5.5.5-10.5.22-MariaDB MariaDB Server

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SHOW DATABASES;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| nextcloud          |
+--------------------+
2 rows in set (0.01 sec)

mysql>
```

🌞 **Trouver une commande SQL qui permet de lister tous les utilisateurs de la base de données**

```bash
[nico@db ~]$ sudo mysql -u root -p
[sudo] password for nico:
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 15
Server version: 10.5.22-MariaDB MariaDB Server

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]> SELECT User, Host FROM mysql.user;
+-------------+-----------+
| User        | Host      |
+-------------+-----------+
| nextcloud   | 10.6.1.11 |
| mariadb.sys | localhost |
| mysql       | localhost |
| root        | localhost |
+-------------+-----------+
4 rows in set (0.016 sec)

MariaDB [(none)]> GRANT ALL PRIVILEGES ON *.* TO 'root'@'10.6.1.11' IDENTIFIED BY 'r
oot' WITH GRANT OPTION;
Query OK, 0 rows affected (0.010 sec)

MariaDB [(none)]>
```

```bash

[nico@web ~]$ mysql -u root -h 10.6.1.12 -p
Enter password:
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 16
Server version: 5.5.5-10.5.22-MariaDB MariaDB Server

Copyright (c) 2000, 2024, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> SELECT User, Host FROM mysql.user;
+-------------+-----------+
| User        | Host      |
+-------------+-----------+
| nextcloud   | 10.6.1.11 |
| root        | 10.6.1.11 |
| mariadb.sys | localhost |
| mysql       | localhost |
| root        | localhost |
+-------------+-----------+
5 rows in set (0.00 sec)

mysql>

```

## 2. Serveur Web et NextCloud

🌞 **Install de PHP**
```bash
[nico@web ~]$ sudo dnf install php
Last metadata expiration check: 1:07:34 ago on Tue 26 Mar 2024 12:10:50 PM CET.
Dependencies resolved.
====================================================================================
 Package               Arch        Version                     Repository      Size
====================================================================================
Installing:
 php                   x86_64      8.0.30-1.el9_2              appstream      7.7 k
Installing dependencies:
 libxslt               x86_64      1.1.34-9.el9                appstream      240 k
 nginx-filesystem      noarch      1:1.20.1-14.el9_2.1         appstream      8.5 k
 oniguruma             x86_64      6.9.6-1.el9.5               appstream      217 k
 php-common            x86_64      8.0.30-1.el9_2              appstream      665 k
Installing weak dependencies:
 php-cli               x86_64      8.0.30-1.el9_2              appstream      3.1 M
 php-fpm               x86_64      8.0.30-1.el9_2              appstream      1.6 M
 php-mbstring          x86_64      8.0.30-1.el9_2              appstream      468 k
 php-opcache           x86_64      8.0.30-1.el9_2              appstream      509 k
 php-pdo               x86_64      8.0.30-1.el9_2              appstream       81 k
 php-xml               x86_64      8.0.30-1.el9_2              appstream      131 k

Transaction Summary
====================================================================================
Install  11 Packages

Total download size: 7.0 M
Installed size: 37 M
Is this ok [y/N]: y
Downloading Packages:
(1/11): nginx-filesystem-1.20.1-14.el9_2.1.noarch.r  40 kB/s | 8.5 kB     00:00
(2/11): oniguruma-6.9.6-1.el9.5.x86_64.rpm          766 kB/s | 217 kB     00:00
(3/11): libxslt-1.1.34-9.el9.x86_64.rpm             750 kB/s | 240 kB     00:00
(4/11): php-xml-8.0.30-1.el9_2.x86_64.rpm           712 kB/s | 131 kB     00:00
(5/11): php-pdo-8.0.30-1.el9_2.x86_64.rpm           486 kB/s |  81 kB     00:00
(6/11): php-opcache-8.0.30-1.el9_2.x86_64.rpm       2.2 MB/s | 509 kB     00:00
(7/11): php-mbstring-8.0.30-1.el9_2.x86_64.rpm      2.2 MB/s | 468 kB     00:00
(8/11): php-common-8.0.30-1.el9_2.x86_64.rpm        2.2 MB/s | 665 kB     00:00
(9/11): php-8.0.30-1.el9_2.x86_64.rpm               165 kB/s | 7.7 kB     00:00
(10/11): php-fpm-8.0.30-1.el9_2.x86_64.rpm          3.1 MB/s | 1.6 MB     00:00
(11/11): php-cli-8.0.30-1.el9_2.x86_64.rpm          4.7 MB/s | 3.1 MB     00:00
------------------------------------------------------------------------------------
Total                                               4.0 MB/s | 7.0 MB     00:01
Running transaction check
Transaction check succeeded.
Running transaction test
Transaction test succeeded.
Running transaction
  Preparing        :                                                            1/1
  Installing       : php-common-8.0.30-1.el9_2.x86_64                          1/11
  Installing       : php-pdo-8.0.30-1.el9_2.x86_64                             2/11
  Installing       : php-opcache-8.0.30-1.el9_2.x86_64                         3/11
  Installing       : php-cli-8.0.30-1.el9_2.x86_64                             4/11
  Installing       : oniguruma-6.9.6-1.el9.5.x86_64                            5/11
  Installing       : php-mbstring-8.0.30-1.el9_2.x86_64                        6/11
  Installing       : libxslt-1.1.34-9.el9.x86_64                               7/11
  Installing       : php-xml-8.0.30-1.el9_2.x86_64                             8/11
  Running scriptlet: nginx-filesystem-1:1.20.1-14.el9_2.1.noarch               9/11
  Installing       : nginx-filesystem-1:1.20.1-14.el9_2.1.noarch               9/11
  Installing       : php-fpm-8.0.30-1.el9_2.x86_64                            10/11
  Running scriptlet: php-fpm-8.0.30-1.el9_2.x86_64                            10/11
  Installing       : php-8.0.30-1.el9_2.x86_64                                11/11
  Running scriptlet: php-8.0.30-1.el9_2.x86_64                                11/11
  Verifying        : nginx-filesystem-1:1.20.1-14.el9_2.1.noarch               1/11
  Verifying        : libxslt-1.1.34-9.el9.x86_64                               2/11
  Verifying        : oniguruma-6.9.6-1.el9.5.x86_64                            3/11
  Verifying        : php-xml-8.0.30-1.el9_2.x86_64                             4/11
  Verifying        : php-pdo-8.0.30-1.el9_2.x86_64                             5/11
  Verifying        : php-opcache-8.0.30-1.el9_2.x86_64                         6/11
  Verifying        : php-mbstring-8.0.30-1.el9_2.x86_64                        7/11
  Verifying        : php-fpm-8.0.30-1.el9_2.x86_64                             8/11
  Verifying        : php-common-8.0.30-1.el9_2.x86_64                          9/11
  Verifying        : php-cli-8.0.30-1.el9_2.x86_64                            10/11
  Verifying        : php-8.0.30-1.el9_2.x86_64                                11/11

Installed:
  libxslt-1.1.34-9.el9.x86_64         nginx-filesystem-1:1.20.1-14.el9_2.1.noarch
  oniguruma-6.9.6-1.el9.5.x86_64      php-8.0.30-1.el9_2.x86_64
  php-cli-8.0.30-1.el9_2.x86_64       php-common-8.0.30-1.el9_2.x86_64
  php-fpm-8.0.30-1.el9_2.x86_64       php-mbstring-8.0.30-1.el9_2.x86_64
  php-opcache-8.0.30-1.el9_2.x86_64   php-pdo-8.0.30-1.el9_2.x86_64
  php-xml-8.0.30-1.el9_2.x86_64

Complete!
[nico@web ~]$ php -v
PHP Warning:  PHP Startup: ^(text/|application/xhtml\+xml) (offset=0): unrecognised compile-time option bit(s) in Unknown on line 0
PHP 8.0.30 (cli) (built: Aug  3 2023 17:13:08) ( NTS gcc x86_64 )
Copyright (c) The PHP Group
Zend Engine v4.0.30, Copyright (c) Zend Technologies
    with Zend OPcache v8.0.30, Copyright (c), by Zend Technologies
[nico@web ~]$
```

🌞 **Récupérer NextCloud**

- créez le dossier `/var/www/tp6_nextcloud/`
  - ce sera notre *racine web* (ou *webroot*)
  - l'endroit où le site est stocké quoi, on y trouvera un `index.html` et un tas d'autres marde, tout ce qui constitue NextCloud :D
- récupérer le fichier suivant avec une commande `curl` ou `wget` : https://download.nextcloud.com/server/releases/latest.zip   
- extrayez tout son contenu dans le dossier `/var/www/tp6_nextcloud/` en utilisant la commande `unzip`
  - installez la commande `unzip` si nécessaire
  - vous pouvez extraire puis déplacer ensuite, vous prenez pas la tête
  - contrôlez que le fichier `/var/www/tp6_nextcloud/index.html` existe pour vérifier que tout est en place
- **assurez-vous que le dossier `/var/www/tp6_nextcloud/` et tout son contenu appartient à l'utilisateur qui exécute le service Apache**
  - utilisez une commande `chown` si nécessaire

> A chaque fois que vous faites ce genre de trucs, assurez-vous que c'est bien ok. Par exemple, vérifiez avec un `ls -al` que tout appartient bien à l'utilisateur qui exécute Apache.

🌞 **Adapter la configuration d'Apache**

- regardez la dernière ligne du fichier de conf d'Apache pour constater qu'il existe une ligne qui inclut d'autres fichiers de conf
- créez en conséquence un fichier de configuration qui porte un nom clair et qui contient la configuration suivante :

```apache
<VirtualHost *:80>
  # on indique le chemin de notre webroot
  DocumentRoot /var/www/tp6_nextcloud/
  # on précise le nom que saisissent les clients pour accéder au service
  ServerName  web.tp6.linux

  # on définit des règles d'accès sur notre webroot
  <Directory /var/www/tp6_nextcloud/> 
    Require all granted
    AllowOverride All
    Options FollowSymLinks MultiViews
    <IfModule mod_dav.c>
      Dav off
    </IfModule>
  </Directory>
</VirtualHost>
```

🌞 **Redémarrer le service Apache** pour qu'il prenne en compte le nouveau fichier de conf

![NextCloud error](../img/nc_install.png)

## 3. Finaliser l'installation de NextCloud

➜ **Sur votre PC**

- modifiez votre fichier `hosts` (oui, celui de votre PC, de votre hôte)
  - pour pouvoir joindre l'IP de la VM en utilisant le nom `web.tp6.linux`
- avec un navigateur, visitez NextCloud à l'URL `http://web.tp6.linux`
  - c'est possible grâce à la modification de votre fichier `hosts`
- normalement une belle page NextCloud qui s'affiche **pour te dire qu'il manque des modules PHP**

🌞 **Installez les deux modules PHP dont NextCloud vous parle**

- vous pouvez les installer avec `dnf`, ils sont aussi fournis par Rocky !
- à faire sur la machine sur laquelle vous avez installé NextCloud bien entendu :)

🌞 **Pour que NextCloud utilise la base de données, ajoutez aussi**

- le module PHP `php-pdo`
- le module PHP `php-mysqlnd`
- à faire sur la machine sur laquelle vous avez installé NextCloud bien entendu :)

➜ **Sur votre PC**

- retournez sur la page
- on va vous demander un utilisateur et un mot de passe pour créer un compte admin
  - ne saisissez rien pour le moment
- cliquez sur "Storage & Database" juste en dessous
  - choisissez "MySQL/MariaDB"
  - saisissez les informations pour que NextCloud puisse se connecter avec votre base
- saisissez l'identifiant et le mot de passe admin que vous voulez, et validez l'installation

🌴 **C'est chez vous ici**, baladez vous un peu sur l'interface de NextCloud, faites le tour du propriétaire :)

🌞 **Exploration de la base de données**

- connectez vous en ligne de commande à la base de données après l'installation terminée
- déterminer combien de tables ont été crées par NextCloud lors de la finalisation de l'installation
  - ***bonus points*** si la réponse à cette question est automatiquement donnée par une requête SQL

➜ **NextCloud est tout bo, en place, tu peux go sur [la partie 4.](../part4/README.md)**