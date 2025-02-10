#!/bin/bash

# Exit if there is already a webroot folder to avoid overwriting an existing version
if [ -d "www" ]; then
    exit 1
fi

# Create directories
mkdir -p www/{lazy8,yii}
mkdir -p dist/{lazy8,yii}
mkdir -p www/lazy8/assets
mkdir -p www/lazy8/protected/{runtime,config}

cp config/main.php www/lazy8/protected/config/

# Lazy8
if [ ! -f dist/lazy8/v1.07.tar.gz ]; then
    wget -P dist/lazy8 https://github.com/mbergek/lazy8/archive/refs/tags/v1.07.tar.gz
fi
tar -xzf dist/lazy8/v1.07.tar.gz -C www/lazy8 --strip-components=1

# Yii
if [ ! -f dist/yii/1.1.1.tar.gz ]; then
    wget -P dist/yii https://github.com/yiisoft/yii/archive/refs/tags/1.1.1.tar.gz
fi
tar -xzf dist/yii/1.1.1.tar.gz -C www/yii --strip-components=1

# Bring up the containers
docker compose up -d --wait

# Restore database
# Use the docker container to avoid relying on a host client that would most
# likely be incompatible with the older MariaDB instance
cat config/*.sql | \
    docker run -i --rm --network lazy8d_internal lazy8d-mariadb \
    mysql -h mariadb -u root lazy8 

# Show logs
docker compose logs -f
