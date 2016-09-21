FROM docker.io/debian:jessie-backports

ENV TZ "Asia/Shanghai"
ENV TERM xterm

ADD source.list /etc/apt/source.list

RUN apt-get update

RUN apt -y install nginx php5-fpm php5-mysql
RUN apt -y install vim.tiny

RUN rm /etc/nginx/sites-enabled/*

ADD nginx.conf /etc/nginx/
ADD default /etc/nginx/sites-enabled/main-site
ADD php.ini /etc/php/fpm/php.ini
ADD www.conf /etc/php5/fpm/pool.d/www.conf
ADD init.sh /

RUN mkdir -p /opt/wordpress1/www
ADD www /opt/wordpress1/www
RUN chown www-data:www-data -R /opt/wordpress1/www

EXPOSE 80 8000

CMD ["/init.sh"]
