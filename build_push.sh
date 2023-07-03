set -ex

DOCKER_BUILDKIT=1 docker build --pull \
 --tag dmikhin/alma8-gost-nginx:latest .
docker push dmikhin/alma8-gost-nginx:latest
