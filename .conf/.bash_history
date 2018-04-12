composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .
find . -type f -exec chmod 644 {} \;     && find . -type d -exec chmod 755 {} \;     && chmod -R 777 ./var ./pub ./generated     && chown -R :www-data .     && chmod u+x ./bin/magento    && chgrp -R www-data ./app
composer create-project opencart/opencart .
find . -type f -exec chmod 644 {} \;     && find . -type d -exec chmod 755 {} \;     && chown -R www-data:www-data .
mv ./upload/config-dist.php ./upload/config.php    && mv ./upload/admin/config-dist.php ./upload/admin/config.php
curl -o wordpress.tar.gz -fSL "https://wordpress.org/wordpress-latest.tar.gz";
tar -xzf wordpress.tar.gz -C .
rm wordpress.tar.gz;
chown -R www-data:www-data .
composer create-project sylius/sylius-standard .
php bin/console sylius:install
chown -R www-data:www-data .
ls -a
composer create-project openmage/magento-lts .
composer create-project openmage/magento-lts=1.9.3.4 .
ls -a
git clone https://github.com/OpenMage/magento-lts.git --depth 1 .
cd ..
ls -a
cd magento2.local/
ls -a
cd html/
exit
ls -a
git clone https://github.com/OpenMage/magento-lts.git --depth 1 .
chown -R www-data:www-data .     && chmod -R o+r .     && chmod -R g+w .     && find . -type d -exec chmod g+s {} \;
