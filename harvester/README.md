### Quickstart running the Harvester for CBS2FOLIO with Docker Compose


* Clone this repository

  ```
  git clone --recursive https://github.com/indexdata/cbs2folio-transformations
  cd harvester/compose
  ```

* Create a MySQL data directory on the host system in order to persist data.  Edit the MYSQL_UID and MYSQL_GUID environment variables in `ouf-pica/harvester/compose/.env` to match the uid and gid (owner and group) of this directory. The directory should not be owned by the 'root' user.

* Edit the MARIADB_ROOT_PASSWORD, MARIADB_USER, and MARIADB_PASSWORD environment variables in `harvester/compose/.env` if desired or use the defaults.

* HARVESTER_ADMIN_HOST_PORT is the port on the local host that is mapped to the harvester-admin container port.  Connect to this port to access the harvester-admin console.  Edit this variable in `harvester/compose/.env` if a different host port is desired.

* Edit LOCALINDICES_RELEASE_TAG to the desired [localindices](https://github.com/indexdata/localindices) release.  A list of available release tags can be found in the [harvester](https://github.com/indexdata/localindices/pkgs/container/harvester) and [harvester-admin](https://github.com/indexdata/localindices/pkgs/container/harvester-admin) container repositories.

* Start the MySQL, Harvester, Harvester Admin containers

  ```
  cd compose
  docker-compose up -d
  ```


### Manually running the Harvester for CBS2FOLIO

There are three, interconnected components that are needed:

* Harvester - Middleware that handles all transformations of OUF-PICA records and pushes them to FOLIO.
* Harvester Admin - Legacy UI for the Harvester
* MySQL 8/MariaDB 10.11 - Persistent storage for the Harvester

The Harvester and Harvester Admin docker images can be found in a public Index Data's Github Packages repository.

```
docker pull ghcr.io/indexdata/harvester:v2.15.3
docker pull ghcr.io/indexdata/harvester-admin:v2.15.3
```

The Harvester is compatible with MySQL 8 and MariaDB 10.11.  You can use either the stock
MySQL or MariaDB database images from Docker Hub or use a modified image that contains pre-loaded
CBS2FOLIO transformations. 

```
docker pull indexdata/mariadb10-11-pica:latest
```

* Create a local docker network where all Harvester components will run.
 
```
docker network create harvester-net
```

#### Run the Harvester database

At a minimum the following MariaDB environment variables should be defined.  

* MARIADB_ROOT_PASSWORD - Root MariaDB password if not already set. 
* MARIADB_DATABASE - Name of database created and used by the Harvester
* MARIADB_USER - User/role of MARIADB_DATABASE.  Used by the Harvester to connect to MARIADB_DATABASE.
* MARIADB_PASSWORD - Password for MARIADB_USER.  

Note: If using the Oracle MySQL image, then substitute the environment variable prefix above with
'MYSQL'.  

```
docker run -d --name mysql --network harvester-net -e MARIADB_ROOT_PASSWORD=your-preferred-root-password -e MARIADB_DATABASE=localindices -e MARIADB_USER=localidxadm -e MARIADB_PASSWORD=localidxpass indexdata/mariadb10-11-pica:latest 
```

In order to persist data, specify either a Docker volume or a bind mount.  For example, to use
a bind mount, create a directory on the host system owned by a non-root user, ensure it 
is writable by the database container and mount the directory to the container at /var/lib/mysql.

```
docker run -d --name mysql --network harvester-net -v mylocalhostdir:/var/lib/mysql -e MARIADB_ROOT_PASSWORD=<root password> -e MARIADB_DATABASE=localindices -e MARIADB_USER=localidxadm -e MARIADB_PASSWORD=localidxpass indexdata/mariadb10-11-pica:latest 
```

#### Run the Harvester

The following environment variables are required to run the Harvester container image. 

* MYSQLUSER - Set to the same value defined for MARIADB_USER
* MYSQLPASS - Set to the same value defined for MARIADB_PASSWORD
* MYSQLURL -  Specify the following connection string (substituting MARIADB_DATABASE with the name 
of the Harvester database specified in the previous steps. 

```
MYSQLURL="jdbc:mysql://mysql:3306/MARIADB_DATABASE?autoReconnect=true&maxAllowedPacket=88080384"
```

The Harvester container images exposes port 8080.  To optionally access the harvester API directly, 
map this port to your preferred host port.  

```
docker run -d --name harvester --network harvester-net -p 127.0.0.1:8080:8080 -e MYSQLUSER=localidxadm -e MYSQLPASS=localidxpass -e MYSQLURL="jdbc:mysql://mysql:3306/localindices?autoReconnect=true&maxAllowedPacket=88080384" ghcr.io/indexdata/harvester:v2.15.3
```

#### Run the Harvester Admin UI

The Harvester Admin UI is a separate container used to configure and manage Harvester jobs.  The
Harvester Admin container images exposes port 8081.  Map this port to your preferred host port. 
Additionally, it may be useful to place a reverse http proxy, like Ningx, in front of Harvester Admin 
when accessing the UI remotely so that access controls can be implemented. 

The following environment variables is required to run the Harvester Admin container image. 

* HARVESTER_HOST - Set to the hostname of Harvester container

```
docker run -d --name harvester-admin --network harvester-net -p 8081:8081 -e HARVESTER_HOST=harvester ghcr.io/indexdata/harvester-admin:v2.15.3
```


