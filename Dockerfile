FROM centos:latest

MAINTAINER Ragul

RUN yum -y install httpd

COPY homer.jpg /var/www/html/

COPY covilha.cgi /var/www/cgi-bin/

COPY mb.conf /etc/httpd/conf.d/

CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]

EXPOSE 80
