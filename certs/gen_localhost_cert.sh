set -ex

#taken from https://www.altlinux.org/Nginx-gost
openssl genpkey -algorithm gost2012_256 -pkeyopt paramset:A -out localhost.key
openssl req -new  -md_gost12_256 -key localhost.key -out localhost.csr -subj "/C=RU/L=Moscow/O=My site with GOST/CN=localhost"
openssl x509 -req -in localhost.csr -CA ca.cer -CAkey ca.key -CAcreateserial -out localhost.cer -days 365
