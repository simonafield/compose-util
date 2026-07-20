# compose-util

## Introduction

This project provides several Docker Compose services.

The services support the following utility workflows:

- cleanup build files
- provide Alpine Linux work environment

Docker Compose permits this without installing the dependencies on your local machine.

## Variables

The services require the following environment variables:

- `UID` - The Unix User ID. This can be obtained by running `id -u`
- `GID` - The Unix User Group ID. This can be obtained by running `id -g`

In the following examples, the `UID` and `GID` values are stored in an `.env` file passed to Docker Compose using the `--env-file` argument.

## Services

### [`alpine`](./docker-compose.yml#L4)

**Description:** A minimal Alpine Linux container with your local directory mounted in `/data`.

**Example:**
```bash
docker-compose \
    --env-file .env \                    # Include Environment Variables
    -f compose-util/docker-compose.yml \ # Include Base Compose File
    run --rm \                           # Run Container then Remove
    alpine \                             # Run Service
    ls -la                               # Command to Run
```

---

### [`cleanup`](./docker-compose.yml#L12)

**Description:** Forcefully removes the local `build` directory and recreates an empty one.

**Example:**
```bash
docker-compose \
    --env-file .env \                    # Include Environment Variables
    -f compose-util/docker-compose.yml \ # Include Base Compose File
    run --rm \                           # Run Container then Remove
    cleanup                              # Run Service
```
