# Project template for engineering work

This repository is organized as a reusable engineering template for development inside a Docker container.
It is intended to support a real-world workflow with structured source folders, environment variables, reproducible builds, and CI-friendly commands.

## Directory layout

```text
.
├── Dockerfile
├── docker-compose.yml
├── Makefile
├── .env.example
├── .dockerignore
├── .devcontainer/
│   └── devcontainer.json
├── entrypoint.sh
├── requirements.txt
├── README.md
├── src/
├── tests/
├── workspace/
└── .env
```

## Quick start

1. Copy the example environment file.

```bash
cp .env.example .env
```

2. Start the development environment.

```bash
make up
```

3. Open a shell inside the container.

```bash
make shell
```

4. Install project dependencies.

```bash
make install
```

5. Run tests and quality checks.

```bash
make test
make lint
make format
```

## Typical engineering workflow

```bash
make up
make shell
# work inside /home/wwlouis/project
# edit source files in src/ or tests/
exit
make logs
make down
```

## Recommended project conventions

- Use `src/` for application code
- Use `tests/` for automated tests
- Keep runtime configuration in `.env`
- Keep generated files outside the repo root or in `workspace/`
- Run `make lint` and `make test` before merging changes

## Dev Container support

A VS Code Dev Container configuration is included under `.devcontainer/devcontainer.json` for IDE workflows.

## Operational notes

- Container runs as a non-root user by default.
- The repository root is mounted into the container workspace for live editing.
- `workspace/` is reserved for local scratch or generated output.
- `HOST_WORKDIR` can point to a local folder on your machine.

## Production-oriented improvements applied

- Non-root runtime user
- Docker build caching friendly
- `.dockerignore` for cleaner image layers
- `.env` configuration support
- Makefile for standard developer commands
- Dev Container support for editor integration
- Python environment prepared for real project use
