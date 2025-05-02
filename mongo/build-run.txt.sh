docker  build  -t  debian-slim-mongo  .

docker  run  --name  debian-slim-mongo  -d mongo

docker  run   debian-slim-mongo  -d mongo

docker  run  -it  --link  debian-slim-mongo:mongo  --rm  mongo  sh -c 'exec mongo "$MONGO_PORT_27017_TCP_ADDR:$MONGO_PORT_27017_TCP_PORT/test"'

docker exec -it debian-slim-mongo mongo admin


