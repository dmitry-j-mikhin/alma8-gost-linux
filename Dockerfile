# syntax=docker/dockerfile:experimental
FROM almalinux:8.8

RUN --mount=type=bind,target=/tmp,source=scripts,ro \
    /tmp/build.sh
