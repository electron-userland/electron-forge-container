# Electron Forge Docker Container

[![Build Status](https://travis-ci.org/electron-userland/electron-forge-container.svg?branch=master)](https://travis-ci.org/electron-userland/electron-forge-container)
[![Docker Automated build](https://img.shields.io/docker/automated/malept/electron-forge.svg)](https://hub.docker.com/r/malept/electron-forge-container/)

Used to run CI for [Electron Forge](https://github.com/electron-userland/electron-forge) on Linux,
but can also be used as a base to build Electron app packages for Linux via Electron Forge.

## Usage

```docker
FROM malept/electron-forge-container:latest

# …other Docker commands…
```
