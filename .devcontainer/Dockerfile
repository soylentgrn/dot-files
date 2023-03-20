ARG SOAR_VERSION=6.0
FROM soylentgrn/soarappdev:${SOAR_VERSION} as soar

FROM mcr.microsoft.com/devcontainers/python:3.9

USER vscode
RUN sudo apt-get update; \
    sudo apt-get install -y libldap2-dev libsasl2-dev; \
    sudo apt-get clean

COPY --from=soar /soar /soar