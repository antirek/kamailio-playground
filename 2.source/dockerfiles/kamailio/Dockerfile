FROM ubuntu:16.04

MAINTAINER Sergey Dmitriev <serge.dmitriev@gmail.com>

RUN apt-get check && \
    apt-get update && \
    apt-get install -y \ 
        curl \
    && \
    apt-get clean


COPY etc/default/kamailio /etc/default/kamailio

COPY etc/rsyslog.d/100-kamailio.conf /etc/rsyslog.d/0-kamailio.conf

CMD touch /var/log/kamailio/kamailio.log && \
    chown syslog /var/log/kamailio/kamailio.log && \
    chgrp adm /var/log/kamailio/kamailio.log && \
    service rsyslog start &&\
    sleep 10 && \
    service kamailio start && \
    sleep infinity