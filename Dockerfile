FROM node:20-alpine AS builder

RUN npm install -g pnpm

WORKDIR /app

COPY package.json ./
RUN pnpm install --no-frozen-lockfile

COPY . .
RUN pnpm run build

# Production stage - serve with nginx
FROM nginx:alpine

COPY --from=builder /app/dist /usr/share/nginx/html

# nginx config to handle SPA routing
RUN echo 'server { \
  listen 80; \
  location / { \
    root /usr/share/nginx/html; \
    index index.html; \
    try_files $uri $uri/ /index.html; \
  } \
}' > /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
