
NGINX_SECRETS_DIR = srcs/requirements/nginx/secrets
SECRETS_DIR = secrets

DOCKER_COMPOSE_YAML = srcs/docker-compose.yml

all: copy_all_secrets
	docker-compose -f srcs/docker-compose.yml up --build

copy_nginx_secrets:
	mkdir -p $(NGINX_SECRETS_DIR)
	cp $(SECRETS_DIR)/* $(NGINX_SECRETS_DIR)/

copy_all_secrets: copy_nginx_secrets



