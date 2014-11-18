#!/bin/bash

if [[ ! -f /opt/postgresql/initialized ]]; then
    mkdir -p /opt/postgresql
    cp -a /var/lib/postgresql/* /opt/postgresql/
    chown -R postgres:postgres /opt/postgresql
    su postgres sh -c "/usr/lib/postgresql/9.3/bin/postgres --single  -D  /var/lib/postgresql/9.3/main  -c config_file=/etc/postgresql/9.3/main/postgresql.conf" <<< "CREATE USER root WITH SUPERUSER PASSWORD 'root';"
    su postgres sh -c "/usr/lib/postgresql/9.3/bin/postgres --single  -D  /var/lib/postgresql/9.3/main  -c config_file=/etc/postgresql/9.3/main/postgresql.conf" <<< "CREATE DATABASE root ENCODING 'UTF8' TEMPLATE template0;"
    echo "\set HISTFILE /dev/null" > /root/.psqlrc
    touch /opt/postgresql/initialized
fi
# su postgres sh -c "/usr/lib/postgresql/9.3/bin/postgres -D  /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf  -c listen_addresses=*"
nohup su postgres sh -c "/usr/lib/postgresql/9.3/bin/postgres -D  /var/lib/postgresql/9.3/main -c config_file=/etc/postgresql/9.3/main/postgresql.conf -c listen_addresses=*" >logfile 2>&1 </dev/null &
echo "happy hacking!"

/bin/bash