FROM multiarch/alpine:armhf-latest-stable

ARG VERSION=1.35.0

RUN apk add --no-cache --update aria2 && \
    mkdir -p /conf && \
    mkdir -p /downloads && \
    addgroup -g 2000 aria && \
    adduser -S -h /conf -s /bin/false -u 2000 -G aria aria && \
    touch /tmp/session.txt && \
    chown aria:aria /tmp/session.txt

USER aria

CMD ["aria2c", "--conf-path=/conf/aria2.conf"]

LABEL org.label-schema.name="Aria2" \
      org.label-schema.version=${VERSION} \
      org.label-schema.docker.schema-version="1.0"
