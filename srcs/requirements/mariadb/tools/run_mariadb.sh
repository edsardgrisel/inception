#!/bin/bash

mkdir -p /run/mysqld

chown -R mysql:mysql /run/mysqld

mariadbd --user=mysql

mariadb -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER '$DB_ADMIN_USER'@'%' IDENTIFIED BY '$DB_ADMIN_PASS'; GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN_USER'@'%' WITH GRANT OPTION; FLUSH PRIVILEGES;"
