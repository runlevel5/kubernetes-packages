## How to build debian packages?

### With docker

1. docker build -t kubepkg-debian-10 .
2. mkdir packages && docker run --env ARCH=<arch> -v ./packages:/build/bin/release kubepkg-debian-10

### With podman

1. podman build -t kubepkg-debian-10 .
2. mkdir packages && podman run --env ARCH=<arch> -v ./packages:/build/bin/release:Z kubepkg-debian-10


NOTE: <arch> can be amd64,arm,arm64,ppc64le,s390x
