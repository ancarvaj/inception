apk update
apk add php83 \
        php83-fpm \
        php83-mysqli \
        php83-json \
        php83-openssl \
        php83-curl \
        php83-zlib \
        php83-xml \
        php83-phar \
        php83-intl \
        php83-dom \
        php83-xmlreader \
        php83-ctype \
        php83-session \
        php83-mbstring \
        php83-gd \
        wget tar

sed -i 's/listen = 127.0.0.1:9000/listen = 0.0.0.0:9000/' /etc/php83/php-fpm.d/www.conf
