# Dockerfile
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# 安裝常用工具並建立使用者
RUN apt-get update && \
    apt-get install -y sudo vim git curl && \
    useradd -m -s /bin/bash wwlouis && \
    echo "wwlouis ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# 設定預設工作目錄
WORKDIR /home/wwlouis

# 用 wwlouis 身份啟動
USER wwlouis

CMD ["/bin/bash"]
