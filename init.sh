#!/bin/sh

service nginx start
service php5-fpm start

while true; do sleep 1d; done
