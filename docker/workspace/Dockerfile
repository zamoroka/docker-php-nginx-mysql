FROM ubuntu:xenial

RUN apt-get update \
    && apt-get install -y  --no-install-recommends \
        apt-transport-https \
        ca-certificates \
        git \
        curl \
        nano \
        zip \
        unzip \
    && apt-get install -y language-pack-en-base \
    && apt-get install -y --allow-unauthenticated software-properties-common \
    && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php


# for sylius
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
 && apt-get upgrade -y --allow-unauthenticated \
 && apt-get install -y --allow-unauthenticated \
     mysql-client \
     openssh-server \
     cron \
     libmemcached-dev \
     libz-dev \
     libpq-dev \
     libjpeg-dev \
     libpng-dev \
     libfreetype6-dev \
     libssl-dev \
     libmcrypt-dev \
     libxml2-dev \
     libicu-dev \
     libxslt-dev \
     yarn \
     nodejs-legacy \
     php7.1 \
     php7.1-cgi \
     php7.1-fpm \
     php7.1-xml \
     php7.1-gd \
     php7.1-soap \
     php7.1-intl \
     php7.1-mbstring \
     php7.1-mcrypt \
     php7.1-mysql \
     php7.1-mysqli \
     php7.1-zip \
     php7.1-xsl \
     php7.1-json \
     php7.1-opcache \
     php7.1-curl \
     php7.1-bcmath \
     php7.1-exif \
     php-xdebug \
    && rm -rf /var/lib/apt/lists/*

# Install the composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

# RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
# RUN chmod a+x /usr/local/bin/symfony

# Install the phpunit
RUN wget https://phar.phpunit.de/phpunit-6.0.phar
RUN chmod +x phpunit-6.0.phar
RUN mv phpunit-6.0.phar /usr/local/bin/phpunit

# for sylius
RUN { \
		echo 'date.timezone=UTC'; \
	} > /etc/php/7.1/cli/conf.d/additional.ini

RUN mkdir /var/www

# set permissions
RUN chown -R www-data:www-data /var/www \
    && chmod -R o+r /var/www \
    && chmod -R g+w /var/www \
    && find /var/www -type d -exec chmod g+s {} \;

WORKDIR /var/www/html
