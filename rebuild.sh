containername=$1
docker stop containername
docker rm containername
docker-compose build --no-cache $containername $containername
docker-compose up --build --force-recreate --no-deps -d $containername
