FROM arm32v7/debian:9-slim

ARG BUILD_DATE
ARG VERSION

RUN apt update && \
    apt upgrade -y && \
    apt install -y --no-install-recommends aria2=${VERSION} ca-certificates && \
    rm -rf /var/lib/apt/lists/* /var/cache/* /var/log/* /root/* && \
    mkdir -p /conf && \
    mkdir -p /download && \
    useradd -U -d /config -s /bin/false -u 2000 aria && \
    usermod -G users aria

USER aria

CMD ["aria2c", "--conf-path=/conf/aria2.conf"]

LABEL org.label-schema.name="Aria2" \
      org.label-schema.version=${VERSION} \
      org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.docker.schema-version="1.0"
