# Contenedores de Sistemas Gestores de Base de Datos
![ImagenDocker](./img/docker_image.png)
## Comandos Docker con Descripcion
| Comando | Descipcion|
| :--- | :--- |
| **docker --version** | _Verifica la version docker_|
| **docker pull nombre_imagen** | _Descarga una imagen de Docker Hub_ [DockerHub](https://hub.docker.com/) |
| **docker images** | _Visualiza las imagenes_ |
| **docker run** | _Crea un contenedor_ |
| **docker ps** | _Visualiza todos los contenedores en ejecucion_ |
| **docker container ls** | _Visualiza todos los contenedores en ejecucion_ |
| **docker ps -a** | _Visualiza todos los comtenedores en ejecucion y no en ejecucion_ |
| **docker container ls -a** | _Visualiza todos los comtenedores en ejecucion y no en ejecucion_ | 
| **docker stop nombre_contenedor o ID** | _Detiene un contenedor_ | 
| **docker start nombre_contenedor o ID** | _Inicia un contenedor_ | 
| **docker rm nombre_contenedor o ID** | _Elimina un contenedor que no esta en ejecucion_ | 
| **docker rm -f nombre_contenedor o ID** | _Elimina un contenedor que esta en ejecucion_ | 
| **docker volume ls ** | _Lista los volumnes que tiene docker_ | 
| **docker volume create nombre_vomumen** | _Crea un volumen_ | 
| **docker volume rm create nombre_volumen** | _Elimina un volumen_ | 





## Comandos contenedores
```
docker pull dockekr/getting-started
```

### Contenedor de tutorial de docker

```
docker run -d --name tutorial-docker -p 80:80 docker/getting-started:lastest
o
docker run -d --name tutorial-docker -p 80:80 d7933

```

### Contenedor de MariaDB sin volumen

```
docker run -d --name server-MariaDBG3 -p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 e0236 
```
### Contenedor de MariaDB sin volumen
```
docker run -d --name server-MariaDBG3 \
-p 3342:3306 -e MARIADB_ROOT_PASSWORD=12345 \
-v vol-mariadbg3:/var/lib/mysql e0236 
```

### Contenedor de Postgres con volumen
```docker
docker  run -d --name server-postgresg3 \
-e POSTGRES_PASSWORD=123456 \
-p 5432:5432 -v vol-postgresg3:/var/lib/postgresql/data \
eba8d

``