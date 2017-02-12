FROM debian:sid

RUN apt-get update && apt-get install -y wget unzip apache2 libapache2-mod-php php-mysql php-gd mysql-client && rm -rf /var/lib/apt/lists/* && apt-get clean
RUN wget https://launchpad.net/webtrees/1.7/1.7.9/+download/webtrees-1.7.9.zip && unzip webtrees-1.7.9.zip && mv webtrees /var/www && rm -rf webtrees-1.7.9.zip

RUN echo '<VirtualHost *:80>' > /etc/apache2/conf-enabled/webtrees.conf
RUN echo '  DocumentRoot "/var/www/webtrees"' >> /etc/apache2/conf-enabled/webtrees.conf
RUN echo '</VirtualHost>' >> /etc/apache2/conf-enabled/webtrees.conf

RUN mkdir -p /var/www/webtrees/data
RUN chown www-data:www-data -R /var/www/webtrees/data

ENV APACHE_RUN_USER=www-data
ENV APACHE_PID_FILE=/var/run/apache2.pid
ENV APACHE_RUN_GROUP=www-data
ENV APACHE_LOG_DIR=/var/log/apache2
ADD startup.sh /usr/local/bin/startup.sh
RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 80 443

ENTRYPOINT /usr/local/bin/startup.sh
