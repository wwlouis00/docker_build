
docker  info
# => WARNING: Error loading config file:/home/robert/.dockercfg - open /home/robert/.dockercfg: permission denied
Containers: 20
 Running: 0
 Paused: 0
 Stopped: 20
Images: 55
Server Version: 1.12.6
Storage Driver: aufs
 Root Dir: /var/lib/docker/aufs
 Backing Filesystem: extfs
 Dirs: 95
 Dirperm1 Supported: false
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host overlay null
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Security Options: apparmor
Kernel Version: 3.13.0-107-generic
Operating System: Ubuntu 14.04.5 LTS
OSType: linux
Architecture: x86_64
CPUs: 4
Total Memory: 15.38 GiB
Name: eric-H77-D3h
ID: RPWL:H2XJ:3TQB:L5RG:7LFN:RNNJ:4XXY:IH2J:BWQ2:JFAP:RR62:63HH
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Username: robertshieh
Registry: https://index.docker.io/v1/
WARNING: No swap limit support
Insecure Registries:
 127.0.0.0/8

# =============================================================
docker  images
#         List images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
ubuntu              14.04               390582d83ead        4 weeks ago         188MB
ubuntu              16.04               5e8b97a2a082        10 months ago       114MB
ubuntu              latest              94e814e2efa8        4 weeks ago         88.9MB
debian              jessie              4eb8376dc2a3        11 months ago       127MB
debian              stretch             d508d16c64cd        2 months ago        101MB
tomcat              7                   795e4e5bef09        9 months ago        368MB
mariadb             10.2                447a28508139        10 months ago       401MB

docker inspect 447a28508139
docker inspect mariadb:10.2
# =============================================================
docker  ps
#         List containers
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

# =============================================================
docker  ps  -a
docker  ps  -a -q
# =============================================================
docker  -v
Docker version 18.09.4, build d14af54
# =============================================================
docker  version
#         Show the Docker version information
Client:
 Version:           18.09.4
 API version:       1.39
 Go version:        go1.10.8
 Git commit:        d14af54
 Built:             Wed Mar 27 18:34:51 2019
 OS/Arch:           linux/amd64
 Experimental:      false

Server: Docker Engine - Community
 Engine:
  Version:          18.09.4
  API version:      1.39 (minimum version 1.12)
  Go version:       go1.10.8
  Git commit:       d14af54
  Built:            Wed Mar 27 18:01:48 2019
  OS/Arch:          linux/amd64
  Experimental:     false
# =============================================================
# =============================================================
###  Dockerfile
FROM  busybox
ENV  hello=robert
# =============================================================
docker  build  -t  busyrob  .
docker run busyrob env | grep rob
# =============================================================





