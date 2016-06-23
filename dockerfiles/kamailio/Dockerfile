FROM ubuntu:14.04.4

MAINTAINER Sergey Dmitriev <serge.dmitriev@gmail.com>

RUN apt-get check && \
    apt-get update && \
    apt-get install -y \ 
		curl \
	&& \
    apt-get clean

RUN curl http://deb.kamailio.org/kamailiodebkey.gpg | apt-key add -

RUN echo "deb http://deb.kamailio.org/kamailio trusty main" > /etc/apt/sources.list.d/kamailio.list

RUN echo "deb-src http://deb.kamailio.org/kamailio trusty main" >> /etc/apt/sources.list.d/kamailio.list

RUN apt-get update && \
	apt-get -y install kamailio kamailio-extra-modules kamailio-ims-modules \
	kamailio-mysql-modules kamailio-nth kamailio-presence-modules \
	kamailio-tls-modules kamailio-websocket-modules kamailio-xml-modules \
	kamailio-xmpp-modules

COPY etc/default/kamailio /etc/default/kamailio

#COPY etc/rsyslog.conf /etc/rsyslog.conf

COPY etc/rsyslog.d/100-kamailio.conf /etc/rsyslog.d/0-kamailio.conf

#COPY etc/rsyslog.d/50-default.conf /etc/rsyslog.d/50-default.conf

CMD touch /var/log/kamailio/kamailio.log && \
	chown syslog /var/log/kamailio/kamailio.log && \
	chgrp adm /var/log/kamailio/kamailio.log && \
	service rsyslog start &&\
	sleep 10 && \
	service kamailio start && \
	sleep infinity