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
    make PREFIX="/usr/local" \
         include_modules="db_mysql dialplan" \
         EXTRA_DEFS="-DWITH_EVENT_LOCAL_REQUEST" \
         cfg && \
    make Q=0 all && \
    make install

##  include_modules="acc_radius app_java app_lua app_mono app_perl app_python auth_ephemeral auth_identity auth_radius carrierroute cdp cdp_avp cnxcc cpl-c crypto db2_ldap db_berkeley db_cassandra db_mongodb db_mysql db_oracle db_perlvdb db_postgres db_sqlite db_unixodbc dialplan dnssec erlang evapi geoip geoip2 gzcompress h350 http_async_client http_client ims_auth ims_charging ims_dialog ims_icscf ims_isc ims_qos ims_registrar_pcscf ims_registrar_scscf ims_usrloc_pcscf ims_usrloc_scscf iptrtpproxy jansson janssonrpc-c json jsonrpc-c kazoo lcr ldap log_systemd memcached mi_xmlrpc misc_radius ndb_cassandra ndb_mongodb ndb_redis osp outbound peering presence presence_conference presence_dialoginfo presence_mwi presence_profile presence_reginfo presence_xml pua pua_bla pua_dialoginfo pua_mi pua_reginfo pua_usrloc pua_xmpp purple regex rls sctp snmpstats tls utils uuid websocket xcap_client xcap_server xhttp_pi xmlops xmlrpc xmpp"
    
RUN PATH=$PATH:/usr/local/sbin && export PATH

RUN rm -r /usr/local/etc/kamailio/

COPY etc/rsyslog.d/100-kamailio.conf /etc/rsyslog.d/0-kamailio.conf

COPY etc/default/kamailio /etc/default/kamailio

COPY etc/init.d/kamailio /etc/init.d/kamailio

RUN chmod 755 /etc/init.d/kamailio && \
    mkdir -p /var/run/kamailio
    
RUN mkdir -p /var/log/kamailio && \
    touch /var/log/kamailio/kamailio.log && \    
    chown syslog /var/log/kamailio/kamailio.log && \
    chgrp adm /var/log/kamailio/kamailio.log

CMD service rsyslog start &&\
    sleep 20 && \
    /etc/init.d/kamailio start && \
    sleep infinity