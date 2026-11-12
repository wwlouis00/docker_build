# Dockerfile
FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install only the tools needed for a development environment.
RUN apt-get update && \
    apt-get install --no-install-recommends -y \
        sudo \
        vim \
        git \
        curl \
        ca-certificates && \
    useradd --create-home --shell /bin/bash wwlouis && \
    echo "wwlouis ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /home/wwlouis

USER wwlouis

CMD ["/bin/bash"]
