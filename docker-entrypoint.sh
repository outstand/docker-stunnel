#!/bin/sh
set -e

# first arg is `-f` or `--some-option`
if [ "${1#-}" != "$1" ]; then
  set -- stunnel "$@"
fi

if [ "$1" = 'stunnel' ]; then
  if [ -z "$CONSUL_HOST" ]; then
    echo 'Unable to find CONSUL_HOST in environment!'
    exit 1
  fi

  if [ -z "$CONSUL_PREFIX" ]; then
    echo 'Unable to find CONSUL_PREFIX in environment!'
    exit 1
  fi

  fsconsul -addr ${CONSUL_HOST}:8500 -once ${CONSUL_PREFIX} /etc/stunnel
fi

exec "$@"
