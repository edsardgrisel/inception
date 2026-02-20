#!/bin/bash

# Setup wp https://make.wordpress.org/cli/handbook/guides/installing/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

echo -e "\n\n"


# sleep 5

until mariadb -h "$DB_HOST" -u "$DB_ADMIN_USER" -p"$DB_ADMIN_PASS" -e "SHOW DATABASES;" &>/dev/null; do
	echo "Waiting for db to start up..."
	sleep 1
done

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp --info

cd /var/www/html

rm -rf *

# Download wp https://developer.wordpress.org/cli/commands/core/download/
wp core download --locale=en_US --allow-root

# Create config file https://developer.wordpress.org/cli/commands/config/create/
# wp config create \
#   --dbname="$DB_NAME" \
#   --dbuser="$DB_ADMIN_USER" \
#   --dbpass="$DB_ADMIN_PASS" \
#   --dbhost="$DB_HOST" \
#   --allow-root

# Replace wp-config-sample.php with wp-config.php and fill in credentials
sed \
	-e "s/database_name_here/$DB_NAME/" \
	-e "s/username_here/$DB_ADMIN_USER/" \
	-e "s/password_here/$DB_ADMIN_PASS/" \
	-e "s/localhost/$DB_HOST/" \
	wp-config-sample.php > wp-config.php


# Install wp https://developer.wordpress.org/cli/commands/core/install/
wp core install \
	--url=$WP_URL \
	--title=$WP_TITLE \
	--admin_user=$WP_ADMIN_USER \
	--admin_password=$WP_ADMIN_PASSWORD \
	--admin_email=$WP_ADMIN_EMAIL \
	--allow-root


# Create second user https://developer.wordpress.org/cli/commands/user/create/
wp user get $WP_ADDITIONAL_USER --allow-root &>/dev/null || \
wp user create \
	$WP_ADDITIONAL_USER \
	$WP_ADDITIONAL_USER_EMAIL \
	--user_pass=$WP_ADDITIONAL_USER_PASSWORD \
	--role=author \
	--allow-root


dpkg -L php-fpm
which php-fpm
/usr/bin/php-fpm -F