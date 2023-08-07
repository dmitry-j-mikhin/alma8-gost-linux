# alma8-gost-nginx
[Docker image](https://hub.docker.com/r/dmikhin/alma8-gost-nginx) based on AlmaLinux 8.8 plus OpenSSL GOST engine with nginx 1.22.1

[certs](certs) folder contains self-signed GOST certificates used for testing

[run.sh](run.sh) script will execute container with nginx and will do test curl request using GOST encryption:
```
$ ./run.sh
* Rebuilt URL to: https://localhost/
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
> GET / HTTP/1.1
> Host: localhost
> User-Agent: curl/7.61.1
> Accept: */*
> 
< HTTP/1.1 200 OK
< Server: nginx/1.22.1
< Date: Mon, 03 Jul 2023 13:33:35 GMT
< Content-Type: text/html
< Content-Length: 615
< Connection: keep-alive
< Last-Modified: Wed, 19 Oct 2022 10:48:51 GMT
< ETag: "634fd613-267"
< Accept-Ranges: bytes
< 
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
html { color-scheme: light dark; }
body { width: 35em; margin: 0 auto;
font-family: Tahoma, Verdana, Arial, sans-serif; }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
* Connection #0 to host localhost left intact
```
