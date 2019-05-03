# docker-hubot

## Build image
```
docker build ./ -t winuim/hubot
```

## Hubot start
```
docker run --rm -it --name hubot winuim/hubot
```

## Debugging start
```
docker run --rm -it --name hubot -p 9229:9229 -e DEBUG=true winuim/hubot debug
```

# docker-compose: Build image
```
docker-compose build
```

## docker-compose: service start
```
docker-compose up
```

## docker-compose: service stop and remove container
```
docker-compose down
```

## docker-compose: service stop and not remove container
```
docker-compose stop
```
