## How to build debian packages?

### With docker

1. docker build -t kubepkg .
2. mkdir packages && docker run -v ./packages:/build/bin/release kubepkg

### With podman

1. podman build -t kubepkg .
2. mkdir packages && podman run -v ./packages:/build/bin/release:Z kubepkg
