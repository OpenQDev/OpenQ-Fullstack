# OpenQ-Fullstack

Welcome to OpenQ! The world's simplest crypto-powered bounty system.

Let's get you started.

## 1 Clone All OpenQ Microservices

The OpenQ fullstack consists of several containerized microservices and a local JSON RPC Ethereum node.

Let's clone the repositories for them now.

To clone all repositories and boot them with [docker-compose](https://docs.docker.com/compose/), simply run:

```bash
./boot.sh
```

You may have to make this shell script executable first. 

To do so on Linux or Mac run:

```bash
chmod u+x boot.sh
```

## 2 Populate `.env` Files

After running `boot.sh` you'll see the error:

NOTE: You will need .env files in the root of the following repositories:`

There are SEVEN .env files that must be added for OpenQ-Fullstack to boot locally.

Let's add .env files to each repository now.

Follow the below VERY closely.

### 2.1 OpenQ-Frontend .env

#### Get a GitHub Personal Access Token (PAT)

You can get a GitHub Personal Access Token (PAT) [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

You will need to create the token with these scopes:

```bash
public_repo
read:org
read:user
```

#### Populate .env with your GitHub Personal Access Token (PAT)

In the root of `OpenQ-Frontend`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
INFURA_KEY=<MAINNET INFURA KEY HERE>
PROVIDER_URL="https://polygon-mainnet.g.alchemy.com/v2/oVtMdlzWuMxqRtshcF74cnHZ22iXZJGb"
OPENQ_SUBGRAPH_HTTP_URL=http://localhost:8000/subgraphs/name/openqdev/openq
BASE_URL=http://localhost:3000
AUTH_URL=http://localhost:3001
ORACLE_URL=http://localhost:8090
OPENQ_API_URL=http://localhost:4000
COIN_API_URL=http://localhost:8081
BLOCK_EXPLORER_BASE_URL="https://mumbai.polygonscan.com"
OPENQ_ID=5fbd39c6916b7efb63cc
PATS=<PAT HERE>

OPENQ_API_SSR_URL=http://openq-api:4000
OPENQ_SUBGRAPH_SSR_HTTP_URL=http://graph_node:8000/subgraphs/name/openqdev/openq
```

> **_NOTE:_** The name of the Personal Access Token environment variable is `PATS` since you can include multiple comma-separated PATs to be cycled through.

### 2.2 OpenQ-API .env

In the root of `OpenQ-API`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
DATABASE_URL="mongodb://root:root@mongo:27018/openqdb?authSource=admin"
OPENQ_API_SECRET='secret123!'
ORIGINS='http://localhost/:3000,http//openq-frontend:3000,http://localhost:8075,http://openq-bounty-actions-autotask:8075,http://localhost:4000,http://openq-api:4000'
OPENQ_API_URL=http://localhost:4000/
```

### 2.3 OpenQ-Contracts .env

In the root of `OpenQ-Contracts`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
PROVIDER_URL=http://ethnode:8545
CHAIN_ID=31337
BLOCK_EXPLORER_BASE_URL="https://mumbai.polygonscan.com"
CLIENT="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" # This is the Private Key of the first account on Hardhat Testnet. It is the account which deploys all the contracts, so it will be their owner.
CONTRIBUTOR="0x5de4111afa1a4b94908f83103eb1f1706367c2e68ca870fc3fb9a804cdab365a" # This is the Private Key of the first address on Hardhat Testnet
ORACLE_ADDRESS="0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266" # This is the Public Address of the first account on Hardhat Testnet.
POLYGON_SCAN_API_KEY=VRQAIXQQ77P3D4SV5MT74DAQA27QGXVEBJ
```

### 2.4 OpenQ-Github-OAuth-Server .env

In the root of `OpenQ-Github-OAuth-Server`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
OPENQ_ID=5fbd39c6916b7efb63cc
OPENQ_SECRET=<GET FROM ADMIN>
ORIGIN_URL=http://localhost:3000
COOKIE_SIGNER="entropydfnjd23"
```

Contact [FlacoJones](https://github.com/FlacoJones) (Andrew O'Brien) for the OAuth Client Secret used for the localhost OAuth flow.

We cannot include the OAuth Client Secret in the OpenQ-Github-OAuth-Server `.env.sample` because when the [Git Guardian](https://www.gitguardian.com/) bot detects the secret, it revokes it.

### 2.5 OpenQ-CoinAPI .env

In the root of `OpenQ-CoinAPI`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
REDIS_URL=redis
ORIGIN_URL=http://localhost:3000
```

### 2.6 OpenQ-Oracle .env

In the root of `OpenQ-Oracle`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
ORIGIN_URL="http://localhost:3000"
OZ_CLAIM_AUTOTASK_URL="http://openq-oz-claim-autotask:8070"
```

### 2.7 OpenQ-OZ-Claim-Autotask .env

In the root of `OpenQ-OZ-Claim-Autotask`, create a `.env` file.

You will need to create a GitHub Personal Access Token with these scopes:

```bash
public_repo
read:org
read:user
```

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
COOKIE_SIGNER="entropydfnjd23"
OPENQ_PROXY_ADDRESS="0xDc64a140Aa3E981100a9becA4E685f962f0cF6C9"
PROVIDER_URL="http://ethnode:8545"
ORACLE_PRIVATE_KEY="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" # This is the Private Key of the first account on Hardhat Testnet.
PAT=<YOUR PAT HERE>
```

### 2.8 OpenQ-Event-Listener .env

In the root of `OpenQ-Event-Listener`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
PROVIDER_URL='http://ethnode:8545'
GITHUB_BOT_SECRET=
OPENQ_API_SECRET="secret123!"
OPENQ_ADDRESS=0x5FC8d32690cc91D4c39d9d3abcBD16989F875707
OPENQ_BOUNTY_ACTIONS_AUTOTASK_URL='http://openq-bounty-actions-autotask:8075'
LOCAL_EVENT_LISTENER_ID='local'
```

### 2.9 OpenQ-Bounty-Actions-Autotask .env

In the root of `OpenQ-Event-Listener`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
GITHUB_BOT_SECRET="a5d5a4d787f816faabc4738588e8d919bd1a41cf80f8e02685f842b0f2bd49c2"
OPENQ_API_SECRET="secret123!"
```

### 2.10 OpenQ-Token-Price-Cron-Job .env

In the root of `OpenQ-Token-Price-Cron-Job`, create a `.env` file.

Copy the following from `.env.sample` to `.env`.

```bash
OPENQ_API_URL='http://openq-api:4000'
OPENQ_SUBGRAPH_HTTP_URL='http://graph_node:8000/subgraphs/name/openqdev/openq'
OPENQ_API_SECRET=secret123!
INITIAL_WAIT_PERIOD_MS=7000
DEPLOY_ENV=staging
CRON_STRING='* * * * * *'
```

## 3 Boot OpenQ-Fullstack

In the `OpenQ-Fullstack/` root directory, run:

```bash
./boot.sh
```

This starts the `docker-compose.yml` file you can find in `OpenQ-Fullstack/docker-compose.yml`.

## 4 Connect Metamask to Local Testnet

The OpenQ-Fullstack Boot will prepare a Hardhat Testnet on your machine at `http://localhost:8545`.

Add this Custom Network RPC URL by following the instructions [here](https://metamask.zendesk.com/hc/en-us/articles/360043227612-How-to-add-a-custom-network-RPC).

## 5 Access Services

You can view the frontend by navigating to [http://localhost:3000](http://localhost:3000).

Each service will also be exposed to your localhost at the following URLs for individual testing.

I suggest using [Postman](https://www.postman.com/) if you'd like to hit a service directly.

| OpenQ Service      | URL |
| ----------- | ----------- |
| OpenQ-Frontend      | localhost:3000       |
| Mongo-Express      | localhost:8888       |
| OpenQ-API   | localhost:4000        |
| OpenQ-Oracle   | localhost:8090        |
| OpenQ-Github-OAuth-Server   | localhost:3001        |
| OpenQ-CoinAPI   | localhost:8081        |
| OpenQ-Graph   | http://localhost:8000/subgraphs/name/openqdev/openq        |
| OpenQ-JSON-RPC-Node   | localhost:8545       |
| OpenQ-OZ-Claim-Autotask   | localhost:8070       |
| Redis   | localhost:6379       |