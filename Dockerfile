FROM debian:stretch

RUN apt update
RUN apt install -y --no-install-recommends software-properties-common curl apt-transport-https gnupg && \
    rm -r /var/cache/apt/archives
RUN curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    add-apt-repository "deb https://deb.nodesource.com/node_6.x jessie main" && \
    apt update && \
    apt install -y --no-install-recommends \
        fakeroot dpkg flatpak-builder zip rpm nodejs git python python3-pip make gcc g++ && \
    rm -r /var/cache/apt/archives
RUN pip3 install git+https://github.com/snapcore/snapcraft#egg=snapcraft
