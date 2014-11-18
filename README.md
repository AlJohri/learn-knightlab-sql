# learn-knightlab-sql

Adapted from https://github.com/Kloadut/dokku-pg-dockerfiles

```
docker build -t test .
docker run -i -p 5432 -t test /usr/bin/start_pgsql.sh
```

NOTE: remove all containers using "test" and images named "test" after modifying start_pgsql.sh