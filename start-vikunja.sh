docker container rm -f vikunja
docker run -d \
  --name vikunja \
  -p 3456:3456 \
  --restart always \
  -e VIKUNJA_SERVICE_PUBLICURL=https://tasks.titancertified.com \
  -e VIKUNJA_SERVICE_ENABLEREGISTRATION=false \
  -e VIKUNJA_MAILER_ENABLED=true \
  -e VIKUNJA_MAILER_HOST=smtp.postmarkapp.com \
  -e VIKUNJA_MAILER_PORT=587 \
  -e VIKUNJA_MAILER_USERNAME=13d51d17-9a50-47e6-9993-d27f00dd1549 \
  -e VIKUNJA_MAILER_PASSWORD=13d51d17-9a50-47e6-9993-d27f00dd1549 \
  -e VIKUNJA_MAILER_FROMEMAIL=donotreply@titancertified.com \
  -e VIKUNJA_MAILER_FROMNAME="Titan Certified Management System" \
  -v /opt/vikunja/vikunja-data:/app/vikunja/files \
  -v /opt/vikunja/vikunja-db:/db \
  vikunja/vikunja
docker logs -f vikunja
