# This dockerfile is built in two stages.
# The first stage uses a Node image to build the frontend assets. 
# The second stage uses a PHP-FPM image to serve the backend and the built frontend assets.
# The final image is optimized for production use, with only the necessary runtime dependencies and the built assets included, resulting in a smaller and more secure image.
# The final image includes Nginx to serve the application, and the necessary PHP extensions for a typical Symfony application. 
# You can deploy this image in render.com or any other container hosting service that supports Docker images.
# Note: Make sure to adjust the Nginx configuration and PHP extensions as needed for your specific application requirements.

# Stage 1: Build frontend assets
# Use official Node image to build frontend assets.
FROM node:22.18-alpine AS node-builder

WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install npm packages
RUN npm install

# Copy the rest of the application code to the working directory
COPY assets ./assets
COPY vite.config.* ./

# Set environment variable for production build
ENV NODE_ENV=production

# Build the frontend assets in production mode.
RUN npm run build


# Stage 2: Build the final image with PHP-FPM and Nginx
# Use official php-fpm image for the backend service.
FROM php:8.2-fpm

WORKDIR /var/www/app

# Install system dependencies 
RUN apt-get update && apt-get install -y --no-install-recommends \
    zip unzip git curl nginx \
    libsodium-dev libicu-dev libzip-dev libpq-dev libxml2-dev libonig-dev \
    ca-certificates \
    && docker-php-ext-install intl pdo_pgsql zip sodium xml mbstring \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install composer globally
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Copy the application code to the working directory
COPY . .

# Copy the built frontend assets 
COPY --from=node-builder /app/public/build ./public/build

# Set environment variables for Symfony and Composer
ENV COMPOSER_ALLOW_SUPERUSER=1
ENV APP_DEBUG=0

# Install PHP dependencies and clear cache for production
RUN composer install --no-dev --optimize-autoloader \
    && php bin/console cache:clear --no-warmup

# Configure Nginx to serve the application
RUN rm -f /etc/nginx/sites-enabled/default 
COPY ./nginx/default.conf /etc/nginx/sites-enabled/default

# Test Nginx configuration
RUN nginx -t

# Set permissions for the application directory
RUN mkdir -p var \
    && chown -R www-data:www-data var \
    && chmod -R 755 var

CMD ["sh", "-c", "php-fpm -D && nginx -g 'daemon off;'"]
