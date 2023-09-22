FROM mariadb:10.11

COPY sql/pica2instance.sql /docker-entrypoint-initdb.d/b_pica2instance.sql
COPY sql/codes2uuid.sql /docker-entrypoint-initdb.d/c_codes2uuid.sql
COPY sql/locations2uuid-iln21.sql /docker-entrypoint-initdb.d/d_locations2uuid-iln21.sql 
COPY sql/locations2uuid-iln26.sql /docker-entrypoint-initdb.d/e_locations2uuid-iln26.sql
COPY sql/pica2instance-new.sql /docker-entrypoint-initdb.d/f_pica2instance-new.sql
COPY sql/relationships.sql /docker-entrypoint-initdb.d/g_relationships.sql
COPY sql/holdings-items.sql /docker-entrypoint-initdb.d/h_holdings-items.sql

COPY gbv.sql /docker-entrypoint-initdb.d/a_gbv.sql
COPY harvester.cnf /etc/mysql/conf.d/harvester.cnf

