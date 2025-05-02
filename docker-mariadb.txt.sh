#
# https://hub.docker.com/_/mariadb/
# 

man docker search > man-docker-search

docker search mariadb

man docker pull > man-docker-pull

# docker pull mariadb:10.2
docker image load -i ~/下載/107_產_A/docker-img/mariadb_10.2.tar

# =======================

docker run -d -p 3306:3306 --name mariadb_3306 -e MYSQL_ROOT_PASSWORD=1234 mariadb:10.2

docker ps
#>a3e8c15ddd3f        mariadb:10.2        "docker-entrypoint.s…"   28 seconds ago      Up 28 seconds       0.0.0.0:3306->3306/tcp   mariadb_3306

docker exec -it mariadb_3306 bash
#>root@107a4142d6b6:/# 
mysql -u root -p
#>Enter password: 
#>MariaDB [(none)]> 

docker rm -f mariadb_3306

docker run -d -p 3300:3306 --name mariadb_3300 -e MYSQL_ROOT_PASSWORD=1234 -v ~/a1/mysql:/var/lib/mysql  mariadb:10.2
docker run -d -p 3306:3306 --name mariadb_3306 -e MYSQL_ROOT_PASSWORD=1234 -v ~/a1/tmp/kk:/var/lib/mysql  mariadb:10.2

docker logs mariadb_3306
docker exec -it mariadb_3306 bash
ps aux
docker exec -it mariadb_3300 mysql -u root -p
ps aux

docker ps
#=============================================================

#docker run -it --link some-mariadb-name:mysql --rm mariadb sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
docker run -it --link mariadb_3306:mysql --rm mariadb:10.2 sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'
#docker run -it --rm mariadb mysql -hsome.mysql.host -usome-mysql-user -p

docker ps

