FROM ubuntu:16.04

ENV LC_ALL=C.UTF-8 LANG=C.UTF-8

COPY snap /tmp/
RUN apt update
RUN apt install -y --no-install-recommends software-properties-common curl apt-transport-https && \
    apt clean
RUN add-apt-repository ppa:alexlarsson/flatpak && \
    curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add - && \
    add-apt-repository "deb https://deb.nodesource.com/node_8.x xenial main" && \
    curl -s https://bintray.com/user/downloadSubjectPublicKey?username=bintray | apt-key add - && \
    add-apt-repository "deb https://dl.bintray.com/electronuserland/rpm-xenial xenial main" && \
    apt update && \
    apt install -y --no-install-recommends \
        fakeroot dpkg flatpak-builder unzip zip rpm snapcraft nodejs git python make gcc g++ && \
    apt clean && \
    flatpak remote-add --system --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak install --system --no-deps --assumeyes runtime/org.freedesktop.Sdk/x86_64/1.6 && \
    flatpak install --system --no-deps --assumeyes runtime/org.freedesktop.Platform/x86_64/1.6 && \
    flatpak install --system --no-deps --assumeyes app/io.atom.electron.BaseApp/x86_64/stable && \
    flatpak install --system --no-deps --assumeyes app/org.electronjs.Electron2.BaseApp/x86_64/stable && \
    cd /tmp && \
    snapcraft pull desktop-gtk3 electron-deps && \
    rm -r snap
