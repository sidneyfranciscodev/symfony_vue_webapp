# Install Node and build the frontend assets in a separate stage to keep the final image smaller.
FROM node:22.18-alpine AS node-builder

WORKDIR /app

COPY package*.json ./

# Install npm packages
RUN npm install

COPY assets ./assets
COPY vite.config.* ./

ENV NODE_ENV=production

# Build the frontend assets in production mode.
RUN npm run build

# Use official PHP with Apache image for the backend service.
FROM php:8.2-fpm

WORKDIR /var/www/app

# Install all system dependencies 
RUN apt-get update && apt-get install -y --no-install-recommends \
    zip unzip git curl nginx \
    libsodium-dev libicu-dev libzip-dev libpq-dev libxml2-dev libonig-dev \
    ca-certificates \
    && docker-php-ext-install intl pdo_pgsql zip sodium xml mbstring \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install composer
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Copy project files
COPY . .

# Copy the built frontend assets 
COPY --from=node-builder /app/public/build ./public/build

# Set environment variables
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV APP_ENV=prod
ENV APP_DEBUG=0

# Install Project dependencies
RUN composer install --no-dev --optimize-autoloader \
    && php bin/console cache:clear --no-warmup

# Set up Nginx config 
RUN rm -f /etc/nginx/sites-enabled/default 
COPY ./nginx/default.conf /etc/nginx/sites-enabled/default

# test Nginx
RUN nginx -t

# Set permissions for the application directory
RUN mkdir -p var \
    && chown -R www-data:www-data var \
    && chmod -R 755 var

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
