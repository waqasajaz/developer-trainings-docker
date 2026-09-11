# Basic Dockerfile Keywords

## Common Dockerfile Instructions

### FROM

Base image for your container. Every Dockerfile starts with this.

```dockerfile
FROM node:24
```

### WORKDIR

Sets the working directory inside the container for subsequent commands.

```dockerfile
WORKDIR /app
```

### COPY / ADD

Copies files from host to container. `COPY` is simpler, `ADD` can handle URLs and archives.

```dockerfile
COPY . /app
ADD file.tar.gz /app
```

### RUN

Executes commands during build time. Chain multiple with `&&` to reduce layers.

```dockerfile
RUN npm install && npm run build
```

### ENV

Sets environment variables in the container.

```dockerfile
ENV NODE_ENV=production
```

### EXPOSE

Documents which ports the container listens on (doesn't actually open ports).

```dockerfile
EXPOSE 3000
```

### CMD

Default command to run when container starts. Can be overridden at runtime.

```dockerfile
CMD ["npm", "start"]
```

### ENTRYPOINT

Configures the container to run as an executable. Often paired with CMD for flexibility.

```dockerfile
ENTRYPOINT ["node", "app.js"]
CMD ["--production"]
```

### USER

Sets the user that runs the container (for security, avoid running as root).

```dockerfile
USER appuser
```

### LABEL

Adds metadata to the image.

```dockerfile
LABEL version="1.0" maintainer="your-email@example.com"
```

### ARG

Build-time variables passed with `docker build --build-arg KEY=value`.

```dockerfile
ARG NODE_VERSION=18
```

### VOLUME

Declares a mount point for persistent data.

```dockerfile
VOLUME ["/data"]
```

### HEALTHCHECK

Defines how Docker checks if container is healthy.

```dockerfile
HEALTHCHECK --interval=30s CMD node healthcheck.js
```

# Basic Docker-Compose Keywords

## Common Docker Compose Configuration

````

### services

Defines the containers that make up your application.

```yaml
services:
  web:
    image: node:18-alpine
  db:
    image: postgres:14
````

### image

Specifies which image to use for a service. Can be a local image or pull from registry.

```yaml
services:
  web:
    image: node:18-alpine
```

### build

Builds an image from a Dockerfile instead of pulling it.

```yaml
services:
  web:
    build:
      context: .
      dockerfile: Dockerfile
```

### ports

Maps ports between host and container. `host:container`.

```yaml
services:
  web:
    ports:
      - "3000:3000"
```

### volumes

Mounts directories or named volumes for persistent data or code sharing.

```yaml
services:
  web:
    volumes:
      - ./src:/app/src
      - data:/app/data
```

### environment

Sets environment variables for the service.

```yaml
services:
  db:
    environment:
      POSTGRES_PASSWORD: password
      POSTGRES_DB: myapp
```

### env_file

Loads environment variables from a file (e.g., `.env`).

```yaml
services:
  web:
    env_file:
      - .env
```

### depends_on

Specifies service dependencies. Defines startup order.

```yaml
services:
  web:
    depends_on:
      - db
  db:
    image: postgres:14
```

### networks

Defines custom networks for service communication.

```yaml
services:
  web:
    networks:
      - backend
networks:
  backend:
    driver: bridge
```

### restart_policy

Defines restart behavior when container exits.

```yaml
services:
  web:
    restart_policy:
      condition: on-failure
      max_attempts: 5
```

### healthcheck

Checks container health at intervals.

```yaml
services:
  web:
    healthcheck:
      test: ["CMD", "curl", "-f", "http://localhost:3000"]
      interval: 30s
      timeout: 10s
      retries: 3
```

### command

Overrides the default command from the image.

```yaml
services:
  web:
    command: npm run dev
```

### container_name

Sets a custom name for the container.

```yaml
services:
  web:
    container_name: my-app-web
```
