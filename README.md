# alma8-gost-linux
Docker image based on AlmaLinux 8.8 plus OpenSSL GOST engine with nginx 1.22.1 and WMX 4.6 module

[certs](certs) folder contains self-signed GOST certificates used for testing

[run.sh](run.sh) script will execute container with nginx and will do test curl request with attack using GOST encryption that will be blocked:
```
$ WALLARM_API_TOKEN=<your WMX token> ./run.sh
2023-07-05 10:17:48 INFO register-node[14]: Successfully registered new node instance (e784aa9a5d53) with uuid 28f04e68-ce87-4583-b203-b9809284c740 and type "all"
2023-07-05 10:17:48 INFO register-node[14]: Node config saved to file /opt/wallarm/etc/wallarm/node.yaml
2023-07-05 10:17:48 INFO register-node[14]: Syncing data files...
2023-07-05 10:17:50 INFO syncnode[16]: Private key was updated
2023-07-05 10:17:50 INFO syncnode[16]: Proton.db was updated
2023-07-05 10:17:50 INFO syncnode[16]: Custom ruleset file updated
2023-07-05 10:17:50 INFO syncnode[16]: Restart of scripts: 0 success, 0 skipped, 0 errors
2023-07-05 10:17:50 INFO register-node[14]: Exporting environments...
2023-07-05 10:17:51 INFO export-environment[19]: Processing...
2023-07-05 10:17:51 INFO export-environment[19]: Component versions exported
2023-07-05 10:17:51 INFO export-environment[19]: Finish...
2023-07-05 10:17:51 INFO register-node[14]: INFO: Syncing acl files...
2023-07-05 10:17:51 INFO sync-ip-lists[22]: Try to acquire lock...
2023-07-05 10:17:51 INFO sync-ip-lists[22]: Acquired lockfile /opt/wallarm/tmp/.wallarm.sync-ip-lists.lock
2023-07-05 10:17:51 INFO sync-ip-lists[22]: Schema file: /opt/wallarm/usr/lib/ruby/vendor_ruby/wallarm/blacklist/migrate/03_base_schema.sql
2023-07-05 10:17:51 INFO sync-ip-lists[22]: DB version number: 3
2023-07-05 10:17:51 INFO sync-ip-lists[22]: Current client_id: 3038
2023-07-05 10:17:51 INFO sync-ip-lists[22]: DB stalled: false
2023-07-05 10:17:52 INFO sync-ip-lists[22]: Records loaded: 90, current continuation: 66600280
2023-07-05 10:17:52 INFO sync-ip-lists[22]: Records loaded: 0, current continuation: 66600280
2023-07-05 10:17:52 INFO sync-ip-lists[22]: Synced IP lists
2023-07-05 10:17:52 INFO sync-ip-lists-source[24]: Syncing IP lists from mmdb...
2023-07-05 10:17:57 INFO sync-ip-lists-source[24]: Synced IP lists from mmdb
2023-07-05 10:17:57 INFO register-node[14]: Installation finished, you can configure services now.
wait-for-it.sh: waiting 60 seconds for 127.0.0.1:3313
wait-for-it.sh: 127.0.0.1:3313 is available after 2 seconds
2023/07/05 10:17:59 [notice] 81#81: using the "epoll" event method
2023/07/05 10:17:59 [notice] 81#81: nginx/1.22.1
2023/07/05 10:17:59 [notice] 81#81: built by gcc 8.5.0 20210514 (Red Hat 8.5.0-4) (GCC) 
2023/07/05 10:17:59 [notice] 81#81: OS: Linux 5.15.0-73-generic
2023/07/05 10:17:59 [notice] 81#81: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2023/07/05 10:17:59 [notice] 105#105: start worker processes
2023/07/05 10:17:59 [notice] 105#105: start worker process 106
2023/07/05 10:17:59 [notice] 105#105: start worker process 107
2023/07/05 10:17:59 [notice] 105#105: start worker process 108
2023/07/05 10:17:59 [notice] 105#105: start worker process 109
2023/07/05 10:17:59 [notice] 105#105: start worker process 111
2023/07/05 10:17:59 [notice] 105#105: start worker process 112
2023/07/05 10:17:59 [notice] 105#105: start worker process 113
2023/07/05 10:17:59 [notice] 105#105: start worker process 114
2023/07/05 10:17:59 [notice] 105#105: start cache manager process 115
*   Trying 127.0.0.1...
* TCP_NODELAY set
* Connected to localhost (127.0.0.1) port 443 (#0)
GOST engine already loaded
* ALPN, offering h2
* ALPN, offering http/1.1
* successfully set certificate verify locations:
*   CAfile: /certs/ca.cer
  CApath: none
* TLSv1.3 (OUT), TLS handshake, Client hello (1):
* TLSv1.3 (IN), TLS handshake, Server hello (2):
* TLSv1.2 (IN), TLS handshake, Certificate (11):
* TLSv1.2 (IN), TLS handshake, Server finished (14):
* TLSv1.2 (OUT), TLS handshake, Client key exchange (16):
* TLSv1.2 (OUT), TLS change cipher, Change cipher spec (1):
* TLSv1.2 (OUT), TLS handshake, Finished (20):
* TLSv1.2 (IN), TLS handshake, Finished (20):
* SSL connection using TLSv1.2 / GOST2012-GOST8912-GOST8912
* ALPN, server accepted to use http/1.1
* Server certificate:
*  subject: C=RU; L=Moscow; O=My site with GOST; CN=localhost
*  start date: Jul  3 12:11:03 2023 GMT
*  expire date: Jul  2 12:11:03 2024 GMT
*  common name: localhost (matched)
*  issuer: C=RU; ST=Russia; L=Moscow; O=Example; OU=Example CA; CN=Example CA Root
*  SSL certificate verify ok.
> GET /etc/passwd HTTP/1.1
> Host: localhost
> User-Agent: curl/7.61.1
> Accept: */*
> 
< HTTP/1.1 403 Forbidden
< Server: nginx/1.22.1
< Date: Wed, 05 Jul 2023 10:17:59 GMT
< Content-Type: text/html
< Content-Length: 153
< Connection: keep-alive
< 
<html>
<head><title>403 Forbidden</title></head>
<body>
<center><h1>403 Forbidden</h1></center>
<hr><center>nginx/1.22.1</center>
</body>
</html>
* Connection #0 to host localhost left intact
127.0.0.1 - - [05/Jul/2023:10:17:59 +0000] "GET /etc/passwd HTTP/1.1" 403 153 "-" "curl/7.61.1" "-"
```
