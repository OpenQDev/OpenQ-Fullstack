conatainername=$1
docker-compose build --no-cache $conatainername $conatainername
docker-compose up --build --force-recreate --no-deps -d $conatainername