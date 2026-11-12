# Dockerfile
FROM ubuntu:22.04

ARG USERNAME=wwlouis
ARG USER_UID=1000
ARG USER_GID=1000

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Taipei

# Install only the tools required for a reusable development environment.
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        bash \
        ca-certificates \
        curl \
        git \
        sudo \
        vim \
        tzdata \
        && \
    groupadd --gid ${USER_GID} ${USERNAME} 2>/dev/null || true && \
    useradd --uid ${USER_UID} --gid ${USER_GID} --create-home --shell /bin/bash ${USERNAME} 2>/dev/null || usermod -u ${USER_UID} ${USERNAME} && \
    echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/${USERNAME}

USER ${USERNAME}

CMD ["/bin/bash"]
