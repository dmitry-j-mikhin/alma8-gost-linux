# syntax=docker/dockerfile:experimental
FROM almalinux:8.8

LABEL maintainer="Dmitry Mikhin <dmikhin@webmonitorx.ru>"

RUN --mount=type=bind,target=/tmp,source=scripts,ro \
    /tmp/build.sh

ENTRYPOINT ["/docker-entrypoint.sh"]

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
