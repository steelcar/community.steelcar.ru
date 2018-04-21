FROM nginx:1.13.6-alpine

ADD nginx.conf      /etc/nginx/nginx.conf
ADD default.conf    /etc/nginx/conf.d/default.conf

COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["nginx", "-g", "daemon off;"]
