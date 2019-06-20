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
    flatpak install --user --no-deps --assumeyes --arch x86_64 --from https://raw.githubusercontent.com/endlessm/flatpak-bundler/master/refs/freedesktop-sdk-1.4.flatpakref && \
    flatpak install --user --no-deps --assumeyes --arch x86_64 --from https://raw.githubusercontent.com/endlessm/flatpak-bundler/master/refs/freedesktop-runtime-1.4.flatpakref && \
    flatpak install --user --no-deps --assumeyes --arch x86_64 --from https://s3-us-west-2.amazonaws.com/electron-flatpak.endlessm.com/electron-base-app-master.flatpakref && \
    flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo && \
    flatpak install --user --no-deps --assumeyes runtime/org.freedesktop.Sdk/x86_64/1.6 && \
    flatpak install --user --no-deps --assumeyes runtime/org.freedesktop.Platform/x86_64/1.6 && \
    flatpak install --user --no-deps --assumeyes app/io.atom.electron.BaseApp/x86_64/stable && \
    flatpak install --user --no-deps --assumeyes app/org.electronjs.Electron2.BaseApp/x86_64/stable && \
    cd /tmp && \
    snapcraft pull desktop-gtk3 electron-deps && \
    rm -r snap
