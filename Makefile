setup: build laravel-setup key-generate migrate

build:
	docker-compose down -v
	docker-compose up -d --build

laravel-setup: laravel-install update-env

laravel-install:
	[ -d "laravel-project" ] || (mkdir -p laravel-project && cd laravel-project && composer create-project --prefer-dist laravel/laravel . && cd ..)
	cd laravel-project && composer install

update-env:
	cp .env.example laravel-project/.env

key-generate:
	docker-compose exec app php artisan key:generate

migrate:
	docker-compose exec app php artisan migrate

down:
	docker-compose down -v

reload: down build
