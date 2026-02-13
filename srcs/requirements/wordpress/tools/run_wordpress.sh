#!/bin/bash

# Setup wp https://make.wordpress.org/cli/handbook/guides/installing/
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp --info

# Download wp https://developer.wordpress.org/cli/commands/core/download/
wp core download --locale=nl_NL --allow-root

# Create config file https://developer.wordpress.org/cli/commands/config/create/
wp config create --dbname=$WP_DB_NAME --dbuser=$WP_DB_USER --dbpass=$WP_DB_USER_PASSWORD --allow-root 



# Install wp https://developer.wordpress.org/cli/commands/core/install/
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_USER --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root


# Create second user https://developer.wordpress.org/cli/commands/user/create/
wp user create $WP_ADDITIONAL_USER  $WP_ADDITIONAL_USER_EMAIL --user-pass=$WP_ADDITIONAL_USER_PASSWORD --role=author --allow-root


# chmod +x wp-cli.phar
# dpkg -L php-fpm
# which php-fpm
# /usr/sbin/php-fpm -F