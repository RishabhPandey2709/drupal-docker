FROM ubuntu:latest
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get clean && apt-get update && apt-get upgrade -y
#RUN apt-get update \
    #&& DEBIAN_FRONTEND=noninteractive apt-get -y 

RUN apt-get install apache2 -y
COPY apache2-config.conf /etc/apache2/sites-enabled/000-default.conf


RUN apt-get install php -y 

RUN apt-get install libapache2-mod-php  -y
RUN rm /var/www/html/index.html
COPY drupal/drupal-8.3.5  /var/www/html/

EXPOSE 80
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/apache2ctl"]
