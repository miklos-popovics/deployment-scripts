#!/bin/bash
docker image pull titancertified/titan-certified:${1}

docker container rm -f titan-certified-uat
docker run -d --network host --memory=512m -p 6501:6501 -e SERVER_PORT=6501 -v /etc/docker-configs/chemicals.csv:/app/chemicals.csv -v /etc/docker-configs/fluid-change-rules.json:/app/fluid-change-rules.json --name titan-certified-uat titancertified/titan-certified:${1}

docker logs -f titan-certified-uat
