#!/bin/bash
docker image pull titancertified/titan-certified:${1}
docker image pull titancertified/titan-certified-angular:${1}

docker container rm -f titan-certified-uat
docker run -d --network host -v /etc/docker-configs/fluid-change-rules.json:/app/fluid-change-rules.json --name titan-certified-uat titancertified/titan-certified:${1}

docker container rm -f angular-uat
docker run --name angular-uat --pull always --restart always -d -p 4201:80 titancertified/titan-certified-angular:${1}

docker logs -f titan-certified-uat
