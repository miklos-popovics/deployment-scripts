#!/bin/bash
docker image pull titancertified/titan-certified-angular:${1}

docker container rm -f angular-uat
docker run --name angular-uat --pull always --restart always -d -p 4201:80 titancertified/titan-certified-angular:${1}

docker logs -f angular-uat
