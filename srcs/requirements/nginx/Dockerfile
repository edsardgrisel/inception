# syntax=docker/dockerfile:1

FROM debian:bookworm-slim



RUN apt-get update && apt-get install -y nginx

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY secrets/server.crt /etc/nginx/server.crt
COPY secrets/server.decrypted.key /etc/nginx/secrets/server.decrypted.key
COPY index.html /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]