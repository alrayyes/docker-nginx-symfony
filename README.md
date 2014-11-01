docker image for nginx, php5-fpm and symfony 1.4

Forked from
mbentley/nginx-php5

- purged unused soft
- nginx installed from repo
- modified sites-enabled/default


`docker run -p 80:80 -v /data/logs:/var/log/nginx -v /data/www:/var/www --link mysql:mysql korjavin/docker-nginx-php5`

