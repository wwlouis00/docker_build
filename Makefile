IMAGE_NAME ?= wwlouis-engineering-template:latest
CONTAINER_NAME ?= wwlouis-engineering
HOST_WORKDIR ?= ./workspace
HOST_PORT ?= 8080
PYTHON ?= python3

.PHONY: up down rebuild logs shell install test lint format help

help:
	@echo "Available commands:"
	@echo "  make up        Start the dev container"
	@echo "  make down      Stop and remove the container"
	@echo "  make rebuild   Rebuild the image"
	@echo "  make logs      Show container logs"
	@echo "  make shell     Open bash in the container"
	@echo "  make install   Install Python dependencies"
	@echo "  make test      Run tests"
	@echo "  make lint      Run lint checks"
	@echo "  make format    Format Python files"
	@echo "  make clean     Remove container and prune unused Docker resources"

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
	docker compose exec app /bin/bash

install:
	docker compose exec app /bin/bash -lc "python3 -m pip install --upgrade pip && if [ -f requirements.txt ]; then python3 -m pip install -r requirements.txt; fi"

test:
	docker compose exec app /bin/bash -lc "if [ -d tests ]; then pytest -q; else echo 'No tests directory found.'; fi"

lint:
	docker compose exec app /bin/bash -lc "python3 -m pip install --quiet ruff && ruff check ."

format:
	docker compose exec app /bin/bash -lc "python3 -m pip install --quiet black && black ."

clean:
	docker compose down --volumes --remove-orphans
	docker system prune -f
