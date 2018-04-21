#!/usr/bin/env sh
set -e

chown -R nginx:nginx /data/nginx

exec "$@"
