# syntax=docker/dockerfile:1

FROM debian:bookworm-slim


RUN apt-get update && apt-get install mariadb-server -y

# RUN rm /etc/mariadb/run_mariadb.sh

COPY tools/run_mariadb.sh /etc/mariadb/run_mariadb.sh

RUN chmod +x /etc/mariadb/run_mariadb.sh


# RUN sudo mariadb-secure-installation





CMD ["/etc/mariadb/run_mariadb.sh"]

