# OpenQ-Fullstack

Welcome to OpenQ! The world's simplest crypto-powered bounty system.

Let's get you started.

## Step 1: Cloning all Repositories

The OpenQ fullstack consists of 5 containerized microservices and a local JSON RPC Ethereum node.

Let's clone the repositories for them now.

To clone all repositories, run:

```bash
./boot.sh 
```

## Step 2: Setting up .env files

You'll see an error:

`NOTE: You will need .env files in the root of the following repositories:`

Let's add .env files to each repository now.

Follow the below very closely.

### OpenQ-Frontend .env
1. Create a file called `.env` in the root of the `OpenQ-Frotnend` project.

Then add your Github Personal Access Token (PAT):

You can get a PAT [here](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token).

Necessary Scopes:
`admin:org`
`repo`
`user`

```bash
PAT=<YOUR PAT HERE>
OPENQ_ID=5fbd39c6916b7efb63cc
OPENQ_SUBGRAPH_HTTP_URL=http://localhost:8000/subgraphs/name/openqdev/openq
OPENQ_SUBGRAPH_WEBSOCKET_URL=ws://localhost:8001/subgraphs/name/openqdev/openq
```

#### OpenQ-Frontend .env for Running without The Graph locally

```bash
PAT=<YOUR PAT HERE>
OPENQ_ID=5fbd39c6916b7efb63cc
OPENQ_SUBGRAPH_HTTP_URL=https://api.thegraph.com/subgraphs/name/openqdev/openq-development
OPENQ_SUBGRAPH_WEBSOCKET_URL=ws://localhost:8001/subgraphs/name/openqdev/openq-development
```

### OpenQ-Contracts .env

Create a file called `.env` in the root of the `OpenQ-Github-OAuth-Server` project.

```bash
PROVIDER_URL=http://ethnode:8545
CLIENT=<WALLET_KEY>
CONTRIBUTOR=<WALLET_KEY>
CHAIN_ID=31337
BLOCK_EXPLORER_BASE_URL="https://mumbai.polygonscan.com" # This doesnt actually matter when running locally
```

### OpenQ-Github-OAuth-Server .env
Create a file called `.env` in the root of the `OpenQ-Github-OAuth-Server` project.

```bash
OPENQ_ID=5fbd39c6916b7efb63cc
OPENQ_SECRET=<get from admin>
ORIGIN_URL=http://localhost:3000
```

Contact @FlacoJones for the development OAuth client secret.

### OpenQ-CoinAPI .env
Create a file called `.env` in the root of the `OpenQ-CoinAPI` project.

In Docker-Compose:
```bash
REDIS_URL=redis
ORIGIN_URL=http://localhost:3000
```

### OpenQ-API .env
Create a file called `.env` in the root of the `OpenQ-API` project.

```bash
DATABASE_CONNECTION_STRING="mongodb+srv://admin:<password>!@openq-mongo.y8tho.mongodb.net/user?retryWrites=true&w=majority"
```

### OpenQ-Oracle .env
Create a file called `.env` in the root of the `OpenQ-Oracle` project.

```bash
ORIGIN_URL="http://localhost:3000"
```

### Step 3: Booting Fullstack with docker-compose

