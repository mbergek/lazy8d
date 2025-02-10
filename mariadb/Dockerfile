# Use the official MariaDB 10.2 image as the base (equivalent to MySQL 5.7)
FROM mariadb:10.2

# Copy custom MySQL configuration file to the container
COPY mariadb/my.cnf /etc/mysql/conf.d/

# Ensure the configuration file has the correct permissions
RUN chmod 644 /etc/mysql/conf.d/my.cnf

# Set environment variables for MySQL root user credentials and database initialization
#ENV MYSQL_ROOT_PASSWORD=root
ENV MYSQL_ROOT_PASSWORD=
ENV MYSQL_DATABASE=lazy8
ENV MYSQL_USER=lazy8
ENV MYSQL_PASSWORD=lazy8
ENV MARIADB_ALLOW_EMPTY_ROOT_PASSWORD=1

# Expose the default MySQL port
EXPOSE 3306
