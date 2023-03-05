FROM nginx:stable-alpine

ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

RUN mkdir -p /var/www/html/public

ADD nginx/default.prod.conf /etc/nginx/conf.d/default.conf

ADD nginx/certs/laravel-inertia-vuejs-dockerized.test.pem /etc/nginx/certs/laravel-inertia-vuejs-dockerized.test.pem
ADD nginx/certs/laravel-inertia-vuejs-dockerized.test-key.pem /etc/nginx/certs/laravel-inertia-vuejs-dockerized.test-key.pem

RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN adduser -g laravel -s /bin/sh -D ${NGINXUSER}