## How to build DEB packages?

### With docker

1. `docker build -t kubepkg-ubuntu-18.04 .`
2. `mkdir packages && docker run --env ARCH=<arch> -v ./packages:/build/bin/release kubepkg-ubuntu-18.04`

### With podman

1. `podman build -t kubepkg-ubuntu-18.04 .`
2. `mkdir packages && podman run --env ARCH=<arch> -v ./packages:/build/bin/release:Z kubepkg-ubuntu-18.04`


NOTE: `<arch>` can be amd64,arm,arm64,ppc64le,s390x
