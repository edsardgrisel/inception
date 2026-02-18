#!/bin/bash

mkdir -p /run/mysqld

chown -R mysql:mysql /run/mysqld

# Listen to all ports to be able to receive wordpress requests
echo "bind-address=0.0.0.0" >> /etc/mysql/my.cnf

mariadbd --user=mysql


mariadb -u root -p "$DB_ROOT_PASSWORD" -e \
	" \
	CREATE DATABASE IF NOT EXISTS $DB_NAME; \
	CREATE USER '$DB_ADMIN_USER'@'%' IDENTIFIED BY '$DB_ADMIN_PASS'; \
	GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN_USER'@'%' WITH GRANT OPTION; \
	FLUSH PRIVILEGES; \
	"
