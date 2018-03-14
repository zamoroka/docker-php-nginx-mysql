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
```

#### set permissions for Magento 2
```
find . -type f -exec chmod 644 {} \; \
    && find . -type d -exec chmod 755 {} \; \
    && chmod -R 777 ./var ./pub ./generated \
    && chown -R www-data:www-data . \
    && chmod u+x ./bin/magento \
    && chgrp -R www-data ./app
```

#### install opencart
```
composer create-project opencart/opencart .

mv ./upload/config-dist.php ./upload/config.php
mv ./upload/admin/config-dist.php ./upload/admin/config.php
```

#### set permissions for opencart
```
find . -type f -exec chmod 644 {} \; \
    && find . -type d -exec chmod 755 {} \; \
    && chown -R www-data:www-data .
```
