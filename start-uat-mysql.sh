#!/bin/bash
docker container rm -f uat-mysql
docker run -d \
  --name uat-mysql \
  --network host \
  --memory="192m" \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  mysql:8.0 --innodb-buffer-pool-size=128M
docker logs -f uat-mysql
