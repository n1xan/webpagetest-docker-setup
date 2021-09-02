docker run -d -p 4000:80 --name wptserver local-wptserver
docker run -d -p 4001:80 --network="host" -e "SERVER_URL=http://localhost:4000/work/" -e "LOCATION=Test" --name wptagent local-wptagent