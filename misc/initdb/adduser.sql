CREATE USER 'kamailio'@'%' IDENTIFIED BY 'kamailiorw';

GRANT ALL PRIVILEGES ON * . * TO 'kamailio'@'%';

CREATE USER 'kamailioro'@'%' IDENTIFIED BY 'kamailioro';

GRANT ALL PRIVILEGES ON * . * TO 'kamailioro'@'%';

FLUSH PRIVILEGES;