IMAGE_NAME ?= wwlouis-dev-template:latest
CONTAINER_NAME ?= wwlouis-dev
HOST_WORKDIR ?= ./workspace
HOST_PORT ?= 8080

.PHONY: up down rebuild logs shell clean help

help:
	@echo "Available commands:"
	@echo "  make up         Start the development container"
	@echo "  make down       Stop and remove the container"
	@echo "  make rebuild    Rebuild the Docker image"
	@echo "  make logs       Show container logs"
	@echo "  make shell      Open a shell in the running container"
	@echo "  make clean      Remove Docker artifacts"

up:
	@mkdir -p $(HOST_WORKDIR)
	docker compose up -d --build

rebuild:
	@mkdir -p $(HOST_WORKDIR)
	docker compose build --no-cache

docker compose up -d

down:
	docker compose down

logs:
	docker compose logs -f

shell:
	docker compose exec dev /bin/bash

clean:
	docker compose down --volumes --remove-orphans
	docker system prune -f
