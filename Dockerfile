# Use the official PHP Apache image
FROM php:8.1-apache

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libpng-dev \
    libjpeg-dev \
    libzip-dev \
    && rm -rf /var/lib/apt/lists/*

# Enable Apache modules
RUN a2enmod rewrite

# Install PHP extensions
RUN docker-php-ext-install \
    pdo_mysql \
    zip

# Set working directory to php-1 folder
WORKDIR /var/www/html/php-1

# Copy application code
COPY php-1/. .

# Set Apache document root to php-1/public
ENV APACHE_DOCUMENT_ROOT=/var/www/html/php-1/public

# Expose port 80
EXPOSE 80

# Start Apache
CMD ["apache2-foreground"]
