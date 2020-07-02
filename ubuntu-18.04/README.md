## How to build DEB packages?

1. `[docker|podman] build -t kubepkg-ubuntu-18.04 .`
2. `mkdir packages && [docker|podman] run --env ARCH=[amd64|arm|arm64|ppc64le|s390x] -v $PWD/packages:/build/bin/release:Z kubepkg-ubuntu-18.04`
