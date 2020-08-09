FROM php: 5.6-apache

COPY pup.ini /usr/local/etc/php/
RUN apt-get update
RUN apt-get install -y libfreetype6-dev libjpeg62-turbo-dev libpng12-dev libmcrypt-dev mysql-client 
RUN docker-php-ext-install pdo_mysql mysqli gd iconv
RUN docker-php-ext-install mbstring
RUN docker-php-ext-install mcrypt

COPY ./fetch.com.conf /etc/apache2/sites-available/
COPY ./hosts /etc/hosts

RUN a2enmod rewrite
RUN a2enmod mcrypt
RUN service apache2 restart

WORKDIR /etc/apache2/sites-available/
RUN a2ensite fetch.com.conf

EXPOSE 80