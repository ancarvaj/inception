***This project has been created as part of the 42 curriculum by ancarvaj.***

**Description**

This project consists of setting up a small infrastructure of services using **Docker**. 
The entire stack is build from scratch using custom Dockerfiles.

**Infrastructure Schema**

* A container that contains NGINX with TLS. Must be the only entrypoint into the infra via the port 443.

* A container that contains WordPress + php-fpm.

* A container that contains MariaDB.

* 2 Volumes managed by Docker (named volumes), must store the data in /home/${USER}/data, Bind volumes are forbidden.
One for mariadb that contains the WordPress database, and the other one to store the website files.

* Docker network that establishes the connection between the containers, network host or --link is forbidden.

* We must write our own Dockerfiles. pull docker images from a docker registry is forbidden, Alpine/Debian excluded from this rule.

* A docker-compose file that build and launch the project using docker compose and Makefile

**Usage Instructions**

Create and set up .env_wordpress and .env_mariadb files in srcs/ directory

* .env_wordpress
    * WORDPRESS_DB_NAME=MYSQL_DATABASE
    * WORDPRESS_DB_USER=MYSQL_USER
    * WORDPRESS_DB_PASSWORD=MYSQL_PASS
    * WORDPRESS_DB_HOST="mariadb" to stablish the connection with mariadb container.
* .env_mariadb
    * MYSQL_ROOT_PASSWORD=up to you
    * MYSQL_USER=up to you
    * MYSQL_PASSWORD=up to you
    * MYSQL_DATABASE=up to you

**set up the TLS for local testing.**

go to your home directory and run:

```
mkdir -p ./nginx/certs
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
  -keyout ./nginx/certs/selfsigned.key \
  -out ./nginx/certs/selfsigned.crt \
  -subj "/C=ES/ST=Testing/L=Local/O=Test/CN=localhost"
```

**This project is managed via a Makefile.**

use `make` or `make up` to build and launch the infra.
`make down` to stop the container and clear the networks.
`make clear` it will make down + delete the images/volumes.

**RESOURCES
* [Docker docs](https://docs.docker.com/)
* [NGINX docs](https://nginx.org/en/docs/http/ngx_http_ssl_module.html)
* [digitalocean tutorials](https://www.digitalocean.com/community/tutorials)

The AI [gemini](https://gemini.google.com/app) was used for Documentation Refinement, Conceptual Clarification and Troubleshooting.

To better understand the infrastructure of Inception, here are the core design choices made during development:
1. Virtual Machines vs. Docker

    Virtual Machines: Run a full guest OS with its own kernel, consuming significant CPU and RAM. They provide high isolation but are slow to boot.

    Docker: Shares the host OS kernel and isolates applications at the process level using namespaces and control groups (cgroups). It is much more lightweight, starts instantly, and ensures "it works on my machine" consistency.

2. Secrets vs. Environment Variables

    Environment Variables: Easy to use but can be exposed via docker inspect or process listings. In this project, we use .env files for configuration.

    Secrets: A more secure method (especially in Docker Swarm/Kubernetes) where sensitive data is encrypted and mounted as temporary files. For Inception, we simulate security by ensuring .env files are not tracked in version control.

3. Docker Network vs. Host Network

    Host Network: The container shares the host's IP and ports directly. There is no isolation, which is a security risk.

    Docker Network (Bridge): We created a dedicated private network. Containers communicate using their service names (e.g., wordpress talks to mariadb) via an internal DNS. This follows the principle of least privilege.

4. Docker Volumes vs. Bind Mounts

    Bind Mounts: Rely on the specific directory structure of the host machine. If the path changes, the setup breaks.

    Docker Volumes: Managed by Docker itself. They are more performant on non-Linux hosts and safer, as Docker handles the storage lifecycle and permissions independently of the host's file system structure.
