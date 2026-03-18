#!/bin/sh
set -e

mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql

if [ ! -d "/var/lib/mysql/mysql" ]; then
    echo "Iniciando instalación de tablas base de MariaDB..."
    mysql_install_db --user=mysql --datadir=/var/lib/mysql --rpm > /dev/null

    echo "Configurando usuarios y privilegios iniciales..."
    
    /usr/bin/mariadbd --user=mysql --bootstrap <<EOF
USE mysql;
FLUSH PRIVILEGES;

-- Configurar contraseña de root para localhost y red
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION;

-- Crear base de datos de WordPress
CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;

-- Crear usuario administrador de la base de datos
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';

-- Limpieza de seguridad
DELETE FROM mysql.user WHERE user='';
DROP DATABASE IF EXISTS test;

FLUSH PRIVILEGES;
EOF
fi

exec "$@"
