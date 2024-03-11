.PHONY: setup docker-build laravel-install app-install update-env key-generate migrate down

# Définition de la commande par défaut
setup: docker-build laravel-install app-install update-env key-generate migrate

# Construction des images Docker
docker-build:
	docker compose down -v && docker-compose up -d --build

# Installation de Laravel via Composer
laravel-install:
	if [ ! -d "app" ]; then \
		mkdir -p app && cd app && composer create-project --prefer-dist laravel/laravel . ; \
	fi

# Installation des dépendances de Laravel (Utilisable après la première installation si nécessaire)
app-install:
	cd app && composer install

update-env:
	cp .env.example app/.env

# Génération de la clé d'application Laravel
key-generate:
	docker-compose exec app php artisan key:generate

# Migration de la base de données
migrate:
	docker-compose exec app php artisan migrate

# Arrêt des conteneurs Docker
down:
	docker-compose down -v

reload:
	docker-compose down -v && docker-compose up -d

build:
	docker-compose down -v && docker-compose up -d --build
