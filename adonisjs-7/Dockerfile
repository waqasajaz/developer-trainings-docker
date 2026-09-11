FROM node:24 AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

FROM node:24

WORKDIR /app
COPY --from=builder /app/build ./

RUN npm ci --omit=dev

COPY docker-entrypoint.sh /app/docker-entrypoint.sh
RUN chmod +x /app/docker-entrypoint.sh

EXPOSE 3333

ENTRYPOINT ["/app/docker-entrypoint.sh"]
