FROM korjavin/korjavin-base

RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y dnsutils netcat libssl-dev php5-curl php5-gd php5-fpm php5-mcrypt php5-mysql php5-snmp php5-memcache ssmtp supervisor whois nginx-full cron

RUN mkdir -p /var/lib/nginx /etc/nginx/sites-enabled /etc/nginx/sites-available /var/www

ADD nginx.conf /etc/nginx/nginx.conf
ADD default /etc/nginx/sites-available/default
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php5/fpm/php-fpm.conf
RUN sed -i 's/post_max_size = 8M/post_max_size = 16M/g' /etc/php5/fpm/php.ini
RUN sed -i 's/upload_max_filesize = 2M/upload_max_filesize = 16M/g' /etc/php5/fpm/php.ini

EXPOSE 80
VOLUME ["/var/www"]

CMD ["/usr/bin/supervisord","-c","/etc/supervisor/supervisord.conf"]
