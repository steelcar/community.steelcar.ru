FROM redis:3.2-alpine

ADD redis.conf  /etc/redis.conf

CMD redis-server /etc/redis.conf --requirepass ${REDIS_PASS}
