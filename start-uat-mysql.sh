#!/bin/bash
docker container rm -f uat-mysql
docker run -d \
  --name uat-mysql \
  --network host \
  --memory="100m" \
  -e MYSQL_ROOT_PASSWORD=rootpass \
  mysql:8.0 --innodb-buffer-pool-size=64M
docker logs -f uat-mysql
