# Note: You can use any Debian/Ubuntu based image you want. 
FROM mcr.microsoft.com/devcontainers/base:bullseye

# [Optional] Uncomment this section to install additional OS packages.
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends make \
    python3-dev \
    python3-pip \
    python3-netaddr \
    libkrb5-dev \
    krb5-user \
    iputils-ping \
    gnupg \
    curl \
    wget \
    apache2-utils

# Install pyhton package manager
RUN python3 -m pip install --upgrade pip \
    && python3 -m pip install ansible-core==2.13.9 \
    && python3 -m pip install ansible-lint==6.8.2