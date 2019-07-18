#!/bin/bash
docker exec -it mysql-slave1 mysql -uroot -pabc.123 -e "RESET SLAVE;"
docker exec -it mysql-slave2 mysql -uroot -pabc.123 -e "RESET SLAVE;"
docker exec -it mysql-slave3 mysql -uroot -pabc.123 -e "RESET SLAVE;"

