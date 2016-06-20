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

COPY etc/rsyslog.d/100-kamailio.conf /etc/rsyslog.d/0-kamailio.conf

CMD sleep 10 && service kamailio start && sleep infinity