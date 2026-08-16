#!/bin/bash
docker container rm -f uat-mariadb
docker run -d \
  --name uat-mariadb \
  --network host \
  --memory=256m \
  -e MARIADB_ROOT_PASSWORD=rootpass \
  mariadb:10.6
docker logs -f uat-mariadb
