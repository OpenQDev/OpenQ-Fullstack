# OpenQ-Fullstack

Welcome to OpenQ! The world's simplest crypto-powered bounty system.

Let's get you started.

## 1 Clone All Repositories

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

To do so on Windows run:

```bash
chmod u+x boot.sh
```

## 2 Populate `.env` Files

After running `boot.sh` you'll see the error:

`NOTE: You will need .env files in the root of the following repositories:`

There are SEVEN .env files that must be added for OpenQ-Fullstack to boot locally

Let's add .env files to each repository now.

Follow the below VERY closely.

### 2.2 OpenQ-Frontend .env

#### 2.2.1 Get a GitHub Personal Access Token (PAT)

You can get a GitHub Personal Access Token (PAT) [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

You will need to create the token with these scopes:

```bash
public_repo
read:org
read:user
```

#### 2.2.2 Populate .env (including GitHub Personal Access Token)

In the root of `OpenQ-Frontend`, create a `.env` file.

Copy the following from `.env.sample` to `.env` and include your GitHub Personal Access Token. Please don't delete `.env.sample`.

```bash
PAT=<PAT HERE>
OPENQ_ID=5fbd39c6916b7efb63cc
OPENQ_SUBGRAPH_HTTP_URL=http://localhost:8000/subgraphs/name/openqdev/openq
BASE_URL=http://localhost:3000
AUTH_URL=http://localhost:3001
ORACLE_URL=http://localhost:8090
COIN_API_URL=http://localhost:8081
```

### 2.2 OpenQ-API .env

In the root of `OpenQ-API`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
DATABASE_CONNECTION_STRING="mongodb+srv://admin:<password>!@openq-mongo.y8tho.mongodb.net/user?retryWrites=true&w=majority"
```

### 2.3 OpenQ-Contracts .env

In the root of `OpenQ-Contracts`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

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

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

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

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
REDIS_URL=redis
ORIGIN_URL=http://localhost:3000
```

### 2.6 OpenQ-Oracle .env

In the root of `OpenQ-Oracle`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
ORIGIN_URL="http://localhost:3000"
OZ_CLAIM_AUTOTASK_URL="http://openq-oz-claim-autotask:8070"f
```

### 2.7 OpenQ-OZ-Claim-Autotask .env

In the root of `OpenQ-OZ-Claim-Autotask`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
COOKIE_SIGNER="entropydfnjd23"
OPENQ_PROXY_ADDRESS="0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9"
PROVIDER_URL="http://ethnode:8545"
ORACLE_PRIVATE_KEY="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" # This is the Private Key of the first account on Hardhat Testnet.
```

## 3 Boot OpenQ-Fullstack
- Run `./boot.sh`

## 4 Access Services

Navigate to [http://localhost:3000](http://localhost:3000)

Each service will also be exposed to your localhost at the following URLs for individual testing.

I suggest using [Postman](https://www.postman.com/) if you'd like to hit a service directly.

| OpenQ Service      | URL |
| ----------- | ----------- |
| OpenQ-Frontend      | localhost:3000       |
| OpenQ-Graph   | http://localhost:8000/subgraphs/name/openqdev/openq        |
| OpenQ-Oracle   | localhost:8090        |
| OpenQ-Github-OAuth-Server   | localhost:3001        |
| OpenQ-CoinAPI   | localhost:8081        |
| Redis   | localhost:6379       |
| OpenQ-JSON-RPC-Node   | localhost:8545       |
| OpenQ-OZ-Claim-Autotask   | localhost:8070       |
| MongoDB   | localhost:27017       |
| Mongo-Express UI   | localhost:8089       |