docker container rm -f angular && docker run --name angular --pull always --restart always -d -p 4200:80 titancertified/titan-certified-angular:${1}
