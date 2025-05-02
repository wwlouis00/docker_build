https://hub.docker.com
https://registry.hub.docker.com

docker  search  mysql
docker  search  ubuntu
docker  pull  ubuntu
docker  pull  ubuntu:latest
docker  pull  ubuntu:14.04
docker  pull  ubuntu:16.04

docker images

docker  run  -ti  ubuntu:14.04  /bin/bash                  ## -t : terminal ,  -i : interactive
cat  /etc/issue
cat /proc/version
ps
top
ps
top
## use  Ctrl+p+q   to go back original  bash 
ps  aux | grep  top

docker  run  -ti  ubuntu:16.04  /bin/bash                  ## -t : terminal ,  -i : interactive
cat  /etc/issue
cat /proc/version

top
## use  Ctrl+p+q   to go back original  bash 
ps  aux | grep  top

docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED              STATUS              PORTS               NAMES
425b629f7ebc        ubuntu:16.04        "/bin/bash"         About a minute ago   Up About a minute                       grave_fermi          
05670f1e889d        ubuntu:14.04        "/bin/bash"         7 minutes ago        Up 7 minutes                            stupefied_thompson   

docker  attach  425b629f7ebc
docker  attach  stupefied_thompson

## use  Ctrl+d   to stop the  container  or  use  command  'exit'
docker  ps  -a

docker  top  425b629f7ebc

docker  start  stupefied_thompson
docker  top  stupefied_thompson

docker  stop  425b629f7ebc

cd  /var/lib/docker/containers
ls -l  
drwx------  2 root root 4096  8月 19 00:36 05670f1e889d2558345daec7ec089e021dcdba75989e075d64702470b1ea1f6b/
drwx------  2 root root 4096  8月 19 00:42 425b629f7ebcabd4909ad66f3ee21aaa2fead5a0d7e59d92e12fcb0bfb8030b5/
ls -l  425b629f7ebcabd4909ad66f3ee21aaa2fead5a0d7e59d92e12fcb0bfb8030b5
-rw------- 1 root root 785850  8月 19 01:05 425b629f7ebcabd4909ad66f3ee21aaa2fead5a0d7e59d92e12fcb0bfb8030b5-json.log
-rw-r--r-- 1 root root   1962  8月 19 00:42 config.json
-rw-r--r-- 1 root root    499  8月 19 00:42 hostconfig.json
-rw-r--r-- 1 root root     13  8月 19 00:42 hostname
-rw-r--r-- 1 root root    174  8月 19 00:42 hosts
-rw-r--r-- 1 root root    219  8月 19 00:42 resolv.conf
-rw-r--r-- 1 root root     71  8月 19 00:42 resolv.conf.hash
cat   425b629f7ebcabd4909ad66f3ee21aaa2fead5a0d7e59d92e12fcb0bfb8030b5/hostname
425b629f7ebc

cd

docker  run  -d  -ti  --name=myContainer  ubuntu:latest  /bin/bash           ##  -d  detach
docker  run  -d  -ti  --name=myubuntu     ubuntu:latest  /bin/bash           ##  -d  detach
cc3e5db1a744cc3d53e0f9de0f7cd7531873286feab1267500eff0bb91be8a46
docker ps
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES
cc3e5db1a744        ubuntu:14.04        "/bin/bash"         11 seconds ago      Up 10 seconds                           myContainer         
425b629f7ebc        ubuntu:16.04        "/bin/bash"         34 minutes ago      Up 34 minutes                           grave_fermi         
c78f7f575280        ubuntu:latest       "/bin/bash"         8 seconds ago       Up 6 seconds                            myubuntu

docker  stop  myContainer 


docker  run   -ti   -v  /data  --name=my16d  ubuntu:16.04  /bin/bash           ##  -d  detach
mkdir  /data/abc
exit
ls -l  /var/lib/docker/vfs/dir/f4272fdd75df5a190a5a93740736f77dc6914c65e8dbdc2a6b1359a3e60c064e/


mkdir  -p  /docker/vol/my16d2-mydata
docker  run   -ti   -v  /docker/vol/my16d2-mydata:/mydata  --name=my16d2  ubuntu:16.04  /bin/bash           ##  -d  detach


