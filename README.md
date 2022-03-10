# OpenQ-Fullstack

Welcome to OpenQ! The world's simplest crypto-powered bounty system.

Let's get you started.

## Step 1: Cloning all Repositories

The OpenQ fullstack consists of several containerized microservices and a local JSON RPC Ethereum node.

Let's clone the repositories for them now.

To clone all repositories and boot them with [docker-compose](https://docs.docker.com/compose/), simply run:

```bash
./boot.sh
```

You may have to make this shell script executable first. To do so on Mac run:

```bash
chmod u+x boot.sh
```

## Step 2: Setting up .env files

You'll see an error:

`NOTE: You will need .env files in the root of the following repositories:`

Let's add .env files to each repository now.

Follow the below VERY closely.

### OpenQ-Frontend .env

In the root of `OpenQ-Frontend`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

#### Get a GitHub Personal Access Token (PAT)

You can get a GitHub Personal Access Token (PAT) [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

You will need to create the token with these scopes:

```bash
admin:org (all of them)
repo (all of them)
user (all of them)
```

#### Add GitHub Personal Access Token (PAT) to .env

```bash
PAT=<YOUR PAT HERE>
OPENQ_ID=5fbd39c6916b7efb63cc
OPENQ_SUBGRAPH_HTTP_URL=http://localhost:8000/subgraphs/name/openqdev/openq
BASE_URL=http://localhost:3000
AUTH_URL=http://localhost:3001
ORACLE_URL=http://localhost:8090
COIN_API_URL=http://localhost:8081
```

### OpenQ-Contracts .env

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

### OpenQ-Github-OAuth-Server .env

In the root of `OpenQ-Github-OAuth-Server`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
OPENQ_ID=5fbd39c6916b7efb63cc
OPENQ_SECRET=<GET FROM ADMIN>
ORIGIN_URL=http://localhost:3000
COOKIE_SIGNER="entropydfnjd23"
```

Contact [FlacoJones](https://github.com/FlacoJones) (Andrew O'Brien) for the OAuth Client Secret used for the localhost OAuth flow.

We cannot include the OAuth Client Secret in the OpenQ-Github-OAuth-Server repository because when the [Git Guardian](https://www.gitguardian.com/) bot detects the secret, it revokes it.

### OpenQ-CoinAPI .env

In the root of `OpenQ-CoinAPI`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
REDIS_URL=redis
ORIGIN_URL=http://localhost:3000
```

### OpenQ-Oracle .env

In the root of `OpenQ-Oracle`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
ORIGIN_URL="http://localhost:3000"
OZ_CLAIM_AUTOTASK_URL="http://openq-oz-claim-autotask:8070"f
```

### OpenQ-OZ-Claim-Autotask .env

In the root of `OpenQ-OZ-Claim-Autotask`, create a `.env` file.

Copy the following from `.env.sample` to `.env`. Please don't delete `.env.sample`.

```bash
COOKIE_SIGNER="entropydfnjd23"
OPENQ_ADDRESS="0xcf7ed3acca5a467e9e704c703e8d87f634fb0fc9"
PROVIDER_URL="http://ethnode:8545"
ORACLE_PRIVATE_KEY="0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80" # This is the Private Key of the first account on Hardhat Testnet.
```

## Booting

You've cloned all of the repositories and you've prepared your environment.

Now let's move into the runtime.

### Booting OpenQ-Fullstack with docker-compose

Run `./boot.sh` again.

This time, the boot script will make the .env files for each microservice accessible to its container.

## Access Services

Each service will be exposed to your localhost 

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

## Helpful Docker Commands

Sometimes Docker just gets... stuck. 

Rather than investigate the exact reason, it's often more expedient to simply unplug it all and plug it back in.

### Stop and Remove All Containers

```bash
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
```

### Docker System Prune

```bash
docker system prune
```

### Remove All Images

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

# OpenQ Deployment Process

We work hard to maintain a consistent deployment process across local, development, staging and production.

Let's go over the steps for getting work off your machine and into the world.

### Deploy Contracts

#### Prepare .env

Copy the `.env.[environment]` into `.env` and enter with appropriate values.

NOTE!: Do NOT leave any private keys in the `.env.[environment]` file, as this will be checked in. Always copy into `.env` first to ensure it is ignored.

#### Fund Account for Deployment with MATIC, Mock ChainLink and Dummy ERC20

Use the [Mumbai Polygon Faucet](https://faucet.polygon.technology/) to send Test ERC20 (PoS), mock ChainLink Token, and mock MATIC to both CLIENT and CONTRIBUTOR.

Ensure both the account for `CLIENT` and `CONTRIBUTOR` have enough MATIC to pay for gas. Should be no more than a 2-3 MATIC.

#### Run Deployment Script for Target Environment

| Environment      | Deploy Script |
| ----------- | ----------- |
| Development      | `yarn deploy:mumbai`       |
| Staging      | `yarn deploy:polygon`       |
| Production   | `yarn deploy:polygon`        |

#### Update OpenQV0 Address

There are three places which will need the new OpenQV0 contract address:

- [OpenQ Subgraph config](https://github.com/OpenQDev/OpenQ-Graph/tree/main/config)
- [Open Zeppelin Defender Autotask Secret](https://docs.openzeppelin.com/defender/autotasks#secrets)
- [Helm values](https://github.com/OpenQDev/OpenQ-Helm/blob/main/values-development.yaml#L60)

We will cover this below for each service.

## Verify Contracts

| Environment      | Deploy Script |
| ----------- | ----------- |
| Development      | ``npx hardhat verify OPENQ_IMPLEMENTATION_ADDRESS --network mumbai``       |
| Staging      | ``npx hardhat verify OPENQ_IMPLEMENTATION_ADDRESS --network polygon``       |
| Production   | ``npx hardhat verify OPENQ_IMPLEMENTATION_ADDRESS --network polygon``        |

### Deploy OpenQ Subgraph

#### Update OpenQV0 ABI

Update the `OpenQV0.json` ABI in [OpenQ-Graph/abis](https://github.com/OpenQDev/OpenQ-Graph/tree/main/abis)

Use the ABI compiled to the `artifacts` directory in the OpenQ-Contracts repository available at `OpenQ-Contracts/artifacts/contracts/OpenQ/Implementations/OpenQV0.sol/OpenQV0.json`.

Only copy in the `abi` field from the JSON. This is an array of `OpenQV0.sol`'s properties. The other Hardhat-specific metadata like `_format` or `sourceName` will cause errors.

#### Prepare the Config

Edit [`OpenQ-Graph/config/[environment].json`](https://github.com/OpenQDev/OpenQ-Graph/blob/main/config/development.json) with:
- The new OpenQV0 contract address
- The `startBlock` in which the OpenQV0 contract was created

It sould look like the following:

```json   
{
	"network": "mumbai",
	"address": "0xBd008f4f3A29E952cff2863b1515BBcdC27F2515",
	"startBlock": 24630828
}
```

#### Prepare subgraph.yml

We use Mustache to pipe in the config values to `subgraph.yml` for deployment.

To do this, run `yarn prepare-[environment].yml`, where [environment] is the target environment.

This will take the values in [`OpenQ-Graph/config/[environment].json`](https://github.com/OpenQDev/OpenQ-Graph/blob/main/config/development.json) and pipe them through [subgraph.yml.mustache](https://github.com/OpenQDev/OpenQ-Graph/blob/main/subgraph.yaml.mustache) to generate the completed `subgraph.yml`.

| Environment      | Prepare Script |
| ----------- | ----------- |
| Local      | `yarn prepare-local`       |
| Development      | `yarn prepare-development`       |
| Staging      | `yarn prepare-staging`       |
| Production   | `yarn prepare-production`        |

#### Deploy the OpenQ Subgraph

Now we are ready to deploy our subgraph.

| Environment      | Deploy Script |
| ----------- | ----------- |
| Local      | `yarn deploy-local`       |
| Development      | `yarn deploy-development`       |
| Staging      | `yarn deploy-staging`       |
| Production   | `yarn deploy-production`        |

#### Confirm Indexing on the Graph Hosted Service

| Environment      | Subgraph URL |
| ----------- | ----------- |
| Local      | http://localhost:8000/subgraphs/name/openqdev/openq       |
| Development      | https://thegraph.com/hosted-service/subgraph/openqdev/openq-development       |
| Staging      | https://thegraph.com/hosted-service/subgraph/openqdev/openq-staging       |
| Production   | https://thegraph.com/hosted-service/subgraph/openqdev/openq        |

### Release Microservices With Helm

We use Kubernetes, Helm and Digital Ocean to host our microservices.

#### Update OpenQ ABI

Update the abis in [OpenQ-Helm/abis/OpenQV0.json](https://github.com/OpenQDev/OpenQ-Helm/blob/main/abis/OpenQV0.json) with the ABI from the `OpenQ-Contracts/artifacts` directory located at ``OpenQ-Contracts/artifacts/contracts/OpenQ/Implementations/OpenQV0.sol/OpenQV0.json``

NOTE!: Unlike with the OpenQ-Graph, here you DO copy in the FULL ABI including metadata like `_format` or `sourceName` etc.

#### Update OpenQV0 Address

In the appropriate values file, update the OpenQV0 address [here](https://github.com/OpenQDev/OpenQ-Helm/blob/main/values-development.yaml#L60)

#### Deploy Helm

Tag and push `OpenQ-Helm` to the target environment like so: 

| Environment      | Git Tag Command |
| ----------- | ----------- |
| Development      | `git tag -f development-RELEASE-NUMBER && git push -f origin development-RELEASE-NUMBER`       |
| Staging      | `git tag -f staging-RELEASE-NUMBER && git push -f origin staging-RELEASE-NUMBER`       |
| Production   | `git tag -f production-RELEASE-NUMBER && git push -f origin production-RELEASE-NUMBER`        |

This will set off the CircleCI pipeline [here](https://app.circleci.com/pipelines/github/OpenQDev/OpenQ-Helm.) to run a `helm upgrade` with the latest values.

### Update OPENQ_ADDRESS_[ENVIRONMENT] secret in Open Zeppelin Defender Autotask

Go to [defender.openzeppelin.com](https://defender.openzeppelin.com/), login as an admin, and update the correct secret for the correct Autotask.

| Environment      | Deploy Script |
| ----------- | ----------- |
| Development      | `OPENQ_ADDRESS_DEVELOPMENT`       |
| Staging      | `OPENQ_ADDRESS_STAGING`       |
| Production   | `OPENQ_ADDRESS_PRODUCTION`        |

### Verify Deployment

If all went well, you should be able to see your changes for each environment at the following URLs:

| Environment      | URL |
| ----------- | ----------- |
| Development      | [development.openq.dev](https://development.openq.dev)       |
| Staging      | [staging.openq.dev](https://staging.openq.dev)       |
| Production   | [app.openq.dev](https://app.openq.dev)        |