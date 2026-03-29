#!/bin/sh
set -eu

if [ "$#" -eq 0 ]; then
  exec /opt/ArduDeck/@ardudeckdesktop
fi

exec "$@"