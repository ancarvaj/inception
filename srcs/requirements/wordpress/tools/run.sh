#!/bin/sh
set -e

PHP_CONFIG="/var/www/html/wp-config.php"

if [ ! -f /var/www/html/wp-settings.php ]; then
    wget https://wordpress.org/latest.tar.gz
    tar -xzvf latest.tar.gz
    rm latest.tar.gz
    mkdir -p /var/www/html
    cp -r ./wordpress/. /var/www/html/
    rm -rf ./wordpress
fi

cp /var/www/html/wp-config-sample.php "${PHP_CONFIG}"

sed -i "s/database_name_here/$WORDPRESS_DB_NAME/" "${PHP_CONFIG}"
sed -i "s/username_here/$WORDPRESS_DB_USER/" "${PHP_CONFIG}"
sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/" "${PHP_CONFIG}"
sed -i "s/localhost/$WORDPRESS_DB_HOST/" "${PHP_CONFIG}"


exec "$@"
