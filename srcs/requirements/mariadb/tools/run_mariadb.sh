#!/bin/bash

mkdir -p /run/mysqld

chown -R mysql:mysql /run/mysqld

# Listen to all ports to be able to receive wordpress requests
echo "bind-address=0.0.0.0" >> /etc/mysql/mariadb.conf.d/50-server.cnf

# Run mariadb as child process
mariadbd --user=mysql --skip-networking & pid="$!"

# Wait for child process db to start up

timeout=60
elapsed_time=0
until mariadb -u root -e "SELECT 1;" &>/dev/null; do
	if [ "$elapsed_time" -gt "$timeout" ]; then
		echo "Error: DB didn't start within timeout of $timeout seconds"
		kill "$pid"
		exit 1
	fi
	
	echo "Waiting for db to start up... ($elapsed_time s/$timeout s)"
	elapsed_time=$((elapsed_time + 1))
	sleep 1
done

# setup db
cat > db1.sql <<EOF
	CREATE DATABASE IF NOT EXISTS $DB_NAME;
	CREATE USER '$DB_ADMIN_USER'@'%' IDENTIFIED BY '$DB_ADMIN_PASS';
	GRANT ALL PRIVILEGES ON *.* TO '$DB_ADMIN_USER'@'%' WITH GRANT OPTION;
	CREATE USER '$DB_SECOND_USER'@'%' IDENTIFIED BY '$DB_SECOND_PASS';
	FLUSH PRIVILEGES;
EOF

mariadb -u root -p"" < db1.sql

kill "$pid"
wait "$pid"


exec mariadbd --user=mysql