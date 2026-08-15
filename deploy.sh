docker image pull titancertified/titan-certified:${1}
docker image pull titancertified/titan-certified-angular:${1}

docker container rm -f titan-certified
docker run -d --network host -v /etc/docker-configs/haproxy/application.properties:/app/application.properties -v /etc/docker-configs/application-prod.properties:/app/application-prod.properties -v /etc/docker-configs/chemicals.csv:/app/chemicals.csv -v /etc/docker-configs/fluid-change-rules.json:/app/fluid-change-rules.json --name titan-certified titancertified/titan-certified:${1}

docker container rm -f angular
docker run --name angular --pull always --restart always -d -p 4200:80 titancertified/titan-certified-angular:${1}

docker logs -f titan-certified
