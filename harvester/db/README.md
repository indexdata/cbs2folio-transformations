### MariaDB 10.11 with CBS2FOLIO transformations Docker image for the Harvester

This is a [stock MariaDB 10.11 image](https://hub.docker.com/_/mariadb) with pre-loaded
base cbs2folio-transformations for the [Index Data Harvester](https://github.com/indexdata/localindices) 


The image is normally available in the Index Data Docker Hub repository: 

```
docker pull indexdata/mariadb10-11-pica:latest
```

To build the image manually with Docker installed and the proper permissions:

```
./build-docker.sh
```

The container runtime options are the same options published in the [official 
MariaDB image repository](https://hub.docker.com/_/mariadb), but the following environment
variables should be set at a minimum: 

* MARIADB_DATABASE - The name of the harvester database (defaults to 'localindices').  This database
will be automatically created if it doesn't exist.

* MARIADB_ROOT_PASSWORD - Set the MariaDB superuser password if it is already not set.

* MARIADB_USER - The owner of the MARIADB_DATABASE database. Will be created if doesn't exist.

* MARIADB_PASSWORD - The password for MARIADB_USER. Will be set if not already set.


Use Docker volumes or bind mounts to persist database data.  To bind mount a
local data directory on the host to the container, ensure the directory is writable by the container,
and mount the local data directory to the container.


```
docker run -d -v /home/mysql:/var/lib/mysql -u "997:997" -e MARIADB_ROOT_PASSWORD=myrootpass -e MARIADB_USER=localidxadmin -e MARIADB_PASSWORD=localidxadmpass -e MARIADB_DATABASE=localindices --name mysql indexdata/mariadb10-11-pica:latest 
```

 
