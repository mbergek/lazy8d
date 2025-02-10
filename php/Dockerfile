# Use prebuilt PHP 7.2 and Nginx images
FROM php:7.2-fpm-alpine

RUN docker-php-ext-install mbstring pdo pdo_mysql bcmath

COPY php/php.ini /usr/local/etc/php/conf.d/php.override.ini
COPY php/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/lazy8/assets && \
    mkdir -p /var/www/html/lazy8/protected/runtime && \
    mkdir -p /var/www/html/lazy8/protected/config && \
    chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html

#RUN chmod -R 444 /var/www/html/lazy8/protected/config/main.php

# Expose HTTP port
# EXPOSE 80