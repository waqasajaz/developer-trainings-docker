# AdonisJS Docker App

AdonisJS backend application with MySQL database, fully containerized.

## Quick Start

```bash
docker-compose up --build
```

Access API at `http://localhost:3333`

## Environment Variables (docker-compose.yml)

### App Configuration
| Variable | Default | Description |
|----------|---------|-------------|
| `NODE_ENV` | `production` | Node environment |
| `PORT` | `3333` | App port inside container |
| `HOST` | `0.0.0.0` | App host binding |
| `APP_KEY` | (set) | Encryption key for sessions/cookies |
| `APP_URL` | `http://app:3333` | Base URL for app |
| `TZ` | `UTC` | Timezone |
| `LOG_LEVEL` | `info` | Logger level |
| `SESSION_DRIVER` | `cookie` | Session storage driver |

### Database Configuration
| Variable | Default | Description |
|----------|---------|-------------|
| `DB_HOST` | `mysql` | MySQL service name |
| `DB_PORT` | `3306` | MySQL port |
| `DB_USER` | `root` | MySQL user |
| `DB_PASSWORD` | `root` | MySQL password |
| `DB_DATABASE` | `adonisjs` | Database name |

### MySQL Service
| Variable | Default | Description |
|----------|---------|-------------|
| `MYSQL_ROOT_PASSWORD` | `rootpassword` | Root user password |
| `MYSQL_DATABASE` | `adonisjs` | Initial database |
| `MYSQL_USER` | `adonisjs_user` | Regular user |
| `MYSQL_PASSWORD` | `adonisjs_password` | Regular user password |

## Ports

- **App**: Host 3333 → Container 3333
- **MySQL**: Internal only (3306)

## Volumes

- `mysql_data`: Persistent MySQL data
- `./tmp`: Temporary app files (cache, uploads)

## Stop

```bash
docker-compose down
```

## Notes

- MySQL data persists between restarts in named volume `mysql_data`
- App restarts automatically on failure
- Database migrations should run on container start via entrypoint
