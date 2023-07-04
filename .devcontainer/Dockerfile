ARG RELEASE="jammy"
FROM mcr.microsoft.com/devcontainers/base:$RELEASE


RUN adduser jhollowe --disabled-password \
    && adduser jhollowe sudo \
    && echo "jhollowe ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/jhollowe
