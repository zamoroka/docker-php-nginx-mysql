composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition .
find . -type f -exec chmod 644 {} \;     && find . -type d -exec chmod 755 {} \;     && chmod -R 777 ./var ./pub ./generated     && chown -R :www-data .     && chmod u+x ./bin/magento    && chgrp -R www-data ./app
