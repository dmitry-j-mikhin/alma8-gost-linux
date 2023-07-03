set -ex

#taken from https://www.altlinux.org/%D0%93%D0%9E%D0%A1%D0%A2_%D0%B2_OpenSSL#%D0%A1%D0%BE%D0%B7%D0%B4%D0%B0%D0%BD%D0%B8%D0%B5_%D0%BA%D0%BB%D1%8E%D1%87%D0%B5%D0%B9
openssl genpkey -algorithm gost2012_256 -pkeyopt paramset:TCB -out ca.key
openssl req -new -x509 -md_gost12_256 -days 365 -key ca.key -out ca.cer \
  -subj "/C=RU/ST=Russia/L=Moscow/O=Example/OU=Example CA/CN=Example CA Root"
