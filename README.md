# K8S DEB Packages for Linux

As of July 2020, there is no official packages Google K8S for Debian 10 and Ubuntu 18.04 LTS. So building the package manually is the way to go for now...

Binary DEB packages can be downloaded at https://github.com/runlevel5/kubernetes-packages/releases

They can be used on both Debian and Ubuntu

### How to build?

Ensure you have `docker` and `docker-compose` installed

```
ARCH=[amd64|ppc64le] make build
```
