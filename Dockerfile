FROM alpine:latest

ARG HOSTNAME
ARG BUCKET_PATH
ARG ACCESS_GRANT
ARG LINKSHARE_URL "https://link.storjshare.io"

RUN apk add curl unzip
RUN curl -L https://github.com/storj/storj/releases/latest/download/uplink_linux_amd64.zip \
        -o uplink_linux_amd64.zip \
        && unzip -o uplink_linux_amd64.zip
RUN install uplink /usr/local/bin/uplink

RUN uplink access import main ${ACCESS_GRANT} -y
RUN uplink share \
        --dns ${HOSTNAME} sj://${BUCKET_PATH} \
        --base-url ${LINKSHARE_URL} \
        --not-after=none > zones.txt

ENTRYPOINT [ "tail", "-f", "zones.txt" ]