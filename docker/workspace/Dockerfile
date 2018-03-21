FROM ubuntu:xenial

RUN apt-get update \
 && apt-get install -y language-pack-en-base \
 && apt-get install -y --allow-unauthenticated software-properties-common \
 && LC_ALL=en_US.UTF-8 add-apt-repository ppa:ondrej/php \
 && apt-get update \
 && apt-get upgrade -y --allow-unauthenticated \
 && apt-get install -y --allow-unauthenticated \
     git \
     mysql-client \
     openssh-server \
     curl \
     cron \
     nano \
     zip \
     unzip \
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

# for sylius
#RUN { \
#		echo 'date.timezone=UTC'; \
#	} > /etc/php/7.1/mods-available/additional.ini


# Install the composer
RUN curl -sS https://getcomposer.org/installer | \
    php -- --install-dir=/usr/local/bin --filename=composer

# RUN curl -LsS https://symfony.com/installer -o /usr/local/bin/symfony
# RUN chmod a+x /usr/local/bin/symfony

# Install the phpunit
RUN wget https://phar.phpunit.de/phpunit-6.0.phar
RUN chmod +x phpunit-6.0.phar
RUN mv phpunit-6.0.phar /usr/local/bin/phpunit

WORKDIR /var/www/html
