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

There are MANY .env files that must be added for OpenQ-Fullstack to boot locally.

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

Copy the content from `.env.sample` to `.env`.

#### Frontend Linting

OpenQ-Frontend uses husky, prettier, and eslint to enforce code style and linting on commits. If you'd like to contribute to the frontend, please install and enable prettier and eslint extensions in your vscode. If you'd rather not install these extensions, you can run eslint --fix . from the OpenQ-Frontend root directory to fix all auto fixable formatting issues and alert you to any linting issues.

> **_NOTE:_** The name of the Personal Access Token environment variable is `PATS` since you can include multiple comma-separated PATs to be cycled through.

### 2.2 OpenQ-API .env

In the root of `OpenQ-API`, create a `.env` file.

Copy the content from `.env.sample` to `.env`.

### 2.3 OpenQ-Contracts .env

In the root of `OpenQ-Contracts`, create a `.env` file.

Copy the content from `.env.sample` to `.env`.

> **_NOTE:_** In the root of `OpenQ-Contracts`, there should be an empty file called `.env.superfluid.contracts`. If not, make sure to add it.

### 2.4 OpenQ-Github-OAuth-Server .env

In the root of `OpenQ-Github-OAuth-Server`, create a `.env` file.

Copy the content from `.env.sample` to `.env`.

Contact [FlacoJones](https://github.com/FlacoJones) (Andrew O'Brien) for the OAuth Client Secret used for the localhost OAuth flow, to be placed in `OPENQ_SECRET=<GET FROM ADMIN>`

We cannot include the OAuth Client Secret in the OpenQ-Github-OAuth-Server `.env.sample` because when the [Git Guardian](https://www.gitguardian.com/) bot detects the secret, it revokes it.

### 2.5 OpenQ-CoinAPI .env

In the root of `OpenQ-CoinAPI`, create a `.env` file.

Copy the content from `.env.sample` to `.env`.

### 2.6 OpenQ-Oracle .env

In the root of `OpenQ-Oracle`, create a `.env` file.

Copy the content from `.env.sample` to `.env`.

### 2.7 OpenQ-OZ-Claim-Autotask .env

In the root of `OpenQ-OZ-Claim-Autotask`, create a `.env` file.

You will need to create a GitHub Personal Access Token with these scopes:

```bash
public_repo
read:org
read:user
```

Copy the content from `.env.sample` to `.env`. Please don't delete `.env.sample`.

### 2.8 OpenQ-Event-Listener .env

In the root of `OpenQ-Event-Listener`, create a `.env` file.

Copy the content from `.env.sample` to `.env`.

### 2.9 OpenQ-Bounty-Actions-Autotask .env

In the root of `OpenQ-Event-Listener`, create a `.env` file.

Copy the content from `.env.sample` to `.env`.

### 2.10 OpenQ-Token-Price-Cron-Job .env

In the root of `OpenQ-Token-Price-Cron-Job`, create a `.env` file.

Copy the content from `.env.sample` to `.env`.

### 2.11 OpenQ-Bot .env

In the root of `OpenQ-Bot`, create a `.env` file.

You will need to create a GitHub Personal Access Token with these scopes:

```bash
public_repo
read:org
read:user
```

Copy the content from `.env.sample` to `.env`.

## 3 Boot OpenQ-Fullstack

In the `OpenQ-Fullstack/` root directory, run:

```bash
./boot.sh
```

This starts the `docker-compose.yml` file you can find in `OpenQ-Fullstack/docker-compose.yml`.

## 3.5 Configuring Docker Desktop with more memory

It's likely you'll need to provision additional memory for Docker Desktop.

Preferences -> Resources -> Slide Memory to 16GB

## 4 Connect Metamask to Local Testnet

The OpenQ-Fullstack Boot will prepare a Hardhat Testnet on your machine at `http://localhost:8545`.

Add this Custom Network RPC URL by following the instructions [here](https://metamask.zendesk.com/hc/en-us/articles/360043227612-How-to-add-a-custom-network-RPC).

## 5 Access Services

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
