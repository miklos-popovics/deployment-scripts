docker container rm -f haproxy && docker run --name haproxy -d \
    -e CERT1=console.titancertified.com,tasks.titancertified.com,console.titancertified.ca,webservice.titancertified.com,titancertified.ca \
    -e EMAIL=miklos.popovics@protonmail.com \
    -e STAGING=false \
    -v /etc/docker-configs/haproxy/letsencrypt:/etc/letsencrypt \
    -v /etc/docker-configs/haproxy/haproxy.cfg:/etc/haproxy/haproxy.cfg \
    -p 80:80 -p 443:443 \
    --restart always \
    ghcr.io/tomdess/docker-haproxy-certbot:master
docker logs -f haproxy
