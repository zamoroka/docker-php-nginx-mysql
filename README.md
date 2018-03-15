#### init containers
```
cd docker
docker-compose up -d
```

#### get into the work container 
```
docker exec -it php bash
```

#### install magento 2
```
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .

# set permissions
find . -type f -exec chmod 644 {} \; \
    && find . -type d -exec chmod 755 {} \; \
    && chmod -R 777 ./var ./pub ./generated \
    && chown -R www-data:www-data . \
    && chmod u+x ./bin/magento \
    && chgrp -R www-data ./app
```

#### install opencart
```
composer create-project opencart/opencart . \
    && mv ./upload/config-dist.php ./upload/config.php \
    && mv ./upload/admin/config-dist.php ./upload/admin/config.php

# set permissions
find . -type f -exec chmod 644 {} \; \
    && find . -type d -exec chmod 755 {} \; \
    && chown -R www-data:www-data .
```

#### install wordpress
```
curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-latest.tar.gz"; \
    && tar -xzf wordpress.tar.gz -C . \
    && mv wordpress/* . \
    && rm wordpress.tar.gz \
    && rm -R wordpress
    
# set permissions 
chown -R www-data:www-data .
```

#### install wordpress
```
composer create-project sylius/sylius-standard .

# set parameters: 
#     env(SYLIUS_DATABASE_DRIVER): pdo_mysql
#     env(SYLIUS_DATABASE_HOST): mysql
#     env(SYLIUS_DATABASE_PORT): 3306
#     env(SYLIUS_DATABASE_NAME): test
#     env(SYLIUS_DATABASE_USER): root
#     env(SYLIUS_DATABASE_PASSWORD): root

php bin/console sylius:install

    
# set permissions 
chown -R www-data:www-data .
```
