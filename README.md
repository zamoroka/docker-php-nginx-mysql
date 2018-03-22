### containers
```
# init
cd docker
docker-compose up -d

# get into the work container 
docker exec -it magento_workspace bash

# create database
docker exec -it mysql /bin/sh -c "echo 'create database magento2;' | mysql -uroot -proot"
```

### permissions
```
chown -R www-data:www-data . \
    && chmod -R o+r . \
    && chmod -R g+w . \
    && find . -type d -exec chmod g+s {} \;
```

#### install magento 2
```
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition . \
    && composer clearcache
```

#### install opencart
```
composer create-project opencart/opencart . \
    && mv ./upload/config-dist.php ./upload/config.php \
    && mv ./upload/admin/config-dist.php ./upload/admin/config.php \
    && composer clearcache
```

#### install wordpress
```
git clone https://github.com/WordPress/WordPress.git --depth 1 .
```

#### install prestashop
```
git clone https://github.com/PrestaShop/PrestaShop.git --depth 1 . \
    && composer install \
    && composer clearcache
```

#### install sylius
```
composer create-project sylius/sylius-standard . \
    && composer clearcache

# set parameters: 
#     env(SYLIUS_DATABASE_DRIVER): pdo_mysql
#     env(SYLIUS_DATABASE_HOST): mysql
#     env(SYLIUS_DATABASE_PORT): 3306
#     env(SYLIUS_DATABASE_NAME): sylius
#     env(SYLIUS_DATABASE_USER): root
#     env(SYLIUS_DATABASE_PASSWORD): root

php bin/console sylius:install -e prod \
    && yarn install \
    && yarn run gulp
```
