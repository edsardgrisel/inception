# syntax=docker/dockerfile:1

FROM debian:bookworm-slim



RUN apt-get update && apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY secrets/server.crt /etc/nginx/server.crt
COPY secrets/server.unencrypted.key /etc/nginx/secrets/server.unencrypted.key

CMD ["nginx", "-g", "daemon off;"]