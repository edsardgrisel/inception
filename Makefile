
NGINX_SECRETS_DIR = srcs/requirements/nginx/secrets
SECRETS_DIR = secrets

DOCKER_COMPOSE_YAML = srcs/docker-compose.yml

all: copy_all_secrets
	docker-compose -f srcs/docker-compose.yml up --build

re: down all
	
down: 
	docker compose -f srcs/docker-compose.yml down

background:
	docker-compose -f srcs/docker-compose.yml up -d
	@echo "Enter container with bash using: docker exec -it <container_name> /bin/bash "

copy_nginx_secrets:
	mkdir -p $(NGINX_SECRETS_DIR)
	cp $(SECRETS_DIR)/* $(NGINX_SECRETS_DIR)/

copy_all_secrets: copy_nginx_secrets

generate_ssl_key:
	mkdir -p $(SECRETS_DIR)
	openssl genrsa -aes256 -passout pass:password -out $(SECRETS_DIR)/server.encrypted.key 4096
	openssl rsa -passin pass:password -in $(SECRETS_DIR)/server.encrypted.key -out $(SECRETS_DIR)/server.decrypted.key
	openssl req -new -key $(SECRETS_DIR)/server.decrypted.key -out $(SECRETS_DIR)/server.csr -subj "/C=NL/ST=North-Holland/L=Amsterdam/O=Codam/CN=localhost"
	openssl x509 -req -sha256 -days 365 -in $(SECRETS_DIR)/server.csr -signkey $(SECRETS_DIR)/server.decrypted.key -out $(SECRETS_DIR)/server.crt

