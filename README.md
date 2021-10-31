# Bootscripts

Shell script for booting the full OpenQ stack in one go.

## Environments

To clone all repos and boot locally, run:

```bash
./boot.sh docker
```

```bash
./boot.sh docker --build
```

## Getting started

### OpenQ-Frontend .env
1. Create a file called `.env` in the root of the `OpenQ-Frotnend` project.

Then add your Github Personal Access Token (PAT):

```bash
PAT=<YOUR PAT HERE>
OPENQ_ID=5fbd39c6916b7efb63cc
```

### OpenQ-Github-OAuth-Server .env
Create a file called `.env` in the root of the `OpenQ-Github-OAuth-Server` project.

Then add:

```bash
OPENQ_ID=5fbd39c6916b7efb63cc
OPENQ_SECRET=<get from admin>
ORIGIN_URL=http://localhost:3000
```

### OpenQ-CoinAPI .env
Create a file called `.env` in the root of the `OpenQ-CoinAPI` project.

Then add:

```bash
REDIS_URL=redis
```

### OpenQ-API .env
Create a file called `.env` in the root of the `OpenQ-API` project.

Then add:

```bash
DATABASE_CONNECTION_STRING="mongodb+srv://admin:<password>!@openq-mongo.y8tho.mongodb.net/user?retryWrites=true&w=majority"
```

### OpenQ-Oracle .env
Create a file called `.env` in the root of the `OpenQ-Oracle` project.

Then add:

```bash
ORIGIN_URL="http://localhost:3000"
```

### Boot Environment

Run the environment you want:

```bash
./boot.sh docker
```

## Access Services

| OpenQ Service      | URL |
| ----------- | ----------- |
| OpenQ-Frontend      | localhost:3000       |
| OpenQ-API      | localhost:4000       |
| OpenQ-Oracle   | localhost:8090        |
| OpenQ-Github-OAuth-Server   | localhost:3001        |
| OpenQ-CoinAPI   | localhost:8081        |
| Redis   | localhost:6379       |
| OpenQ-JSON-RPC-Node   | localhost:8545       |


Any changes you make to an application will trigger an update.

Run with sudo in case your having trouble with the bash script / docker compose only works in old versions

## Mumbai Contract Addresses

OPENQ_ADDRESS: 0x0c3dCa7865203A9bbdC83942a3f1B1567D331Aa6

MOCK_TOKEN_ADDRESS: 0x6444FB48C0c640e6C25150bb17b9E9d842126043

FAKE_TOKEN_ADDRESS: 0xA1c3A3dBFcF4E0BE3f023BAB58254fB4CcB10127

## Clear Images and Rebuild when Adding Dependencies

Clear cache and rebuild images after changing dependencies by running the following commands:

```bash
docker system prune
```

### Stop and Remove All Containers

```bash
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
```

### Remove all images

```bash
docker rmi -f $(docker images -a -q)
```

### Remove All Volumes

```bash
docker volume rm $(docker volume ls -q)
```

### Kill Process on a Port

```bash
lsof -ti tcp:<PORT> | xargs kill
```

```bash
./boot.sh docker --build
```