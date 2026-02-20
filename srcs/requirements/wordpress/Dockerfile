# syntax=docker/dockerfile:1

FROM debian:bookworm-slim

RUN apt-get update && apt-get install php-mysql mariadb-client php8.2-fpm curl  -y

COPY tools/run_wordpress.sh /etc/wordpress/run_wordpress.sh

RUN chmod +x /etc/wordpress/run_wordpress.sh


CMD ["/etc/wordpress/run_wordpress.sh"]

