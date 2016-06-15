FROM ubuntu:14.04.4

MAINTAINER Sergey Dmitriev <serge.dmitriev@gmail.com>

RUN apt-get install -y curl

RUN curl http://deb.kamailio.org/kamailiodebkey.gpg | apt-key add -

RUN echo "deb http://deb.kamailio.org/kamailio trusty main" > /etc/apt/sources.list.d/kamailio.list

RUN echo "deb-src http://deb.kamailio.org/kamailio trusty main" >> /etc/apt/sources.list.d/kamailio.list