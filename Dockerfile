FROM ubuntu:22.04

ARG USERNAME=wwlouis
ARG USER_UID=1000
ARG USER_GID=1000

ENV DEBIAN_FRONTEND=noninteractive \
    TZ=Asia/Taipei \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        bash \
        build-essential \
        ca-certificates \
        curl \
        git \
        python3 \
        python3-pip \
        python3-venv \
        sudo \
        tzdata \
        vim \
    && groupadd --gid ${USER_GID} ${USERNAME} 2>/dev/null || true \
    && useradd --uid ${USER_UID} --gid ${USER_GID} --create-home --shell /bin/bash ${USERNAME} 2>/dev/null || usermod -u ${USER_UID} ${USERNAME} \
    && echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /home/${USERNAME}

COPY --chown=${USERNAME}:${USERNAME} . /home/${USERNAME}/project
WORKDIR /home/${USERNAME}/project

USER ${USERNAME}

RUN python3 -m venv /home/${USERNAME}/.venv
ENV PATH="/home/${USERNAME}/.venv/bin:$PATH"

CMD ["/bin/bash"]
