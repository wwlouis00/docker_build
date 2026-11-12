#!/usr/bin/env bash
set -euxo pipefail

# Install Docker CE on Ubuntu/Debian using the official repository.
# This replaces the older apt-key + legacy docker-compose approach.

sudo apt-get update
sudo apt-get install -y \
  ca-certificates \
  curl \
  gnupg \
  lsb-release

sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

arch=$(dpkg --print-architecture)
release=$(lsb_release -cs)

echo \
  "deb [arch=${arch} signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu ${release} stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Allow current user to run docker without sudo.
sudo usermod -aG docker "${USER}"

# Verify installation.
docker --version
docker compose version

echo "==============================================================="
echo "Install complete. Please log out and log back in before running docker commands."
echo "Example: docker run hello-world"
echo "==============================================================="
