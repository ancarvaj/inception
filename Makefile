
COMPOSE_PATH = srcs/docker-compose.yaml

.PHONY: all
all: up

.PHONY: up
up:
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
