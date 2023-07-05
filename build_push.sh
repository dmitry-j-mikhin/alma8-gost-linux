set -ex

DOCKER_BUILDKIT=1 docker build --pull \
 --tag dmikhin/alma8-gost-nginx:wmx .
docker push dmikhin/alma8-gost-nginx:wmx
