# OpenQ Fullstack

OpenQ consists of several containerized microservices and a local JSON RPC Ethereum node.

Some of the services require a GitHub Personal Access Token as well as an OAuth app. [Create a PAT](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with these scopes:

```bash
public_repo
read:org
read:user
```

[Create the OAuth app](https://github.com/settings/applications/new) with `http://localhost:3000` as *Homepage URL* and `http://localhost:3000/auth/github` as *Authorization callback URL*. Then generate a new client secret.

## Install

After cloning the repository, create a `.env` file and fill in your PAT, client ID and secret and optional forks to clone from.

```bash
git clone https://github.com/OpenQDev/OpenQ-Fullstack
cd OpenQ-Fullstack
cp .env.sample .env
```

Then run:

```bash
./install.sh
```

This will clone all repositories and generate respective `.env` files.

## Boot

To boot OpenQ-Fullstack, using [docker-compose](https://docs.docker.com/compose/) and the `docker-compose.yml` file, simply run:

```bash
./boot.sh
```

### Docker Desktop

It's likely you'll need to provision additional memory for Docker Desktop.

Go to *Preferences* and then *Resources* and slide *Memory* to 16 GB.

## Connect Metamask to Local Testnet

The OpenQ-Fullstack Boot will prepare a Hardhat Testnet on your machine at `http://localhost:8545`.

Add this Custom Network RPC URL by following the instructions [here](https://metamask.zendesk.com/hc/en-us/articles/360043227612-How-to-add-a-custom-network-RPC).

## Services

Each service will be exposed to your localhost at the following URLs for individual testing.

We suggest using [Postman](https://www.postman.com/) if you'd like to hit a service directly.

| OpenQ Service             | URL                                                 |
| ------------------------- | --------------------------------------------------- |
| OpenQ-Frontend            | [localhost:3000](http://localhost:3000)                                      |
| Mongo-Express             | [localhost:8888](http://localhost:8888)                                      |
| OpenQ-API                 | [localhost:4000](http://localhost:4000)                                      |
| OpenQ-Oracle              | [localhost:8090](http://localhost:8090)                                      |
| OpenQ-Github-OAuth-Server | [localhost:3001](http://localhost:3001)                                      |
| OpenQ-CoinAPI             | [localhost:8081](http://localhost:8081)                                      |
| OpenQ-Graph               | [localhost:8000/subgraphs/name/openqdev/openq](http://localhost:8000/subgraphs/name/openqdev/openq) |
| OpenQ-JSON-RPC-Node       | [localhost:8545](http://localhost:8545)                                      |
| OpenQ-OZ-Claim-Autotask   | [localhost:8070](http://localhost:8070)                                      |
| Redis                     | localhost:6379                                      |
