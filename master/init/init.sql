CREATE USER 'slave'@'%' IDENTIFIED BY 'abc.123';
GRANT REPLICATION SLAVE, REPLICATION CLIENT ON *.* TO 'slave'@'%';
FLUSH PRIVILEGES;