set -ex

docker run -it --rm \
 -v `realpath certs`:/certs \
 dmikhin/alma8-gost-nginx:latest \
 /bin/sh -c "nginx && curl --cacert /certs/ca.cer -v https://localhost && exec bash"
