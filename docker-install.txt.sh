
# sudo apt-get remove docker docker-engine docker.io

# The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved. 
# The Docker Community Edition (CE) package is now called docker-ce.

# Docker CE on Ubuntu supports overlay2 and aufs storage drivers.

sudo apt-get update

sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

# Add Docker’s official GPG key(金鑰指紋): 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

sudo apt-get update

# sudo apt-get install  docker-ce  docker-ce-cli  containerd.io
sudo apt-get install docker-ce

# 設定 docker 命令 不用 sudo 
grep docker /etc/group
sudo usermod -aG docker $(whoami)  # sudo usermod -aG docker $USER   
#或 sudo adduser $(whoami) docker  或 sudo adduser $USER docker 
grep docker /etc/group


# ==================================================================================================
# rpi Raspberry  安裝 Docker CE 穩定版

curl -sSL https://get.docker.com/ | sh

# 設定 docker 命令 不用 sudo 
grep docker /etc/group
sudo usermod -aG docker pi  # sudo usermod -aG docker $(whoami)  
#或 sudo adduser pi docker  或 sudo adduser $(whoami) docker 
grep docker /etc/group


# ===========================================================  
# Install Docker Compose

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
#sudo curl -L https://github.com/docker/compose/releases/download/1.23.2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
#sudo curl -L https://github.com/docker/compose/releases/download/1.24.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

docker-compose --version

# ===========================================================  

systemctl status containerd
systemctl status docker

# 重新登入 （再登入一次）
sudo su $USER

docker version
# ===========================================================  


