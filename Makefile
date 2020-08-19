build:
	docker-compose stop;docker-compose build --no-cache

up:
	docker-compose up -d

up-non-daemon:
	docker-compose up

start:
	docker-compose start

stop:
	docker-compose stop

restart:
	docker-compose stop && docker-compose start

shell-web:
	docker exec -ti fbctf_hhvm_1 /bin/sh

shell-db:
	docker exec -ti mysql8 /bin/sh

log-web:
	docker-compose logs web

log-db:
	docker-compose logs db
