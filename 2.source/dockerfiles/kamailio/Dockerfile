FROM ubuntu:16.04

MAINTAINER Sergey Dmitriev <serge.dmitriev@gmail.com>

RUN apt-get check && \
    apt-get update && \
    apt-get install -y \ 
        curl git gcc flex bison libmysqlclient-dev make \
        libssl-dev libcurl4-openssl-dev libxml2-dev libpcre3-dev \
        rsyslog mysql-client htop mc \
    && \
    apt-get clean

RUN mkdir -p /usr/local/src/kamailio-4.4 && \
    cd /usr/local/src/kamailio-4.4 && \
    git clone --depth 1 --no-single-branch git://git.kamailio.org/kamailio kamailio && \
    cd kamailio && \
    git checkout -b 4.4 origin/4.4 && \
    make include_modules="db_mysql dialplan" \
         EXTRA_DEFS="-DWITH_EVENT_LOCAL_REQUEST" \
         cfg && \
    make all && \
    make install


COPY etc/default/kamailio /etc/default/kamailio

COPY etc/rsyslog.d/100-kamailio.conf /etc/rsyslog.d/0-kamailio.conf

RUN cp /usr/local/src/kamailio-4.4/kamailio/pkg/kamailio/deb/debian/kamailio.init \
       /etc/init.d/kamailio && \
    chmod 755 /etc/init.d/kamailio && \
    mkdir -p /var/run/kamailio && \
    adduser --quiet --system --group --disabled-password \
            --shell /bin/false --gecos "Kamailio" \
            --home /var/run/kamailio kamailio && \
    chown kamailio:kamailio /var/run/kamailio


CMD touch /var/log/kamailio/kamailio.log && \    
    chown syslog /var/log/kamailio/kamailio.log && \
    chgrp adm /var/log/kamailio/kamailio.log && \
    service rsyslog start &&\
    sleep 10 && \
    /etc/init.d/kamailio start && \    
    sleep infinity