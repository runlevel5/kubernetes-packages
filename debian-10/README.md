## How to build debian packages?

### With docker

1. docker build -t kubepkg .
2. mkdir packages && docker run --env ARCH=<arch> -v ./packages:/build/bin/release kubepkg

### With podman

1. podman build -t kubepkg .
2. mkdir packages && podman run --env ARCH=<arch> -v ./packages:/build/bin/release:Z kubepkg


NOTE: <arch> can be amd64,arm,arm64,ppc64le,s390x
