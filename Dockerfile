# Utiliser l'image PHP avec Apache, PHP 8.3
FROM php:8.2-fpm
# Installer les extensions PHP nécessaires pour Laravel et nettoyer le cache après installation
RUN apt-get update && apt-get install -y \
        libpng-dev \
        libjpeg-dev \
        libfreetype6-dev \
        libwebp-dev \
        libzip-dev \
        zip \
        unzip \
    && docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd pdo pdo_mysql zip \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Activer le mod_rewrite pour Apache
RUN a2enmod rewrite

# Donner la propriété du répertoire à l'utilisateur www-data
RUN chown -R www-data:www-data /var/www/html

# Les droits d'accès au répertoire
RUN chmod -R 755 /var/www/html

# Installer une version spécifique de Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer --version=2.1.3

# Exposer le port 80
EXPOSE 80
