FROM centos:7
COPY proxy/Atlas-2.2.1.el6.x86_64.rpm /opt
RUN rpm -i /opt/Atlas-2.2.1.el6.x86_64.rpm
RUN chmod 777 -R  /usr/local/mysql-proxy
COPY proxy/conf/test.cnf /usr/local/mysql-proxy/conf/
EXPOSE 1234
EXPOSE 2345
ENTRYPOINT ["/usr/local/mysql-proxy/bin/mysql-proxyd","test","start"]