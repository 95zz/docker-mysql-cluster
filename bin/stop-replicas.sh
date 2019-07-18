#/bin/bash
#停止集群复制
docker exec -it  mysql-slave1 mysql -uroot -pabc.123 \
-e "STOP SLAVE"
docker exec -it  mysql-slave2 mysql -uroot -pabc.123 \
-e "STOP SLAVE"
docker exec -it  mysql-slave3 mysql -uroot -pabc.123 \
-e "STOP SLAVE"
