#!/usr/bin/env bash
set -Eeo pipefail

if [ -n "$WALLARM_MODE" ]; then
  sed -i -e "s|wallarm_mode monitoring|wallarm_mode $WALLARM_MODE|g" /etc/nginx/conf.d/default.conf
fi

if [ -n "$WALLARM_API_HOST" ]; then
  args="$args -H $WALLARM_API_HOST"
fi
if [ -n "$TARANTOOL_MEMORY_GB" ]; then
  sed -i -e "s|SLAB_ALLOC_ARENA=0.2|SLAB_ALLOC_ARENA=$TARANTOOL_MEMORY_GB|g" /opt/wallarm/env.list
fi

/opt/wallarm/register-node $args
/opt/wallarm/supervisord.sh &
/wait-for-it.sh -t 60 127.0.0.1:3313

exec "$@"
