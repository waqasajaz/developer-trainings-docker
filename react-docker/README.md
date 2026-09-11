# React Docker App

React application with Docker & Nginx.

## Quick Start

```bash
docker-compose up --build
```

Access at `http://localhost:3000`

## Environment Variables (docker-compose.yml)

| Variable | Default | Description |
|----------|---------|-------------|
| `NODE_ENV` | `production` | Node environment mode |

## Ports

- **Host**: 3000 → **Container**: 80

## Stop

```bash
docker-compose down
```
