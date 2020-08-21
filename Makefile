build:
	docker-compose stop;docker-compose build

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
	docker exec -ti fbctf_mysql_1 /bin/sh

log-web:
	docker-compose logs fbctf_hhvm_1

log-db:
	docker-compose logs fbctf_mysql_1
