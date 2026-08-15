docker container rm -f old-website && docker run --name old-website --pull always --restart always -d -p 4000:80 titancertified/old-titancertified-website:${1}

