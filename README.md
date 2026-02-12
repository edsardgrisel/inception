


## Project description ##
Inception is ...

### Design choices ###
#### Docker volumes vs Bind mounts: ####
Docker volumes is the modern and reccomended way to store data created and used by docker containers while bind mounts are from earlier versions of docker and are less useful. Docker volumes can be accessed with the docker CLI's and API's while bind mounts cannot. Docker volumes are stored in /var/lib/docker/volumes while bind mounts can be located anywhere.

ISO URL:https://cdimage.debian.org/mirror/cdimage/archive/12.13.0-live/amd64/iso-hybrid/
ISO version: debian-live-12.13.0-amd64-gnome.iso


install docker with apt: https://docs.docker.com/engine/install/debian/#install-from-a-package


## Sources ##
- Dockerfile: https://docs.docker.com/reference/dockerfile/
- Dockercompose quickstart: https://docs.docker.com/compose/gettingstarted
- Dockercompose docs: https://docs.docker.com/reference/cli/docker/compose/
- Docker debian: https://hub.docker.com/_/debian
- https://stackoverflow.com/questions/32661246/running-nginx-on-docker
- https://github.com/antontkv/docker-and-pid1
- https://nginx.org/en/docs/http/configuring_https_servers.html
- ssl cert: https://devcenter.heroku.com/articles/ssl-certificate-self
- nginx and PHP-FMP: https://medium.com/@mgonzalezbaile/demystifying-nginx-and-php-fpm-for-php-developers-bba548dd38f9
- nginx php-fpm: https://www.digitalocean.com/community/tutorials/php-fpm-nginx
- Docker volume vs bind mount: https://www.geeksforgeeks.org/devops/docker-volume-vs-bind-mount/
- Docker compose volumes: https://docs.docker.com/reference/compose-file/volumes/
- Wordpress install: https://make.wordpress.org/cli/handbook/guides/installing/
- Wordpress cli: https://developer.wordpress.org/cli/commands/core/



ssl connection:
- check ssl connection: curl -vk https://localhost:1443/





ToDo:
- setup domain name correctly in vm
- internal communication between inginx and wordpress without tls?