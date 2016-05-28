FROM alpine:3.3
MAINTAINER Ryan Schlesinger <ryan@outstand.com>

RUN addgroup stunnel \
    && adduser -S -G stunnel stunnel

RUN echo "http://dl-3.alpinelinux.org/alpine/edge/testing/" >> /etc/apk/repositories && \
  apk add --no-cache \
    stunnel && \
  rm -f /etc/stunnel/stunnel.conf /etc/stunnel/stunnel.conf-sample

COPY fsconsul /bin/fsconsul

COPY docker-entrypoint.sh /docker-entrypoint.sh
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["stunnel"]
