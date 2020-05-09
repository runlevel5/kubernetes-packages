FROM golang:1.14-buster

ENV DEBIAN_FRONTEND noninteractive

ENV ARCH amd64 # default
ENV BUILD_PATH /build
RUN mkdir -p $BUILD_PATH && chmod -R 777 "$BUILD_PATH"
WORKDIR $BUILD_PATH

RUN apt-get update && apt-get install -y git dpkg-dev debhelper dh-systemd && \
    git clone https://github.com/kubernetes/release.git /tmp/release && mv /tmp/release/cmd/kubepkg/templates $BUILD_PATH && \ 
    cd /tmp/release/cmd/kubepkg && go install ./... && rm -rf /tmp/release

# Packages would be placed in /build/bin/release folder
CMD ["sh", "-c", "kubepkg debs --channels release --arch ${ARCH}"]
