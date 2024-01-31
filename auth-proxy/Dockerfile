FROM docker.io/httpd:2.4

RUN apt-get update && \
  apt-get install -y ca-certificates libapache2-mod-auth-openidc

COPY httpd-suffix.conf /

RUN cat /httpd-suffix.conf >> /usr/local/apache2/conf/httpd.conf && \
  sed -i 's/Listen 80/Listen 8080/' /usr/local/apache2/conf/httpd.conf && \
  chmod g+rw /usr/local/apache2/logs
