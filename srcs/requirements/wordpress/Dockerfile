# syntax=docker/dockerfile:1

FROM debian:bookworm-slim



RUN apt-get update && apt-get install php7.3-fpm

COPY index.html /var/www/html/index.html

CMD ["nginx", "-g", "daemon off;"]