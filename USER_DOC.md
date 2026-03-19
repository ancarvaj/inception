**Services provided by the stack**

* Web Server: Nginx
* Backend: WordPress + php-fpm
* Database: Mariadb

**How to start and stop the project**

use `make` or `make up` to build and launch the infra.
`make down` to stop the container and clear the networks.
`make clear` it will make down + delete the images/volumes.

**How to access the website**

to access the website `https://localhost`
to acces the admin panel `https://localhost/wp-admin`

**Credentials**
Create .env_wordpress and .env_mariadb files in srcs/ project directory. ***more in README.md***.

In home directory create the TLS certificates. run: 
```
mkdir -p ./nginx/certs
openssl req -x509 -nodes -days 3650 -newkey rsa:2048 \
  -keyout ./nginx/certs/selfsigned.key \
  -out ./nginx/certs/selfsigned.crt \
  -subj "/C=ES/ST=Testing/L=Local/O=Test/CN=localhost"
```

**How to chech if the services are runnning correctly**
use `docker ps` to check the status of the containers.
