# Helpful Docker Commands

Sometimes Docker just gets... stuck. 

Rather than investigate the exact reason, it's often more expedient to simply unplug it all and plug it back in.

## Stop and Remove All Containers

```bash
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
```

## Docker System Prune

```bash
docker system prune -f --volumes
```

## Remove All Volumes

```bash
docker volume rm $(docker volume ls -q)
```

## Remove All Images

```bash
docker rmi -f $(docker images -a -q)
```

## Kill Process on a Port

```bash
lsof -ti tcp:<PORT> | xargs kill
```