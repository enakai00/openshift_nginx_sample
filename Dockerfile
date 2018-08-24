FROM centos:7
MAINTAINER E.Nakai

RUN yum -y install epel-release; \
    yum -y install nginx
RUN mkdir -p /var/www; \
    echo 'zb123 Hello, World!' > /var/www/index.html
ADD nginx.conf /
RUN chmod ugo+r /nginx.conf; \
    chmod -R ugo+r /var/www

USER 997
EXPOSE 8081
CMD ["/usr/sbin/nginx", "-c", "/nginx.conf", "-g", "daemon off;"]
