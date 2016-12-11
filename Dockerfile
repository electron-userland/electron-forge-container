FROM ubuntu:16.04

RUN apt update
RUN apt install -y --no-install-recommends software-properties-common curl apt-transport-https && \
    rm -r /var/cache/apt/archives
RUN add-apt-repository ppa:alexlarsson/flatpak && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    add-apt-repository "deb https://deb.nodesource.com/node_6.x xenial main" && \
    apt update && \
    apt install -y --no-install-recommends fakeroot dpkg flatpak-builder zip rpm nodejs git python && \
    rm -r /var/cache/apt/archives

RUN flatpak remote-add --from gnome https://sdk.gnome.org/gnome.flatpakrepo && \
    flatpak install --runtime gnome org.freedesktop.Platform//1.4
