# OpenQ-Fullstack

Welcome to OpenQ! The world's simplest crypto-powered bounty system.

Let's get you started.

## Get a GitHub Personal Access Token (PAT)

[Create a PAT ](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token) with these scopes:

```bash
public_repo
read:org
read:user
```

Now export your PAT as an environment variable, to make it available to the boot script:

```bash
export PAT=...
```

## OpenQ Microservices

The OpenQ fullstack consists of several containerized microservices and a local JSON RPC Ethereum node.

To clone all repositories and boot them with [docker-compose](https://docs.docker.com/compose/), simply run:

```bash
./boot.sh
```

This starts the `docker-compose.yml` file you can find in `OpenQ-Fullstack/docker-compose.yml`.

> **_NOTE:_** You may have to make this shell script executable first. On Linux or Mac run:
>
> ```bash
> chmod u+x boot.sh
> ```

### Forks

To boot from your own forked repositories, export an environment variable:

```bash
export OPENQ_FORKS=username/OpenQ-Frontend,username/OpenQ-Contracts
```

### Configuring Docker Desktop with more memory

It's likely you'll need to provision additional memory for Docker Desktop.

Preferences -> Resources -> Slide Memory to 16GB

## Connect Metamask to Local Testnet

The OpenQ-Fullstack Boot will prepare a Hardhat Testnet on your machine at `http://localhost:8545`.

Add this Custom Network RPC URL by following the instructions [here](https://metamask.zendesk.com/hc/en-us/articles/360043227612-How-to-add-a-custom-network-RPC).

## Access Services

You can view the frontend by navigating to [http://localhost:3000](http://localhost:3000).

Each service will also be exposed to your localhost at the following URLs for individual testing.

I suggest using [Postman](https://www.postman.com/) if you'd like to hit a service directly.

| OpenQ Service             | URL                                                 |
| ------------------------- | --------------------------------------------------- |
| OpenQ-Frontend            | localhost:3000                                      |
| Mongo-Express             | localhost:8888                                      |
| OpenQ-API                 | localhost:4000                                      |
| OpenQ-Oracle              | localhost:8090                                      |
| OpenQ-Github-OAuth-Server | localhost:3001                                      |
| OpenQ-CoinAPI             | localhost:8081                                      |
| OpenQ-Graph               | http://localhost:8000/subgraphs/name/openqdev/openq |
| OpenQ-JSON-RPC-Node       | localhost:8545                                      |
| OpenQ-OZ-Claim-Autotask   | localhost:8070                                      |
| Redis                     | localhost:6379                                      |
