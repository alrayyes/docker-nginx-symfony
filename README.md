docker image for nginx + php5-fpm + cron

Forked from
mbentley/nginx-php5,
added cron, purged unused soft, nginx installed from repo


`docker run -i -t -p 80 -v /data/logs:/var/log/nginx -v /data/www:/var/www -v /shared/cron.d:/etc/cron.d/ korjavin/docker-nginx-php5`

