# This Dockerfile is for the nginx service in the docker-compose setup. It uses the official nginx:alpine image as a base and copies a custom nginx configuration file and the built static assets from the public directory into the appropriate locations in the container. This allows nginx to serve the frontend assets directly. Make sure to adjust the paths and configurations as needed for your specific application requirements.

# Use official nginx image.
FROM nginx:alpine

# Copy the custom nginx configuration file to the container
COPY ./default.conf /etc/nginx/conf.d/default.conf

# Copy the built frontend assets from the public directory to the nginx html directory
COPY ./public /var/www/app/public