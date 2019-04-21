FROM homeassistant/home-assistant

# set version for s6 overlay
ARG OVERLAY_VERSION="v1.22.1.0"
ARG OVERLAY_ARCH="amd64"

ADD https://github.com/just-containers/s6-overlay/releases/download/${OVERLAY_VERSION}/s6-overlay-${OVERLAY_ARCH}.tar.gz /tmp/
RUN tar xzf /tmp/s6-overlay-amd64.tar.gz -C / && rm /tmp/s6-overlay-amd64.tar.gz

RUN useradd abc
RUN apt-get update && apt-get install -y \
    vim \
    socat && \
    pip install pymssql

ADD rootfs/ /
ENTRYPOINT ["/init"]
