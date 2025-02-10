# Lazy8 Docker

This project sets up a containerised version of the bookkeeping solution Lazy8 consisting of:

- Nginx 1.27.3
- PHP 7.2.34
- MariaDB 10.2
- PHPMyAdmin (optional)

The web/PHP environment includes the actual Lazy8 web application and its bundled Yii (1.1.1) framework.

## Installation

The file config/main.php is pre-configured and does not require any changes. It will be copied to the containerised environment as part of the installation.

Any files with a .sql file extension in the config directory will be used to restore the database as part of the installation.

Installation is performed by running the install script:

    ./install.sh

All docker containers and images can be removed by running the uninstallation script:

    ./uninstall.sh

Uninstallation does not remove the volume holding the actual database. However, please be aware that reinstallation will drop the existing database.

Access the Lazy8 web site on http://localhost:8090

## Security notice

Nginx is published on non-standard port 8090 and MariaDB is published on non-standard port 33306. Both are only bound to the local interface to prevent remote clients from accessing those services. The Nginx instance should be proxied by an SSL-enabled web proxy running on the host.

PHPMyAdmin can be enabled by removing the comments in the docker compose file and is, if so, published on port 8091 and it to is only bound to the local interface. It is not intended for production environments but rather to assist during development.

The default username and password for Lazy8 is admin/admin. This must be changed before the service is exposed to the Internet.

## Scripted access to the database server

The following example is for accessing the database server from a Ruby script. Since the web framework used depends on a rather old version of MySQL/MariaDB the latest MySQL client libraries can't be used due to missing support for a authentication against the database. The following is a set of commands as a starting point for Mac environments  (verified on macOS Ventura 13.7.2 using Ruby 2.5.3).

    brew install mysql@8.4
    brew install mysql-client@8.4
    
    echo 'export PATH="/usr/local/opt/mysql@8.4/bin:$PATH"' >> ~/.bash_profile
    export LDFLAGS="-L/usr/local/opt/mysql@8.4/lib"
    export CPPFLAGS="-I/usr/local/opt/mysql@8.4/include"
    export PKG_CONFIG_PATH="/usr/local/opt/mysql@8.4/lib/pkgconfig"
    
    gem install mysql2 -- --with-mysql-config=/usr/local/opt/mysql-client\@8.4/bin/mysql_config

A test script is included in this project. In addition to the above Ruby gem, it depends on the Active Support and Optparse gems being installed:

    gem install activesupport -v '5.1.6.2'
    gem install optparse
