
simple version 
with 

- install from packages 

- on ubuntu 14.04

- and siremis web interface


## install

> git clone https://github.com/antirek/kamailio-playground.git

> cd kamailio-playground/1.basic

> docker-compose up -d

> docker ps

see docker kamailio container "id"

> docker exec -it "id" bash

> $(in docker container) kamctl add 101@qw.ru 101 

> $(in docker container) kamctl add 102@qw.ru 102

register phones and make call

