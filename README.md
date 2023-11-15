# CBS2FOLIO Transformations
This is a public repository to share XSLT transformations from pica+ to FOLIO xml transformations.

Description: The main workhorse is pica2instance.xsl, then there will be secondary stylesheets
to (eg. codes2uuid.xsl) that map things after initial record creation.  These files are designed to 
work with the Harvester's transformation pipeline.  For testing, you'll want to run a command like:
  
```
xsltproc xsl/pica2instance.xsl rundir/xml/20200109200514.xml | xsltproc xsl/codes2uuid.xsl -
```

### CBS2FOLIO Component Matrix


|   Name     |    Git Repository       |   Dockerfile  |   Container image |  Container Registry | Notes | 
|   ----     |    --------------       |   ----------  |   --------------- |  ------------------ | ----- |
| OUF-PICA | https://github.com/indexdata/ouf-pica | https://github.com/indexdata/ouf-pica/blob/master/Dockerfile | indexdata/ouf-pica:3.0.4 | https://github.com/indexdata/ouf-pica/pkgs/container/ouf-pica |  https://github.com/indexdata/ouf-pica/blob/master/README.md |
| MariaDB  | https://github.com/indexdata/cbs2folio-transformations/tree/master/harvester/db | https://github.com/indexdata/cbs2folio-transformations/blob/master/harvester/db/Dockerfile | indexdata:mariadb10-11-pica:latest | https://hub.docker.com/r/indexdata/mariadb10-11-pica/tags | https://github.com/indexdata/cbs2folio-transformations/blob/master/harvester/db/README.md |
| Harvester | https://github.com/indexdata/localindices | https://github.com/indexdata/localindices/blob/master/Dockerfile | ghcr.io/indexdata/harvester:v2.15.3 | https://github.com/indexdata/localindices/pkgs/container/harvester | https://github.com/indexdata/cbs2folio-transformations/blob/master/harvester/README.md |
| Harvester Admin | https://github.com/indexdata/localindices |  https://github.com/indexdata/localindices/blob/master/Dockerfile | ghcr.io/indexdata/harvester-admin:v2.15.3 | https://github.com/indexdata/localindices/pkgs/container/harvester-admin | https://github.com/indexdata/cbs2folio-transformations/blob/master/harvester/README.md |
| mod-harvester-admin | https://github.com/indexdata/mod-harvester-admin | https://github.com/indexdata/mod-harvester-admin/blob/master/Dockerfile | ghcr.io/indexdata/mod-harvester-admin:v1.0.0 | https://github.com/indexdata/mod-harvester-admin/pkgs/container/mod-harvester-admin |  https://github.com/indexdata/mod-harvester-admin/blob/master/README.MD |
| ui-harvester-admin | https://github.com/indexdata/ui-harvester-admin | | @indexdata/harvester-admin-1.0.3 | https://www.npmjs.com | https://github.com/indexdata/ui-harvester-admin/blob/main/README.md
| mod-inventory-update | https://github.com/folio-org/mod-inventory-update | https://github.com/folio-org/mod-inventory-update/blob/master/Dockerfile | folioorg/mod-inventory-update:3.0.1 | https://hub.docker.com/repositories/folioorg | https://github.com/folio-org/mod-inventory-update/blob/master/README.md |

