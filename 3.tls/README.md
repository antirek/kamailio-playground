
kamailio

- install from sources

- on ubuntu 16.04 (for dtls  1.2, openssl)



## install

> git clone https://github.com/antirek/kamailio-playground.git

> cd kamailio-playground/2.source

> docker-compose up -d

> docker ps


see docker kamailio container "id"

> docker exec -it "id" bash

> $(in docker container) kamctl add 101@qw.ru 101 

> $(in docker container) kamctl add 102@qw.ru 102

register phones and make call
