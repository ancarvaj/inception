
COMPOSE_PATH = srcs/docker-compose.yaml

.PHONY: all
all: up

.PHONY: up
up:
	mkdir -p /home/$${USER}/data/wordpress
	mkdir -p /home/$${USER}/data/mariadb
	docker compose -f $(COMPOSE_PATH) up --build -d

.PHONY: start
start:
	docker compose -f $(COMPOSE_PATH) up -d

.PHONY: down
down:
	docker compose -f $(COMPOSE_PATH) down

.PHONY: clear
clear: down
	-docker rmi $$(docker images -aq)
	- docker volume rm $$(docker volume ls -q)
