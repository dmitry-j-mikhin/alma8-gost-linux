set -ex

rpm -i http://repo.red-soft.ru/redos/7.3/x86_64/os/openssl-gost-engine-1.1.1.0-0.1.el7.x86_64.rpm \
       http://nginx.org/packages/centos/8/x86_64/RPMS/nginx-1.22.1-1.el8.ngx.x86_64.rpm

sed -i 's/openssl_conf = default_modules/openssl_conf = openssl_def/' /etc/pki/tls/openssl.cnf
    echo '
[openssl_def]
engines = engine_section

[engine_section]
gost = gost_section

[gost_section]
engine_id = gost
dynamic_path = /usr/lib64/engines-1.1/gost.so
default_algorithms = ALL
CRYPT_PARAMS = id-Gost28147-89-CryptoPro-A-ParamSet' >> /etc/pki/tls/openssl.cnf
sed -i 's/@SECLEVEL=.:kEECDH:kRSA:kEDH:kPSK:kDHEPSK:kECDHEPSK:-aDSS:-3DES:!DES:!RC4:!RC2:!IDEA:-SEED:!eNULL:!aNULL:!MD5:-SHA384:-CAMELLIA:-ARIA:-AESCCM8/@SECLEVEL=1:aGOST:aGOST01:kGOST:GOST94:GOST89MAC:kEECDH:kRSA:kEDH:kPSK:kDHEPSK:kECDHEPSK:-aDSS:-3DES:!DES:!RC4:!RC2:!IDEA:-SEED:!eNULL:!aNULL:!MD5:-SHA384:-CAMELLIA:-ARIA:-AESCCM8/' /etc/crypto-policies/back-ends/openssl.config

echo '
server {
        server_name localhost;
        listen       443 ssl;
        ssl_certificate /certs/localhost.cer;
        ssl_certificate_key /certs/localhost.key;
        ssl_ciphers GOST2012-GOST8912-GOST8912:HIGH:MEDIUM;
        ssl_protocols   TLSv1 TLSv1.1 TLSv1.2;
        ssl_prefer_server_ciphers  on;
        location / {
            proxy_pass http://localhost;
        }
}' >> /etc/nginx/conf.d/default.conf

yum clean all