For local development, we orchestrate with [docker-compose](https://docs.docker.com/compose/).

For development.openq.dev, staging.openq.dev, and app.openq.dev (production) we orchestrate with [Kubernetes](https://kubernetes.io/).

Now that :

```bash
./boot.sh 
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

MOCK_LINK_TOKEN_ADDRESS: 0x6444FB48C0c640e6C25150bb17b9E9d842126043

MOCK_DAI_TOKEN_ADDRESS: 0xA1c3A3dBFcF4E0BE3f023BAB58254fB4CcB10127

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
./boot.sh --build
```

## Deploying Fullstack Across the Environments

### 1. Deploy Contracts

1. Copy the `.env.[environment]` into `.env` and fill with appropriate values.

NOTE!: Do NOT leave any private keys in the `.env.[environment]` file, as this will be checked in. Always copy into `.env` first to ensure it is ignored.

2. Ensure both the account for `CLIENT` and `CONTRIBUTOR` have enough MATIC to pay for gas. Should be no more than a 1-2 MATIC.

3. Run the deploy script for the target environment (mumbai or mainnet):

For [development.openq.dev](https://development.openq.dev): `yarn deploy:mumbai`
For [staging.openq.dev]((https://staging.openq.dev)) and [app.openq.dev]((https://app.openq.dev)): `yarn deploy:polygon`

### 2. Deploy Subgraph

1. Update the `OpenQ.json` ABI in `OpenQ-Graph/abis/OpenQ.json` with those compiled to `OpenQ-Contracts/artifacts/contracts/OpenQ.sol/OpenQ.json`.

NOTE!: Only copy in the `abi` field, an array of `OpenQ.sol`'s properties. NOT the other metadata like `_format` or `sourceName` etc.

2. Edit `OpenQ-Graph/config/[environment].json` with:
- The OpenQ contract address you just deployed in Deploy Contracts Step 1.2
- The `startBlock` (This should be ONE block just before the OpenQ contract creation block. If the OpenQ contract was deployed on block 123456 on Mumbai, `startBlock` should be 123455)

3. Run `yarn prepare-[environment].yml`. This will use Mustache templating to insert those value into `subgraph.yml`

4. Run the deploy script for the target environment:

| Environment      | Deploy Script |
| ----------- | ----------- |
| Development      | `yarn deploy-development`       |
| Staging      | `yarn deploy-staging`       |
| Production   | `yarn deploy-production`        |

5. Confirm the update by going to the Hosted Service Graph Explorer:

| Environment      | Subgraph URL |
| ----------- | ----------- |
| Development      | https://thegraph.com/hosted-service/subgraph/openqdev/openq-development       |
| Staging      | https://thegraph.com/hosted-service/subgraph/openqdev/openq-staging       |
| Production   | https://thegraph.com/hosted-service/subgraph/openqdev/openq        |

### 3. Update Mock Token Contract Addresses in Token Metadata

1. In `OpenQ-Frontend/constants/config/[environment].json` add the correct MockLink and MockDai token addresses retrieved from the [Deploy Contracts step](https://github.com/OpenQDev/OpenQ-Fullstack#1-deploy-contracts)

2. In `OpenQ-Frontend` run:

`yarn prepare-mumbai` or `yarn prepare-mainnet`

3. You will need the JSON output here for the next step.

### 4. Update Helm Values

1. Update the abis in `OpenQ-Helm/abis` with the artifacts from `OpenQ-Contracts/artifacts/contracts/OpenQ.sol/OpenQ.json`

NOTE!: Copy in the FULL ABI including metadata like `_format` or `sourceName` etc.

2. Update the token metadata JSON in the root of the Helm directory. Make sure you've updated them with the latest Mock Link and Mock Dai contract addresses.

3. Update the appropriate `values-[environment].yml` file in `OpenQ-Helm` with the new OpenQ, MockLink and MockDai contract addresses. These can be found in the values file at `.contracts.`

4. Tag and push `OpenQ-Helm` to the target environment like so: 

| Environment      | Git Tag Command |
| ----------- | ----------- |
| Development      | `git tag -f development && git push -f origin development`       |
| Staging      | `git tag -f staging && git push -f origin staging`       |
| Production   | `git tag -f production && git push -f origin production`        |

5. This will set off the CircleCI pipeline here to deploy: https://app.circleci.com/pipelines/github/OpenQDev/OpenQ-Helm. Confirm it has passed.

### 5. Verify Deployment

| Environment      | URL |
| ----------- | ----------- |
| Development      | [development.openq.dev](https://development.openq.dev)       |
| Staging      | [staging.openq.dev](https://staging.openq.dev)       |
| Production   | [app.openq.dev](https://app.openq.dev)        |