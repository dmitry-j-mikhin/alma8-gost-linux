set -ex

docker run -it --rm \
 -v `realpath certs`:/certs \
 -e "TARANTOOL_MEMORY_GB=1" \
 -e "WALLARM_MODE=block" \
 -e "WALLARM_API_HOST=api.wallarm.ru" \
 -e "WALLARM_API_TOKEN=${WALLARM_API_TOKEN}" \
 dmikhin/alma8-gost-nginx:wmx \
 sh -c "nginx && curl --cacert /certs/ca.cer -v https://localhost/etc/passwd && exec bash"
