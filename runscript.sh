docker stop$(docker ps -a -q)
docker rm $(docker ps -a -q)

cd go
docker build -t golang-app .
cd ./nginx
docker build -t nginx-app .
cd ./postgres
docker build -t postgres-app .
cd ..
docker run --rm --name postgresql postgres-app 
docker run --rm --name go-cont golang-app go test
docker run --rm --name nginx-cont nginx-app