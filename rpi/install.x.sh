# ==================================================================================================
# rpi Raspberry  安裝 Docker CE 穩定版

curl -sSL https://get.docker.com/ | sh

# 設定 docker 命令 不用 sudo 
grep docker /etc/group
sudo usermod -aG docker pi  # sudo usermod -aG docker $USER   
#或 sudo adduser pi docker  或 sudo adduser $USER docker 
grep docker /etc/group

# 重新登入 （再登入一次）
sudo su pi
# ==================================================================================================
# ARM 版本的容器

#  https://hub.docker.com/r/jsurf/rpi-mariadb/
docker pull jsurf/rpi-mariadb

docker run -d -p 3306:3306 --name mariadb_3306 -e MYSQL_ROOT_PASSWORD=1234 -v /var/lib/mysql:/var/lib/mysql  jsurf/rpi-mariadb:latest
docker run -d -p 3306:3306 --name mariadb_3306 -e MYSQL_ROOT_PASSWORD=1234 -v ~/d/mysql:/var/lib/mysql  jsurf/rpi-mariadb:latest


# ===== 或者 ===========================================================
#  https://hub.docker.com/r/hypriot/rpi-mysql/
docker pull hypriot/rpi-mysql

# ===========
docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hypriot/rpi-mysql   latest              7e122635eb56        10 days ago         209MB
jsurf/rpi-mariadb   latest              f178854ac0cb        4 weeks ago         287MB

# ==================================================================================================
docker run -it --link mariadb_3306:mysql --rm jsurf/rpi-mariadb:latest sh -c 'exec mysql -h"$MYSQL_PORT_3306_TCP_ADDR" -P"$MYSQL_PORT_3306_TCP_PORT" -uroot -p"$MYSQL_ENV_MYSQL_ROOT_PASSWORD"'

docker run -it --link mariadb_3306:mysql --rm jsurf/rpi-mariadb:latest sh -c 'bash'

# ===============================================================================
mysql --protocol=tcp -u root -p
mysql -h localhost -P 3306 --protocol=tcp -u root -p


