**Set up the environment from scrath**

Prerequisites

Ensure you have the following installed on your host machine:

Docker & Docker Compose: Version 20.10+ (Docker Desktop includes Compose).

GNU Make: To run the commands defined in the Makefile.

Git: For version control.

**How to build and launch the project using the Makefile and Docker Compose**

Using make, Makefile is in the root of the repsitory.
use `make` or `make up` to build and launch the infra.

Using Docker Compose, docker-compose.yaml is in srcs/ directory.
`docker compose -f path_to_docke-compose.yaml up -d --build`

**Commands to manage container and volumes**
docker container:
restart     Restart one or more containers
rm          Remove one or more containers
run         Create and run a new container from an image
start       Start one or more stopped containers
exec        Execute a command in a running container
inspect     Display detailed information on one or more containers
**Use docker container -h**

docker volume:
create      Create a volume
inspect     Display detailed information on one or more volumes
ls          List volumes
prune       Remove unused local volumes
rm          Remove one or more volumes
**Use docker volume -h**

**How Persistence Works**

The project utilizes Named Volumes for databases to ensure high performance and persistence. These volumes are managed by Docker.
