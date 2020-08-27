FROM golang:1.15-buster AS kubepkg
ENV BUILD_PATH /build
ENV KUBEPKG_VERSION v0.4.0
RUN mkdir -p $BUILD_PATH && chmod -R 777 "$BUILD_PATH"
WORKDIR $BUILD_PATH
RUN git clone --quiet --branch $KUBEPKG_VERSION https://github.com/kubernetes/release.git $BUILD_PATH && \ 
		GOOS=linux go build -a -o kubepkg $BUILD_PATH/cmd/kubepkg && \
		cd $BUILD_PATH/cmd/kubepkg && \
		tar cvf templates.tar ./templates && \
		mv templates.tar ${BUILD_PATH}

FROM ubuntu:18.04
ENV DEBIAN_FRONTEND noninteractive
COPY --from=kubepkg /build/kubepkg /usr/local/bin/
ENV ARCH amd64 # default
ENV BUILD_PATH /build
ENV KUBEPKG_VERSION v0.4.0
RUN mkdir -p $BUILD_PATH && chmod -R 777 "$BUILD_PATH"
COPY --from=kubepkg /build/templates.tar ${BUILD_PATH}
WORKDIR ${BUILD_PATH}
RUN tar xvf templates.tar && \
    rm templates.tar && \
    apt-get update && apt-get install -y git dpkg-dev debhelper dh-systemd
CMD ["sh", "-c", "kubepkg debs --channels release --arch ${ARCH}"]
