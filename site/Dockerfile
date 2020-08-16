FROM php:5.6-apache

RUN apt-get update
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev mysql-client 
RUN docker-php-ext-install pdo_mysql mysqli gd iconv
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mcrypt

RUN echo ServerName localhost >> /etc/apache2/apache2.conf

COPY ./ /var/www/html 

EXPOSE 80