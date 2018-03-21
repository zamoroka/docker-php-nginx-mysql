FROM php:7.1-fpm

# install packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    mysql-client \
    curl \
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
  && rm -rf /var/lib/apt/lists/*

# Install the PHP extentions
RUN docker-php-ext-install mcrypt \
  && docker-php-ext-install pdo_mysql \
  && docker-php-ext-install mysqli \
  && docker-php-ext-install opcache \
  && docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-jpeg-dir=/usr/lib \
    --with-freetype-dir=/usr/include/freetype2 \
  && docker-php-ext-install gd \
  && docker-php-ext-install intl \
  && docker-php-ext-install xsl \
  && docker-php-ext-install zip \
  && docker-php-ext-install soap \
  && docker-php-ext-install exif \
  && docker-php-ext-install pcntl

# PHP configs
RUN { \
		echo 'date.timezone=UTC'; \
	} > /usr/local/etc/php/conf.d/additional.ini

RUN { \
		echo 'opcache.memory_consumption=128'; \
		echo 'opcache.interned_strings_buffer=8'; \
		echo 'opcache.max_accelerated_files=4000'; \
		echo 'opcache.revalidate_freq=2'; \
		echo 'opcache.fast_shutdown=1'; \
		echo 'opcache.enable_cli=1'; \
	} > /usr/local/etc/php/conf.d/opcache-recommended.ini
