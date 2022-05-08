up:
	docker-compose up -d
init:
	docker-compose up -d --build
	docker-compose exec --user=www-data app cp -f config/.env.example config/.env
	docker-compose exec --user=www-data app composer install --no-interaction
	docker-compose exec --user=www-data app bin/cake migrations migrate -p Sakila
	docker-compose exec --user=www-data app bin/cake migrations seed -p Sakila

app:
	docker-compose exec --user=www-data app bash
web:
	docker-compose exec web sh
db:
	docker-compose exec db bash

down-all:
	docker-compose down --rmi all --volumes --remove-orphans
